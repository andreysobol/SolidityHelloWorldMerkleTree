pragma solidity >=0.8.0 <0.9.0;

contract HelloWorldMerkleTree {
   
    mapping(uint256 => mapping(uint256 => bytes32)) internal tree;
    mapping(uint256 => bytes32) internal zero_consts;

    function play() public {
        
        //Init consts
        zero_consts[0] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        zero_consts[1] = sha256(bytes.concat(zero_consts[0], zero_consts[0]));
        zero_consts[2] = sha256(bytes.concat(zero_consts[1], zero_consts[1]));
        
        // Values:
        tree[0][0] = 0xae248190d583930687a52e2ea07d13c4ca2a6b1c9bf701f5b0417cf453020612;
        tree[0][1] = 0x8a200c44e26a6733105e427ade918dac551ff8a819eb1153a342d7526de2b6a0;
        tree[0][2] = 0x66b41bb613e41736d2b05cf92b7c16d39c627cabb313de6ee64906bbe2ddf9c5;
        tree[0][3] = 0x50eb0a1ffd67af1f574c00d0bcd550feb6fc27823914347aeb7c4238158a6651;

        //Leafs
        tree[1][0] = sha256(bytes.concat(tree[0][0], tree[0][1]));
        tree[1][1] = sha256(bytes.concat(tree[0][2], tree[0][3]));

        //Root
        tree[2][0] = sha256(bytes.concat(tree[1][0], tree[1][1]));
        
        //Add one more level
        tree[2][1] = zero_consts[2];
        
        //New root
        tree[3][0] = sha256(bytes.concat(tree[2][0], tree[2][1]));

    }

}

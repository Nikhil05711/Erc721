pragma solidity 0.8.0;
contract register{
   mapping(address => string) public userType;
   
    address  public owner;
     
     constructor() public {
        owner = msg.sender;
    }
    
    function isRegistered(address _userAddress) internal view returns (bool){
      if(keccak256(abi.encodePacked(userType[_userAddress])) == keccak256(abi.encodePacked(""))){
          return false;
        }
      else {
          return true;
        }
     }

    function userRegisteration(string memory _Type) public returns (bool){
        require(!isRegistered(msg.sender), "ERROR : User already registered");
        userType[msg.sender] = _Type;
     }
     
     function UserType(address _address) public returns(string memory){
         require(isRegistered(_address), "ERROR : User already registered");
         return userType[_address];
     }
     
    //  function testIsRegistered() public returns (uint256 gasUsed){
    //   uint256 startGas = gasleft();
    //   gasUsed = startGas - gasleft();
    //   return gasUsed;
    //  }
     
    //  function testUserRegisteration() public returns (uint256 gasUsed){
    //      uint256 startGas = gasleft();
    //      userRegisteration("nikhil");
    //      gasUsed = startGas - gasleft();
    //      return gasUsed;
    //  }
     
    //  function testgetUserType() public returns (uint256 gasUsed){
    //      uint256 startGas = gasleft();
    //      getUserType(msg.sender);
    //      gasUsed = startGas - gasleft();
    //      return gasUsed;
    //  }
}

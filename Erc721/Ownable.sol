pragma solidity 0.8.0;
contract Ownable{

  address public sponsor;

  event OwnershipTransferred(address indexed previousSponsor,address indexed newSponsor);

  constructor(){
    sponsor = msg.sender;
    }
  modifier onlySponsor(){
    require(msg.sender == sponsor); _;
  }

  function transferOwnership(address _newSponsor)public onlySponsor{
    require(_newSponsor != address(0), "CANNOT_TRANSFER_TO_ZERO_ADDRESS");
    emit OwnershipTransferred(sponsor, _newSponsor);
    sponsor = _newSponsor;
  }

}
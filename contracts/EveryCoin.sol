pragma solidity ^0.4.24;
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
//import "../node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";
//import "../node_modules/zeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
//import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract EveryCoin is PausableToken  {
    string  public  constant name = "EveryCoin";
    string  public  constant symbol = "EYC";
    uint8   public  constant decimals = 12;
    uint256   public  totalSupply = 0;
    modifier validDestination( address to )
    {
        require(to != address(0x0));
        require(to != address(this));
        _;
    }

    function everyCoin( address _admin, uint _totalTokenAmount ) 
    {
        address admin = _admin;
        totalSupply = _totalTokenAmount;
        balances[msg.sender] = _totalTokenAmount;
        emit Transfer(address(0x0), msg.sender, _totalTokenAmount);
    }
    function transfer(address _to, uint _value) validDestination(_to) returns (bool) 
    {
        return super.transfer(_to, _value);
    }
    function transferFrom(address _from, address _to, uint _value) validDestination(_to) returns (bool) 
    {
        return super.transferFrom(_from, _to, _value);
    }
    event Burn(address indexed _burner, uint _value);
    function burn(uint _value) returns (bool)
    {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(msg.sender, _value);
        emit Transfer(msg.sender, address(0x0), _value);
        return true;
    }
    function burnFrom(address _from, uint256 _value) returns (bool)  
    {
        assert( transferFrom( _from, msg.sender, _value ) );
        return burn(_value);
    }
    function emergencyERC20Drain( ERC20 token, uint amount ) onlyOwner {
        token.transfer( owner, amount );
    }
    event AdminTransferred(address indexed previousAdmin, address indexed newAdmin);
    function changeAdmin(address newAdmin) onlyOwner {
        emit AdminTransferred(admin, newAdmin);
        address admin = newAdmin;
    }
}

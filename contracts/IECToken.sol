// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IECToken is ERC20, Pausable, Ownable {
    constructor() ERC20("IECToken", "IEC") {
        _mint(msg.sender, 1000*10**decimals());
    }}
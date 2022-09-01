// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

const IECToken = await hre.ethers.getContractFactory("IECToken");
const Token = await IECToken.deploy();
await Token.deployed();
console.log("IECToken Contract Deploy here: ",Token.address);

const IECNFT = await hre.ethers.getContractFactory("IECNFT");
const NFT = await IECNFT.deploy(Token.address);
await NFT.deployed();
console.log("IECNFT Contract Deploy here: ",NFT.address);
 }

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
// IECToken Contract Deploy here:  0x3Cb33D74Ae5bfB94ff9Fa0462C663976b194A67d
// IECNFT Contract Deploy here:  0x7Efe8aE266A3F44c34600A01661F572610D4E278

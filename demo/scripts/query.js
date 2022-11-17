// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const Lock = await hre.ethers.getContractFactory("Lock");

  const lock = await Lock.deploy(1234567892221, {value: 12345});

  await lock.deployed();
  console.log(`address: ` + lock.address);
  const c =  Lock.attach(lock.address);
  const t = await c.unlockTime();

  console.log(
    `time ${t}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

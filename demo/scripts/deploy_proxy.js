// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const provider = ethers.getDefaultProvider("http://127.0.0.1:8545")

  const Proxy = await hre.ethers.getContractFactory("Proxy");
  const proxy = await Proxy.deploy();

  await proxy.deployed();

  console.log(
    `Proxy deployed to ${proxy.address}`
  );
  const imp = await provider.getStorageAt(proxy.address, 0);
  console.log("impl: " + imp);

  const Store = await hre.ethers.getContractFactory("Store");
  const p = Store.attach(proxy.address);
  const tx = await p.add();
  const r = await tx.wait(1);
  // console.log("receipt:", r)
  // const tx2 = await p.add();
  // const r2 = await tx2.wait(1);
  // console.log(r2);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

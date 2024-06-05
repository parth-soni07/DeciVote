// import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

// const JAN_1ST_2030 = 1893456000;
// const ONE_GWEI: bigint = 1_000_000_000n;

// const LockModule = buildModule("LockModule", (m) => {
//   const unlockTime = m.getParameter("unlockTime", JAN_1ST_2030);
//   const lockedAmount = m.getParameter("lockedAmount", ONE_GWEI);

//   const lock = m.contract("Lock", [unlockTime], {
//     value: lockedAmount,
//   });

//   return { lock };
// });

// export default LockModule;

import { ethers } from "hardhat";

async function main() {
  const nft = await ethers.deployContract("NFT");

  await nft.waitForDeployment();
  console.log("NFT Contract Deployed at: " + nft.target);
}

main().catch((error) => {
  console.log(error);
  process.exitCode = 1;
});

import { ethers, hardhatArguments, run } from "hardhat";
import { getIMXAddress, getEnv, sleep } from "./utils";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying Contract with the account:", deployer.address);
    console.log("Account Balance:", (await deployer.getBalance()).toString());

    if (!hardhatArguments.network) {
        throw new Error("please pass --network");
    }

    const KyzanClanz = await ethers.getContractFactory("KyzanClanz");
    const kyzanClanz = await KyzanClanz.attach("0x2191f7f10d7180255337cc4ac24d915c913174c3")
    console.log(await kyzanClanz._burn(4))
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

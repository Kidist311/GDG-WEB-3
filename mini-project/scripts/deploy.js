async function main() {
    const Wallet = await ethers.getContractFactory("StudentSavingsWallet");
    const wallet = await Wallet.deploy();
    await wallet.deployed();
    console.log("StudentSavingsWallet deployed to:", wallet.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

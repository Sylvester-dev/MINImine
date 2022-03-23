const hre = require("hardhat");

async function main() {
  const gameContractFactory = await hre.ethers.getContractFactory("MyEpicGame");
  const gameContract = await gameContractFactory.deploy(
    ["Melee","FireSword","Axe","Dungeon","Bow","PickAxe"], //name
    ["QmdkNsVEfw71WyPGFkCuMY6S7V8CaquZdWJuUPoD3XYEMD","QmXzgMzMRzacLvAHhG3h7GnqZJ8pzzsDbZBGXkWQbC7Gej","QmNvgFNU6PeoDz28Bjx9N9Cj8TRnNrogzLq4upyFNoAVZr","QmYQAgA1mdz3aV4F8x4ZrgjRxu2R1hoocQHYu59mU3n6Fr","QmVGoH7PBksSRnEEGrjMLjjtfpe6bhNX7N2Lujcz1gn8B4","QmRkyY2gzogaoXrBiJRUbPkCJV97Zd67XEQPemNT6Dg1xK"], //image
    ["400","500","700","850","1000","1050"], //hp
    ["550","500","300","250","200","150"], //damageAttk
    "Ender Dragon", // Boss name
    "https://media.giphy.com/media/ULrKidU8vdK12/giphy.gif", // Boss image
    100000, // Boss hp
    50 //attackdmg
  );

  await gameContract.deployed();

  console.log("MINImine game deployed to:", gameContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

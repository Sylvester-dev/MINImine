const hre = require("hardhat");

async function main() {
  const gameContractFactory = await hre.ethers.getContractFactory("MyEpicGame");
  const gameContract = await gameContractFactory.deploy(
    ["Spidy","Dranuka","Vistara","Monika"], //name
    ["https://tse3.mm.bing.net/th?id=OIP.4Rw5n1NNmxiIgpeaEmCD4wHaEK&pid=Api&P=0&w=285&h=161","https://www.desktopanimated.com/wp-content/uploads/2014/01/Terrifying_Monsters_1.jpg","https://i.pinimg.com/736x/b9/e4/06/b9e40634f8f5ef839765e7c4f7a04d0c.jpg","https://wallpapercave.com/wp/q4C93CD.jpg"], //image
    ["500","700","850","1000"], //hp
    ["500","300","250","200"], //damageAttk
    "Nezz", // Boss name
    "https://tse2.mm.bing.net/th?id=OIP.Cj9kf24dHS9XTzkRQ3XfCQHaEo&pid=Api&P=0&w=262&h=164", // Boss image
    10000, // Boss hp
    50 //attackdmg
  );

  await gameContract.deployed();

  console.log("Monster game deployed to:", gameContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

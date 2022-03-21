# The Slugterra Land
Mint your Slug to Fight to protect the people from corrupt slug in this turn-based NFT browser game.

The game is based on a famous television series *Slugterra*. It's made with help of Ethereum smart contracts (a piece of code that lives on the Ethereum blockchain). As its deployed to the blockchain, anyone in the world with a computer or smart phone can access it, run the smart contract, and play the game. The client website allows players to connect their Ethereum wallets and play the game!

The goal of the game is to **Kill. The. Boss**. 🗡 ☠️ 🔪

* Players begin by minting a character NFT. Each minted character has a certain *HP* and *Attack Damage*.
* Players command their character to attack the Final Boss and inflict damage. Watch out: the Boss fights back!
* Each character NFT has its attributes (like HP, damage, etc.) stored directly as part of the NFT.
* An unlimited number of NFTs of each character can be minted

## How to Play
1. Go the the [game site](slugterranftgame.3lv.repl.co/)
2. Connect your metamask wallet with rinkeby network
3. Choose a character NFT to mint
4. Work together to fight The Final Boss, *The Goon*   

<!-- ### Choose Your Fighter
* *MightyChondria* fights for science
* *IcedCovfefe* represents The Gays™️
* *TransPride* fights for our right to party
* *CriticalRaceTheory* fights for liberation
* *Textbook* fights against revisionist history -->

Each character NFT has the following attributes:
* Image
* Name
* HP value
* Attack Damage value

### How to Win
Players must work together to attack the boss and kill it by draining its HP to 0. Moral of the story: we can't do this alone.

## Rules
* Each player can only have 1 NFT character in their wallet
* If a character's HP goes below zero, it dies >>> GAME OVER.

# Development
## Dev Tools
* Ethereum blockchain
* OpenSea or Rarible NFT marketplaces
* [HardHat](https://hardhat.org/tutorial/setting-up-the-environment.html)
* OpenZeppelin
* IPFS

To install HardHat (to compile and test smart contracts locally), you must have node/npm. After downloading & installing npm, create & move into the directory for your game, initialize npm, & install HardHat:
```
npm init -y
npm install --save-dev hardhat
```

## Staging & Testing 
### Tools
* OpenSea TestNets
* MyCrypto ETH faucet
* Rinkeby TestNet & [TestNet Explorer](https://rinkeby.etherscan.io/)
* AlchemyAPI 
* MetaMask ETH wallet
* Replit/VScode

### Updating Smart Contracts
When making changes to immutable smart contracts, you must...
* re-deploy (which will reset all variables & lose all NFT data): `npx hardhat run scripts/deploy.js --network rinkeby`
* update the contract address (from the console log) on the frontend: change `contractAddress` in `constants.js`
* then update the ABI file on the frontend (just copy from `artifacts/contracts/<game>.sol/<game>.json`)

### Working on features
* To display a leaderboard
* Give multiple attack option like power and surprise attack





<!-- 

App.js - Waiting to see if the user has a minted NFT
SelectCharacter Component - Waiting for our character NFT to mint
Arena Component - Waiting for an attack action to finish  -->

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./libraries/Base64.sol";

import "hardhat/console.sol";

contract MyEpicGame is ERC721{
    struct characterEnergy{
      uint id;
      string name;
      string image;
      uint hp;
      uint maxhp;
      uint attackdmg;
    }
    struct boss{
      string name;
      string image;
      uint hp;
      uint maxhp;
      uint attackdmg;
    }

    boss public bigBoss;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    characterEnergy[] defaultCharacters;

    mapping(uint256 => characterEnergy) nftHolderEnergy;
    mapping(address => uint256) nftHolder;

    constructor(string[] memory characterName, string[] memory characterImage, uint[] memory characterHp, uint[] memory characterAttackdmg,
    string memory bossName, string memory bossImage, uint bossHp, uint bossAttackdmg) ERC721("Monster","MONS") {
      
        bigBoss = boss({
          name:bossName,
          image: bossImage,
          hp: bossHp,
          maxhp: bossHp,
          attackdmg: bossAttackdmg
        });
        
        console.log("Done initializing boss %s w/ HP %s, img %s", bigBoss.name, bigBoss.hp, bigBoss.image);

        for(uint i=0;i<characterName.length;i++){
          defaultCharacters.push(characterEnergy({
            id:i,
            name:characterName[i],
            image:characterImage[i],
            hp:characterHp[i],
            maxhp:characterHp[i],
            attackdmg:characterAttackdmg[i]
          }));
          characterEnergy memory m = defaultCharacters[i];
          console.log("Created %s w/ HP %s, img %s", m.name, m.hp, m.image);
        }
          _tokenIds.increment();
        }

        function mintMonsterNFT(uint _characterIndex) external{
          uint256 newItemId = _tokenIds.current();
          _safeMint(msg.sender, newItemId);
          nftHolderEnergy[newItemId] = characterEnergy({
          id: _characterIndex,
          name: defaultCharacters[_characterIndex].name,
          image: defaultCharacters[_characterIndex].image,
          hp: defaultCharacters[_characterIndex].hp,
          maxhp: defaultCharacters[_characterIndex].maxhp,
          attackdmg: defaultCharacters[_characterIndex].attackdmg
    });
     console.log("Minted MONS NFT w/ tokenId %s and characterIndex %s", newItemId, _characterIndex);
     nftHolder[msg.sender]=newItemId;
     _tokenIds.increment();
        }

  function attackBoss() public {
  // Get the state of the player's NFT.
      uint256 nftTokenIdOfPlayer = nftHolder[msg.sender];
      characterEnergy storage player = nftHolderEnergy[nftTokenIdOfPlayer];
      console.log("\nPlayer w/ character %s about to attack. Has %s HP and %s AD", player.name, player.hp, player.attackdmg);
      console.log("Boss %s has %s HP and %s AD", bigBoss.name, bigBoss.hp, bigBoss.attackdmg);
        // Make sure the player has more than 0 HP.
        require (
          player.hp > 0,
          "Error: character must have HP to attack boss."
        );

        // Make sure the boss has more than 0 HP.
        require (
          bigBoss.hp > 0,
          "Error: boss already dead."
        );

          // Allow player to attack boss.
        if (bigBoss.hp < player.attackdmg) {
          bigBoss.hp = 0;
        } else {
          bigBoss.hp = bigBoss.hp - player.attackdmg;
        }
        
        // Allow boss attacking player.
        if (player.hp < bigBoss.attackdmg) {
          player.hp = 0;
        } else {
          player.hp = player.hp - bigBoss.attackdmg;
        }
        
        // Console for ease.
        console.log("Player attacked boss. New boss hp: %s", bigBoss.hp);
        console.log("Boss attacked player. New player hp: %s\n", player.hp);
  }
  //The tokenURI actually has a specific format! It's actually expecting the NFT data in JSON so we use base64
    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        characterEnergy memory charAttributes = nftHolderEnergy[_tokenId];

        string memory strHp = Strings.toString(charAttributes.hp);
        string memory strMaxHp = Strings.toString(charAttributes.maxhp);
        string memory strAttackDamage = Strings.toString(charAttributes.attackdmg);

        string memory json = Base64.encode(
          abi.encodePacked(
            '{"name": "',
            charAttributes.name,
            ' -- NFT #: ',
            Strings.toString(_tokenId),
            '", "description": "This is an NFT that lets people play in the game Metaverse Slayer!", "image": "',
            charAttributes.image,
            '", "attributes": [ { "trait_type": "Health Points", "value": ',strHp,', "max_value":',strMaxHp,'}, { "trait_type": "Attack Damage", "value": ',
            strAttackDamage,'} ]}'
          )
        );

        string memory output = string(
          abi.encodePacked("data:application/json;base64,", json)
        );
        
        return output;
      }
    } 
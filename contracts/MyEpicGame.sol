//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MyEpicGame {
    struct characterEnergy{
      uint id;
      string name;
      string image;
      uint hp;
      uint maxhp;
      uint attackdmg;
    }

    characterEnergy[] defaultCharacters;
    constructor(string[] memory characterName, string[] memory characterImage, uint[] memory characterHp, uint[] memory characterAttackdmg) {
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
        console.log("Gameeeeee :)");
    } 
}
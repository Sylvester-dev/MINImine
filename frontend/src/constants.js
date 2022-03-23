const CONTRACT_ADDRESS = '0xf53e1760b899D3D86BCBA73a21c3e706755392E2';

const transformCharacterData = (characterData) => {
  return {
    name: characterData.name,
    image: characterData.image,
    hp: characterData.hp.toNumber(),
    maxhp: characterData.maxhp.toNumber(),
    attackdmg: characterData.attackdmg.toNumber(),
  };
};

export { CONTRACT_ADDRESS,transformCharacterData };
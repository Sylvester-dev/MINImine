const CONTRACT_ADDRESS = '0xB1781327C8b1a74E2588B0218A668B35aDfD0b64';

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
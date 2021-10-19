// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;
import "./ZombieFactory.sol";

contract ZombieFeeding is ZombieFactory {
	address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;

	KittyInterface kittyContract = KittyInterface(ckAddress);

	/**
	 * @dev A function that allows a function to multiply after feeding on another life form
	 * @param _zombieId The id of the zombie multiplying
	 * @param _targetDna The dna of the life form that the zombie is feeding on
	 */
	function feedAndMultiply(
		uint256 _zombieId,
		uint256 _targetDna,
		string memory _species
	) public {
		require(
			msg.sender == zombieToOwner[_zombieId],
			"Only the owner of the zombie can call this function"
		);

		Zombie storage myZombie = zombies[_zombieId];

		uint256 _targetDnaModulo = _targetDna % dnaModulus;
		uint256 newDna = (myZombie.dna + _targetDnaModulo) / 2;

		if (keccak256(bytes(_species)) == keccak256(bytes("kitty"))) {
			newDna = newDna - (newDna % 100) + 99;
		}

		_createZombie("NoName", newDna);
	}

	function feedOnKitty(uint256 _zombieId, uint256 _kittyId) public {
		uint256 kittyDna;

		(, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);

		feedAndMultiply(_zombieId, kittyDna, "kitty");
	}
}

interface KittyInterface {
	function getKitty(uint256 _id)
		external
		view
		virtual
		returns (
			bool isGestating,
			bool isReady,
			uint256 cooldownIndex,
			uint256 nextActionAt,
			uint256 siringWithId,
			uint256 birthTime,
			uint256 matronId,
			uint256 sireId,
			uint256 generation,
			uint256 genes
		);
}

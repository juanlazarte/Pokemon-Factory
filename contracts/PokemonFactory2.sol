// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract PokemonFactoryNew {
    struct Pokemon {
        string name;
        uint id;
    }

    struct Skills {
        string name;
        string description;
    }

    mapping(uint => address) public idToOwner; //(el pokemon con id x pertenece a tal address)
    mapping(address => uint) public cantOfOwner; //para ver cuantos pokemos tiene cada dueño 
    mapping(uint => Skills[]) public skillToPokemon; //para dependiendo el id agregrale skill

    Pokemon[] pokemon;

    function createPokemon(string memory _name, uint _id) public {
        require(_id > 0, "No puede crear un Pokemon con Id 0");
        pokemon.push(Pokemon(_name, _id));
        idToOwner[_id] = msg.sender;
        cantOfOwner[msg.sender]++;
    }

    function setSkills(string memory _name, string memory _description, uint _pokemonId) public {
        skillToPokemon[_pokemonId].push(Skills(_name, _description));
    }

    function getPokemon() external view returns(Pokemon[] memory) {
        return pokemon;
    }

    function getSkills(uint _pokemonId) external view returns(Skills[] memory) {
        return skillToPokemon[_pokemonId];
    }

}
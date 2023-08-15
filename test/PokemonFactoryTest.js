const { ethers } = require("hardhat")
const { expect } = require("chai")

describe("PokemonFactory2", function () {
    it("La fabrica no tiene pokemones", async function () {
        const Factory = await ethers.getContractFactory("PokemonFactoryNew");
        const factory = await Factory.deploy()

        const arrayPokemon = await factory.getPokemon();

        expect(arrayPokemon.length).to.equal(0)
    })
})
const { expect } = require("chai");

describe("SpotiFil", function () {
    it("SpotiFil", async function () {
        const [owner] = await ethers.getSigners();

        const SpotiFil = await ethers.getContractFactory("SpotiFil");

        const spotiFil = await SpotiFil.deploy();

        expect(await spotiFil.owner()).to.equal(owner.address);
    });
});

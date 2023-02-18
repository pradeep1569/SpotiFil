// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Spotifil {
    struct ISong {
        string name;
        string fileURI;
    }

    struct ICollection {
        string collectionName;
        string collectionImageHash;
        ISong[] songs;
    }

    address public owner;
    uint256 public counter;
    ICollection[] public collections;
    mapping(uint256 => ICollection) public collection;

    constructor() {
        counter = 1;
        owner = msg.sender;
    }

    function addCollection(ICollection memory _collection) public {
        require(owner == msg.sender, "Only Owner Can Access");
        collection[counter].collectionName = _collection.collectionName;
        collection[counter].collectionImageHash = _collection.collectionImageHash;

        uint256 length = _collection.songs.length;
        for (uint256 i = 0; i < length; i += 1) {
            collection[counter].songs.push(
                ISong(_collection.songs[i].name, _collection.songs[i].fileURI)
            );
        }
        collections[counter] = collection[counter];
        counter++;
    }

    function updateCollectionImage(uint256 _id, string memory _imageHash) public {
        require(owner == msg.sender, "Only Owner Can Access");
        collection[_id].collectionImageHash = _imageHash;
    }

    function getAllCollections() public view returns (ICollection[] memory) {
        return collections;
    }

    function getCollectionById(uint256 _collectionId)
        public
        view
        returns (ICollection memory _collection)
    {
        return collection[_collectionId];
    }
}

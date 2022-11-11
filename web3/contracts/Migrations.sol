// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Farmer {
    struct ListingDetails {
        string crop;
        uint256 quantity;
        uint256 price;
        string postedDate;
    }

    struct FarmerDetails {
        address id;
        string displayName;
        int64 reputations;
        string phoneNumber;
        ListingDetails[] listings;
    }

    mapping(address => FarmerDetails) listOfFarmers;

    function createFarmer(string memory name, string memory phoneNumber)
        public
    {
        listOfFarmers[msg.sender] = FarmerDetails(
            msg.sender,
            name,
            0,
            phoneNumber,
            new details[](0)
        );
    }

    function increaseReputation(address farmerId) public {
        listOfFarmers[farmerId].reputations++;
    }

    function decreaseReputation(address farmerId) public {
        listOfFarmers[farmerId].reputations--;
    }

    function addListing(
        string memory crop,
        uint256 quantity,
        uint256 price,
        string memory postedDate
    ) public {
        require(
            listOfFarmers[msg.sender].id == msg.sender,
            "Only a farmer can have a listing"
        );
        listOfFarmers[msg.sender].listings.push(
            ListingDetails(crop, quantity, price, postedDate)
        );
    }

    function removeListing(uint256 index) public {
        require(
            listOfFarmers[msg.sender].id == msg.sender,
            "Only a farmer can remove a listing"
        );
        delete listOfFarmers[msg.sender].listings[index];
    }

    struct ListingWithMoreInfo {
        address farmerId;
        string crop;
        uint256 quantity;
        uint256 price;
        string postedDate;
        string farmerName;
        int64 reputations;
        string phoneNumber;
    }

    // function to get the list of all listings of a specific crop
    function getListings(string memory crop)
        public
        view
        returns (ListingWithMoreInfo[] memory)
    {
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](0);
        // loop through all the farmers and find the listings of the crop
        for (uint256 i = 0; i < listOfFarmers.length; i++) {
            for (uint256 j = 0; j < listOfFarmers[i].listings.length; j++) {
                if (
                    keccak256(
                        abi.encodePacked(listOfFarmers[i].listings[j].crop)
                    ) == keccak256(abi.encodePacked(crop))
                ) {
                    listings.push(
                        ListingWithMoreInfo(
                            listOfFarmers[i].id,
                            listOfFarmers[i].listings[j].crop,
                            listOfFarmers[i].listings[j].quantity,
                            listOfFarmers[i].listings[j].price,
                            listOfFarmers[i].listings[j].postedDate,
                            listOfFarmers[i].displayName,
                            listOfFarmers[i].reputations,
                            listOfFarmers[i].phoneNumber
                        )
                    );
                }
            }
        }
        return listings;
    }

    // function to get the list of all listings of a specific farmer
    function getListingsOfFarmer(address farmerId)
        public
        view
        returns (ListingWithMoreInfo[] memory)
    {
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](0);
        for (uint256 i = 0; i < listOfFarmers[farmerId].listings.length; i++) {
            listings.push(
                ListingWithMoreInfo(
                    listOfFarmers[farmerId].id,
                    listOfFarmers[farmerId].listings[i].crop,
                    listOfFarmers[farmerId].listings[i].quantity,
                    listOfFarmers[farmerId].listings[i].price,
                    listOfFarmers[farmerId].listings[i].postedDate,
                    listOfFarmers[farmerId].displayName,
                    listOfFarmers[farmerId].reputations,
                    listOfFarmers[farmerId].phoneNumber
                )
            );
        }
        return listings;
    }

    // function to get the list of all listings
    function getAllListings()
        public
        view
        returns (ListingWithMoreInfo[] memory)
    {
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](0);
        for (uint256 i = 0; i < listOfFarmers.length; i++) {
            for (uint256 j = 0; j < listOfFarmers[i].listings.length; j++) {
                listings.push(
                    ListingWithMoreInfo(
                        listOfFarmers[i].id,
                        listOfFarmers[i].listings[j].crop,
                        listOfFarmers[i].listings[j].quantity,
                        listOfFarmers[i].listings[j].price,
                        listOfFarmers[i].listings[j].postedDate,
                        listOfFarmers[i].displayName,
                        listOfFarmers[i].reputations,
                        listOfFarmers[i].phoneNumber
                    )
                );
            }
        }
        return listings;
    }
}

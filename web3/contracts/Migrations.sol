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
    address[] public farmerAccts;

    function createFarmer(string memory name, string memory phoneNumber)
        public
    {
        listOfFarmers[msg.sender] = FarmerDetails(
            msg.sender,
            name,
            0,
            phoneNumber,
            new ListingDetails[](0)
        );
        farmerAccts.push(msg.sender);
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
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](
            farmerAccts.length
        );
        // loop through all the farmers and find the listings of the crop
        for (uint256 i = 0; i < farmerAccts.length; i++) {
            FarmerDetails memory farmer = listOfFarmers[farmerAccts[i]];
            for (uint256 j = 0; j < farmer.listings.length; j++) {
                ListingDetails memory listing = farmer.listings[j];
                if (keccak256(abi.encodePacked(listing.crop)) ==
                    keccak256(abi.encodePacked(crop))) {
                    listings[i] = ListingWithMoreInfo(
                        farmer.id,
                        listing.crop,
                        listing.quantity,
                        listing.price,
                        listing.postedDate,
                        farmer.displayName,
                        farmer.reputations,
                        farmer.phoneNumber
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
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](
            farmerAccts.length
        );
        // get the listings of a particular farmer
        FarmerDetails memory farmer = listOfFarmers[farmerId];
        for (uint256 j = 0; j < farmer.listings.length; j++) {
            ListingDetails memory listing = farmer.listings[j];
            listings[j] = ListingWithMoreInfo(
                farmer.id,
                listing.crop,
                listing.quantity,
                listing.price,
                listing.postedDate,
                farmer.displayName,
                farmer.reputations,
                farmer.phoneNumber
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
        ListingWithMoreInfo[] memory listings = new ListingWithMoreInfo[](
            farmerAccts.length
        );
        // loop through all the farmers and find the listings of the crop
        for (uint256 i = 0; i < farmerAccts.length; i++) {
            FarmerDetails memory farmer = listOfFarmers[farmerAccts[i]];
            for (uint256 j = 0; j < farmer.listings.length; j++) {
                ListingDetails memory listing = farmer.listings[j];
                listings[i] = ListingWithMoreInfo(
                    farmer.id,
                    listing.crop,
                    listing.quantity,
                    listing.price,
                    listing.postedDate,
                    farmer.displayName,
                    farmer.reputations,
                    farmer.phoneNumber
                );
            }
        }
        return listings;
    }
}

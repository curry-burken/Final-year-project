// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProductContract {
    struct Product {
        address manufacturer;
        string productName;
        string productBrand;
        string productCode;
        string batchNumber;
        string manufacturingDate;
        string expiryDate;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount = 0;

    event ProductAdded(uint256 productId, address indexed manufacturer);

    function addProduct(
        string memory productName,
        string memory productBrand,
        string memory productCode,
        string memory batchNumber,
        string memory manufacturingDate,
        string memory expiryDate
    ) public {
        productCount++;
        products[productCount] = Product({
            manufacturer: msg.sender,
            productName: productName,
            productBrand: productBrand,
            productCode: productCode,
            batchNumber: batchNumber,
            manufacturingDate: manufacturingDate,
            expiryDate: expiryDate
        });

        emit ProductAdded(productCount, msg.sender);
    }
}

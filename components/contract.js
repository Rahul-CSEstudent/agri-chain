var address = "0xc7a6a78c2266360e00a62d3140cfa4c752e046fb";
var abi = require("./abi.json");
import Web3 from "web3"

const loadWeb3 = async () => {
    if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
    } else if (window.web3) {
        window.web3 = new Web3(window.web3.currentProvider);
    } else {
        window.alert(
            "Non-Ethereum browser detected. You should consider trying MetaMask!"
        );
    }

};

async function getContract() {
    const web3 = window.web3;
    const contract = new web3.eth.Contract(abi, address);
    return contract;
}


export { abi, address, getContract, loadWeb3 };
import { ethers } from "ethers";
import poolabi from "../contracts/PoolABI.json";

const poolAbi = poolabi;
const provider = new ethers.providers.Web3Provider(window.ethereum);


const WrappedAvaxAddress = "0xd00ae08403B9bbb9124bB305C09058E32C39A48c";
const USDCAddress = "0x8c0f5Ade9cBdb19a49B06aDFB67b6702B459162B";
const USDTAddress = "0x791B0c848AD79549F950f69E6E4CF9e3C112a230";

const tokenAbi = [
    "function balanceOf(address) view returns (uint)",
    "function transfer(address to, uint amount)",
    "function approve(address spender, uint256 amount)",
]

const wrappedContract = new ethers.Contract(WrappedAvaxAddress, tokenAbi, provider);

await tokenContract.balanceOf("0x203560aCa0Aa5AAc09d9708CE29b60Aa3E4366A8");

const poolAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

const poolContract = new ethers.Contract(poolAddress, poolAbi, provider);

//get Donation List
await poolContract.getDonationList();



//formatting token decimals: WAVAX and USDT
ethers.utils.formatUnits(balance, 18)

//USDC token formatting
ethers.utils.formatUnits(balance, 6)
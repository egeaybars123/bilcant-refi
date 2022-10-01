import { ethers } from "ethers";
import poolabi from "../contracts/PoolABI.json";

const poolAbi = poolabi;
const provider = new ethers.providers.Web3Provider(window.ethereum);
const contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

const poolContract = new ethers.Contract(contractAddress, poolAbi, provider);

//get Donation List
await poolContract.getDonationList();

//formatting token decimals: WAVAX and USDT
ethers.utils.formatUnits(balance, 18)

//USDC token formatting
ethers.utils.formatUnits(balance, 6)
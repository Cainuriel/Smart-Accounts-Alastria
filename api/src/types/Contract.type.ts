import { InterfaceAbi } from "ethers";

export default interface Contract {
  name: string;
  address: string;
  abi: InterfaceAbi;
}

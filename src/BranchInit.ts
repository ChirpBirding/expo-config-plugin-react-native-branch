import { requireNativeModule } from "expo-modules-core";

const BranchInit = requireNativeModule("BranchInit");

//iOS only
export async function initSession(): Promise<void> {
  return await BranchInit.initSession();
}

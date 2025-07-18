import { requireNativeModule } from "expo-modules-core";
import { Platform } from "react-native";

const BranchInit =
  Platform.OS === "ios" ? requireNativeModule("BranchInit") : null;

export async function initSession(): Promise<void> {
  if (!BranchInit) {
    return Promise.reject(new Error("initSession is only supported on iOS"));
  }
  return await BranchInit.initSession();
}

import ExpoModulesCore
import RNBranch
import os.log

public class BranchInitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("BranchInit")
    
    AsyncFunction("initSession") { (promise: Promise) in
      os_log("BranchInitModule: initSession called from JS", type: .info)
      DispatchQueue.main.async {
        let launchOptions = BranchAppDelegate.getCachedLaunchOptions()
        os_log("BranchInitModule: Retrieved launch options: %@", type: .info, String(describing: launchOptions))
        RNBranch.initSession(launchOptions: launchOptions, isReferrable: true)
        os_log("BranchInitModule: RNBranch.initSession completed", type: .info)
        promise.resolve(nil)
      }
    }
  }
}

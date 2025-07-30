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
        os_log("BranchInitModule: Retrieved launch options: %{public}@", type: .info, String(describing: launchOptions))
        RNBranch.initSession(launchOptions: launchOptions, isReferrable: true)
        
        if let cachedParams = BranchAppDelegate.getCachedOpenUrlParams() {
          os_log("BranchInitModule: call RNBranch.application with cached URL: %{public}@", type: .info, cachedParams.url.absoluteString)
          RNBranch.application(cachedParams.application, open: cachedParams.url, options: cachedParams.options)
        }
        
        promise.resolve(nil)
      }
    }
  }
}

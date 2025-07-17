import ExpoModulesCore
import RNBranch

public class BranchInitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("BranchInit")
    
    AsyncFunction("initSession") { (promise: Promise) in
      print("BranchInitModule: initSession called from JS")
      DispatchQueue.main.async {
        let launchOptions = BranchAppDelegate.getCachedLaunchOptions()
        print("BranchInitModule: Retrieved launch options: \(String(describing: launchOptions))")
        RNBranch.initSession(launchOptions: launchOptions, isReferrable: true)
        print("BranchInitModule: RNBranch.initSession completed")
        promise.resolve(nil)
      }
    }
  }
}

import ExpoModulesCore
import os.log

public class BranchInitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("BranchInit")
    
    AsyncFunction("initSession") { (promise: Promise) in
      os_log("BranchInitModule: emply initSession called from JS", type: .info)
    }
  }
}

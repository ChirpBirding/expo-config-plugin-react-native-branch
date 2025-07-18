import ExpoModulesCore
import RNBranch
import os.log

public class BranchAppDelegate: ExpoAppDelegateSubscriber {
  private static var cachedLaunchOptions: [UIApplication.LaunchOptionsKey : Any]?

  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    BranchAppDelegate.cachedLaunchOptions = launchOptions
    os_log("BranchAppDelegate: Launch options: %@ cached successfully", type: .info, String(describing: launchOptions))
    return true
  }

  public func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return RNBranch.application(application, open:url, options:options)
  }

  public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    return RNBranch.continue(userActivity)
  }

  public static func getCachedLaunchOptions() -> [UIApplication.LaunchOptionsKey : Any]? {
    return cachedLaunchOptions
  }
}

import ExpoModulesCore
import RNBranch
import os.log

public class BranchAppDelegate: ExpoAppDelegateSubscriber {
  private static var cachedLaunchOptions: [UIApplication.LaunchOptionsKey : Any]?
  private static var cachedOpenUrlParams: (application: UIApplication, url: URL, options: [UIApplication.OpenURLOptionsKey : Any])?

  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    RNBranch.enableLogging()
    BranchAppDelegate.cachedLaunchOptions = launchOptions
    os_log("BranchAppDelegate: Launch options: %{public}@ cached successfully", type: .info, String(describing: launchOptions))
    return true
  }

  public func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    os_log("BranchAppDelegate: open url: %{public}@", type: .info, url.absoluteString)
    BranchAppDelegate.cachedOpenUrlParams = (application: application, url: url, options: options)
    return true
  }

  public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    os_log("BranchAppDelegate: continue", type: .info)
    return RNBranch.continue(userActivity)
  }

  public static func getCachedLaunchOptions() -> [UIApplication.LaunchOptionsKey : Any]? {
    return cachedLaunchOptions
  }

  public static func getCachedOpenUrlParams() -> (application: UIApplication, url: URL, options: [UIApplication.OpenURLOptionsKey : Any])? {
    return cachedOpenUrlParams
  }
}


import UIKit
import Bolts
import FBSDKLoginKit
import Parse
import ParseUI
import ParseFacebookUtilsV4



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splash: UIImageView?
    var parseLoginHelper: ParseLoginHelper!
    var logInViewController : PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    var requestSubmitted: Bool = false
    
    override init(){
        super.init()
        
            parseLoginHelper = ParseLoginHelper {[unowned self] user, error in
            //Initializethe ParseLoginHelper with a callback
            if let error = error{
                //Returns an error if not successful by using the method in ErrorHandling.swift
                ErrorHandling.defaultErrorHandler(error)
            }
            else if let user = user {
                
                //if login was successful, returns a user. Display the TabController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBarViewController") as! UIViewController
                
                //As soon as login is successful, replace login screen witht tab bar
                self.window?.rootViewController!.presentViewController(tabBarController, animated:true, completion:nil)
            }
        } 
    }

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
        
    Parse.enableLocalDatastore()
        
    // Initialize Parse.
    Parse.setApplicationId("jVk0BOAqyipNMaNA4jQJOjlg1O1YLZqgZlDS6Lau",
            clientKey: "sG8pEyIrifxbaF8tODZwKPS4TIwA8iPJtsa8tcgg")
        
   
    //Initialize Facebook (boilerplate code)
    PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
    
    //check if we have logged in user
      let user = PFUser.currentUser()
        let startViewController: UIViewController
        
        if (user != nil){
            //if we have a user, show tab bar controller to be the initial view controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            startViewController = storyboard.instantiateViewControllerWithIdentifier("TabBarViewController") as! UITabBarController
            }
        //If no user, then create a login screen. Allows for some customization, parseLoginHelper as delegate
        else {
            
            logInViewController.fields = .UsernameAndPassword | .LogInButton | .SignUpButton | .PasswordForgotten
            
            startViewController = logInViewController
            
            var logInLogoTitle = UILabel()
            logInLogoTitle.text = "BizCollab"
            
            logInViewController.logInView!.logo = logInLogoTitle
            logInViewController.delegate = parseLoginHelper
            
            
            var signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "BizCollab"
            signUpViewController.signUpView!.logo = signUpLogoTitle
            
            self.signUpViewController.delegate = parseLoginHelper
            
            }
        
        //creating the UIWindow. Container for all the views in our app
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = startViewController
        self.window?.makeKeyAndVisible()
    

    
    //MARK: Changing the colour of the naviagtion bar
    UINavigationBar.appearance().barTintColor = UIColor(red: 229/255.0, green: 147/255.0, blue: 52/255.0, alpha: 100.0)
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    UINavigationBar.appearance().translucent = false
    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    

    return true
    }
    

    


    
    func dismissSplashViewIfNecessary() {
        if self.splash != nil {
            window!.bringSubviewToFront(splash!)
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.TransitionNone,
                animations: {
                    () -> Void in
                    self.splash!.alpha = 0.0
                },
                completion: {
                    (Bool) -> Void in
                    self.splash!.removeFromSuperview()
            })
        }
    }
    
    func addSplashView() {
        self.splash = UIImageView(frame: CGRectMake(0, 0, 320, 480))
        splash!.image = UIImage(named: "Default")
        splash!.tag = 4321
        splash!.alpha = 1.0
        
        self.window!.addSubview(splash!)
    }

}


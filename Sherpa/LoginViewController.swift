
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Parse
import ParseUI


class LoginViewController: UIViewController {
  
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var window: UIWindow?
    
  
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.actInd.center = self.view.center
    
    self.actInd.hidesWhenStopped = true
    
    self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
    
    view.addSubview(self.actInd)
    
    //this causes our activity indicator to be in the center of the view with colour Gray
  }
    
    //MARK:Actions
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.usernameTF.text
        var password = self.passwordTF.text
        
        
        if (count(username.utf16) < 3 || count(password.utf16) < 3){
            
            var alert = UIAlertController(title: "Invalid", message: "Username and Password are too short.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                //...
            }
            alert.addAction(OKAction)
            
            self.presentViewController(alert, animated: true, completion: nil)

          }
        
        else
        {
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: {(user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if ((user) != nil){
                    
                    
                   var alert = UIAlertController(title: "Success", message: "Logged In.", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                        //...
                    }
                    alert.addAction(OKAction)
                    self.presentViewController(alert, animated: true, completion: nil)
 
            }

            else
            {
                var alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                        //...
                }
                alert.addAction(OKAction)
                self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        }
}
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUp", sender: self)
        
    }
}

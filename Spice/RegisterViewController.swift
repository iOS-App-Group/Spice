//
//  RegisterViewController.swift
//  Spice
//
//  Created by Laura Chang on 11/14/21.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var profilePictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // way too slow.. maybe if i had image library would be faster?
    // disconnected outlet, deleted imageView
//    @IBAction func usernameDidChange(_ sender: Any) {
//        let identifier = usernameField.text
//        print("username changed to " + identifier!)
//        let avatarURL = URL(string: "https://avatars.dicebear.com/api/croodles-neutral/" + identifier! + ".png")
//        //let imageSize = CGSize(width: 150, height: 150)
////        let image = try? Data(contentsOf: avatarURL!) as! UIImage
////        let size = CGSize(width: 300, height: 300)
////        let scaledImage = image?.af_imageScalsed(to: size)
////        profilePictureView.image = scaledImage
//        let data = try? Data(contentsOf: avatarURL!)
//
//        if let imageData = data {
//            profilePictureView.image = UIImage(data: imageData)
//        }
//
//    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        // other fields can be set just like with PFObject
        user["phone"] = phoneNumberField.text
        
        let identifier = usernameField.text
        let avatarURL = URL(string: "https://avatars.dicebear.com/api/croodles-neutral/" + identifier! + ".png")
        let data = try? Data(contentsOf: avatarURL!)
        if let imageData = data {
            let file = PFFileObject(name: "image.png", data: imageData)
            
            user["avatar"] = file
        }
        
        user.signUpInBackground { success, error in
            if success { // can also use if error != nil
                self.performSegue(withIdentifier: "registerSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

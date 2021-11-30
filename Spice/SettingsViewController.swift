//
//  SettingsViewController.swift
//  Spice
//
//  Created by Laura Chang on 11/30/21.
//

import UIKit
import Parse
import AlamofireImage

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var avatarView: UIImageView!
    
    var changeAvatar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOut()
        
        // grab storyboard and initial view controller, instantiate
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = main.instantiateViewController(withIdentifier: "LoginNavigationController")
        
        // access window and set it
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginNavigationController
    }
        
    @IBAction func onSave(_ sender: Any) {
        let user = PFUser.current()
        
        if (usernameTextField.text != "") {
            user?["username"] = usernameTextField.text
        }
        
        if (passwordTextField.text != "") {
            user?["password"] = passwordTextField.text
        }
        
        if changeAvatar {
            let imageData = avatarView.image!.pngData() // imageView.image is reduced image saved from camera (see in imagePickerController(), now saved as png
            let file = PFFileObject(name: "image.png", data: imageData!) // binary object, able to be stored in Parse
            user?["avatar"] = file // will have url for file (which is stored in separate table)
            
            user?.saveInBackground()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onAvatarSelect(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self // returns what user picks
        picker.allowsEditing = true;
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) { // if camera is available (.camera is enum)
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 150, height: 150)
        let scaledImage = image.af_imageScaled(to: size)
        
        avatarView.image = scaledImage
        changeAvatar = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onDeleteAccount(_ sender: Any) {
        if PFUser.current() != nil {
            PFUser.current()?.deleteInBackground(block: { (deleteSuccessful, error) -> Void in
                    print("success = \(deleteSuccessful)")
                    PFUser.logOut()
                
                    // grab storyboard and initial view controller, instantiate
                    let main = UIStoryboard(name: "Main", bundle: nil)
                    let loginNavigationController = main.instantiateViewController(withIdentifier: "LoginNavigationController")
                    
                    // access window and set it
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
                    
                    delegate.window?.rootViewController = loginNavigationController
                })
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

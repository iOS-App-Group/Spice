//
//  RecipeDetailsViewController.swift
//  Spice
//
//  Created by Laura Chang on 11/29/21.
//

import UIKit
import Parse
import Alamofire

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipe: PFObject! // exclamation point makes it "swift optional"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = recipe["title"] as? String
        ingredientsLabel.text = recipe["ingredients"] as? String
        instructionsLabel.text = recipe["instructions"] as? String
        
        let imageFile = recipe["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        imageView.af_setImage(withURL: url)
        
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

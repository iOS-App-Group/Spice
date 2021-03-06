//
//  PersonalProfileViewController.swift
//  Spice
//
//  Created by Laura Chang on 11/17/21.
//

import UIKit
import Parse
import Alamofire

class PersonalProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipes = [PFObject]() // initially empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let query = PFQuery(className: "Recipes")
        query.includeKey("author")
        query.whereKey("author", equalTo: PFUser.current())
        query.findObjectsInBackground { [self] (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // the find succeeded
                postCountLabel.text = String (objects.count) + " recipes"
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) // after finish composing, want to refresh
        
        usernameLabel.text = PFUser.current()?.username
        
        let avatarFile = PFUser.current()?["avatar"] as! PFFileObject
        let avatarUrlString = avatarFile.url!
        let avatarUrl = URL(string: avatarUrlString)!
        avatarView.af_setImage(withURL: avatarUrl)
        
         
        // following commented out code queues posts by all authors
//        let query = PFQuery(className: "Recipes")
//        query.includeKey("author") // if didn't have include key, would only have pointer
//        query.limit = 20
//
//        query.findObjectsInBackground { (recipes, error) in
//            if recipes != nil {
//                self.recipes = recipes!
//                self.collectionView.reloadData()
//            }
//        }
        
        let query = PFQuery(className: "Recipes")
        query.includeKey("author")
        query.whereKey("author", equalTo: PFUser.current())
        query.findObjectsInBackground { (recipes, error) in
            if recipes != nil {
                self.recipes = recipes!
                self.recipes = self.recipes.reversed() // order from most recently created
                self.collectionView.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalPostsCell", for: indexPath) as! PersonalPostsCell
        let recipe = recipes[indexPath.row]
        
        let imageFile = recipe["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.postView.af_setImage(withURL: url)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "recipeDetailsSegue" {
            // find the selected recipe
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let recipe = recipes[indexPath.row]
            
            // pass the selected recipe to the details view controller
            let detailsViewController = segue.destination as! RecipeDetailsViewController // need to cast to RecipeDetailsViewController to give access to "recipe" property
            detailsViewController.recipe = recipe
        }
    }
    
}

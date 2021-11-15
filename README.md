Original App Design Project
===

# Spice

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframe](#Wireframe)
2. [Schema](#Schema)

## Overview
### Description
Allows those with a passion for cooking to connect through a dedicated social media app. Users will be able to post new recipes, interact with other users' recipes, and search for other users/existing recipes based on their preferences.

### App Evaluation

- **Category:** Social networking
- **Mobile:** Designed strictly for mobile usage, allowing users to use their camera to take recipe photos in addition to viewing and interacting with recipe posts on the go.
- **Story:** Connects users with trending recipes and food inspiration. Users will be able to interact through the comments and voting system, which encourage a sense of community.
- **Market:** Anyone interested in food and cooking can use this app. Users are able to search for specific interests based on cuisine and diet.
- **Habit:** Users will open and use this app whenever they want to find or share recipe ideas and instructions. Users both consume (view recipes) and create (post recipes).
- **Scope:** Spice has a focus on posting and viewing recipes. The main feed acts as a trending page which allows users to interact with each other by reacting to recipe titles and photos.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] User sees app icon in home screen and styled launch screen
- [X] User can sign up to create a new account (username, password, email, phone number)
- [X] User can log in
- [ ] User can log out
- [ ] User stays logged in across restarts
- [ ] User can upload a photo, add an ingredient list, and recipe instructions
- [X] User can either submit their post (through Parse) or cancel their submission
- [ ] User can view popular recipes on home page
- [ ] Users can add and view comments on a recipe
- [ ] Users can upvote/downvote a recipe
- [ ] User can tap a recipe photo to view a detailed recipe page
- [ ] User can view detailed information on a recipe (title, ingredient list, instructions)
- [ ] User can view another user's username, profile picture, and number of posts
- [ ] User can add a profile picture
- [ ] User can search for recipes by keyword or user 
- [ ] User can view detailed recipes from the Edamam API
- [ ] User can edit their profile picture
- [ ] User can change their username and password
- [ ] User can delete their account

**Optional Nice-to-have Stories**
    
* User can save posts made by other users and access them from inside the app
* User can edit an existing recipe
* User can pull to refresh
* User can load past posts infinitely
* Configure autolayout to standardize view on devices
* User can invite their contacts to join
* User can upload video for recipe instructions
* User can select their cuisine preferences when making an account
* User can set the cuisine type when uploading a post
* User can view recipes automatically configured to their set preferences during account creation


### Video Walkthrough

Here's a walkthrough of implemented user stores:

![](ezgif.com-gif-maker-6.gif)


### 2. Screen Archetypes

* Login Screen
   * User can enter their username and password to log in
* Registration Screen
   * User can sign up to create a new account (username, password, email, and phone number)
* Stream
    * User can view the past recipes (photos and titles) and the author's profile picture and name
    * User can upvote/downvote a recipe
    * Users can view comments on a recipe
    * Users can add a comment
    * User can tap a recipe photo to view a detailed recipe page
    * User can tap a profile picture to be brought to the desired user's profile page
    * User can log out
* Creation
    * User can upload a photo, add a recipe title, add an ingredient list/recipe
* Search
    * User can search for recipes or users in a text bar
    * User can view existing recipes from the Edamam API
* Other User Profile Screen
    * User can view another user's username, profile picture, and number of posts
    * User can view photos of recipes
* Personal Profile Screen
    * User can view their username, profile picture, and number of posts
    * User can view photos of recipes
* Detailed Recipe Screen
    * User can view a title, ingredient list, and instructions for a specific recipe
    * User can go back to the previous screen
* User Preferences Screen
    * User can change their profile picture, username, and password
    * User can log out
    * User can delete their account

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Screen
* Create a Recipe
* Search User/Recipe
* Personal Profile Screen

**Flow Navigation** (Screen to Screen)

* Login Screen
    => Registration Screen
    => Stream
* Registration Screen
    => Stream
    => Login Screen
* Stream
    => Detailed Recipe Screen
    => Other User Profile Screen
* Creation Screen
    => Stream
* Search Screen
    => Other User Profile Screen
    => Detailed Recipe Screen
* Other User Profile Screen
    => Detailed Recipe Screen
* Personal Profile Screen
    => User Preferences Screen
    => Detailed Recipe Screen
* Detailed Recipe Screen
    => Back to previous screen (Stream, Search Screen, User Profile Screen, Other User Profile Screen)
* User Preferences Screen
    => Login Screen

## Wireframe
![](https://i.imgur.com/mkxT16x.jpg)

## Schema 

### Models
        
#### User:
| Property      | Type     | Description                                   |
| ------------- | -------- | --------------------------------------------- |
| username      | String*  | Username                                      |
| password      | String*  | Password                                      |
| email         | String   | User email                                    |
| phoneNumber   | String   | User phone number                             |
| profileImage  | File     | User profile picture                          |
| numberOfPosts | Number   | Total number of posts by a user               |
| createdAt     | DateTime | Date when user is created (default field)     |
| updatedAt     | DateTime | Date when user is last updated (default field)|
    
#### Stream Post (Main Feed):
| Property      | Type           | Description                                    |
| ------------- | -------------  | ---------------------------------------------- |
| objectID      | String         | Unique id for the user post (default field)    |
| author        | Pointer (User) | Image author                                   |
| recipeName    | String         | Recipe title                                   |
| ingredientList| String         | Recipe ingredients                             |                 
| recipeSteps   | String         | Recipe procedure                               |  
| profileImage  | Pointer (User) | Image of the user profile                      |  
| recipeImage   | File           | Recipe image that a user posts                 |
| commentsCount | Number         | Number of comments on a post                   |
| comments      | Pointer (Array)| Lists of comments on a post                    |
| upvoteCount   | Number         | Number of upvotes on a post                    |
| downvoteCount | Number         | Number of downvotes on a post                  |
| createdAt     | DateTime       | Date when post is created (default field)      |
| updatedAt     | DateTime       | Date when post is last updated (default field) |
    
#### Stream Comments (Main Feed):
| Property  | Type           | Description                                      |
| --------- | -------------- | ------------------------------------------------ |
| objectID  | String         | Unique id for the comment                        |
| post      | Pointer (Post) | Associated post                                  |
| text      | String         | Comment text                                     |
| author    | Pointer (User) | Comment author                                   |
| createdAt | DateTime       | Date when comment is created (default field)     |
| updatedAt | DateTime       | Date when comment is last updated (default field)|
    
### Networking    
* Login Screen:
    * (Read/GET) User logs into app
      * User can also create new profile
    
* Registration Screen:
    * (Create/POST) User signs up
    
* Stream:     
    * (Read/Get) Read recipe name
    * (Read/ GET) Read username 
    * (Read/GET) Get a picture of the recipe
    * (Create/POST) Create an upvote on a post
    * (Delete) Delete existing upvote
    * (Create/POST) Create an downvote on a post
    * (Delete) Delete existing downvote
    * (Create/POST) Create a comment on a post
    * (Delete) Delete existing comment
    
    
* Creation:
    * (Create/POST) Create the name of the recipe 
    * (Create/POST) Create ingredients' list of the recipe
    * (Create/POST) Create recipe instructions
    * (Create/POST) add a picture of the recipe
    * (Create/POST) Submit the post
    * (Delete) cancel the post

* Search:
    * (Read/GET) Search for the recipe
    * (Read/GET) Search for the user
    

* Other User Profile Screen: 
    * (Read/GET) Name of the user
    * (Read/GET) Number of user's post
    * (Read/GET) User's picture
    * (Read/GET) Access detailed recipe by clicking picture objects
    
* Profile Screen:
    * (Read/GET) Query logged in user object
    * (Read/GET) Number of user's post
    * (Read/GET) User's picture
    * (Read/GET) Access detailed recipe by clicking picture objects
    
* Detailed Recipe Screen:
    * (Read/GET) Name of the recipe
    * (Read/GET) Ingredients of the recipe
    * (Read/GET) Recipe instructions
   
* Preferences Screen: 
    * (Update/PUT) Update user profile image
    * (Update/PUT) Update Username
    * (Update/PUT) Update Password
    * (Delete/DELETE) Delete user profile
    * (Create/POST) Lets a user log out

- Basic snippets for Parse network requests:
```
// (Read/GET) Query all posts where user is author
let query = PFQuery(className:"Post")
query.whereKey("author", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
      // TODO: Do something with posts...
   }
}
```

```
// (Read/GET) Create a post
PFObject *post = [PFObject objectWithClassName:@"post"];
post[@"title"] = @"Green Eggs & Ham";
post[@"author"] = @"John Doe";
post[@"instructions"] = @"the most enlightening of instructions"
post[@"ingredients"] = @"the lovliest of ingredients"
[post saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
  if (succeeded) {
    // The object has been saved.
  } else {
    // There was a problem, check error.description
  }
}];
```

```
// (Read/GET)
// Fetch posts for a user's home feed
PFQuery *query = [PFQuery queryWithClassName:@"post"];
[query whereKey:@"author" equalTo:@"John Doe"];
[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
  if (!error) {
    // The find succeeded.
    NSLog(@"Successfully retrieved %d scores.", objects.count);
    // Do something with the found objects
    for (PFObject *object in objects) {
        NSLog(@"%@", object.objectId);
    }
  } else {
    // Log details of the failure
    NSLog(@"Error: %@ %@", error, [error userInfo]);
  }
}];
```

```
// (Delete/DELETE)
// Delete account
[PFObject deleteAllInBackground:objectArray block:^(BOOL succeeded, NSError * _Nullable error) {
    if (succeeded) {
        // The array of objects was successfully deleted.
    } else {
        // There was an error. Check the errors localizedDescription.
    }
}];
```

```
// (Update/Put)
// Changing user's profile picture
PFQuery *query = [PFQuery queryWithClassName:@"user"];

// Retrieve the object by id
[query getObjectInBackgroundWithId:@"John Doe"
                             block:^(PFObject *user, NSError *error) {
    // Now let's update it with some new data. In this case, profile picture
    // will get sent to the cloud. Others haven't changed
    user[@"username"] = @"xxDinoxx";
    user[@"password"] = @"defSecure";
    // keep going
    [author saveInBackground];
}];
```

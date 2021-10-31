Original App Design Project - README Template
===

# APP_NAME_HERE

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
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
- **Scope:** <APP NAME> has a focus on posting and viewing recipes. The main feed acts as a trending page which allows users to interact with each other by reacting to recipe titles and photos.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User sees app icon in home screen and styled launch screen
* User can sign up to create a new account (username, password, email, phone number)
* User can log in
* User can log out
* User stays logged in across restarts
* User can upload a photo, add an ingredient list, and recipe instructions
* User can either submit their post (through Parse) or cancel their submission
* User can view popular recipes on home page
* Users can add and view comments on a recipe
* Users can upvote/downvote a recipe
* User can tap a recipe photo to view a detailed recipe page
* User can view detailed information on a recipe (title, ingredient list, instructions)
* User can view another user's username, profile picture, and number of posts
* User can add a profile picture
* User can search for recipes by keyword or user 
* User can view detailed recipes from the Edamam API
* User can edit their profile picture
* User can change their username and password

**Optional Nice-to-have Stories**
    
* User can save posts made by other users and access them from inside the app
* User can edit an existing recipe
* User can pull to refresh
* User can load past posts infinitely
* Configure autolayout to standardize view on devices
* User can invite their contacts to join
* User can upload video for recipe instructions
* User can delete their account
* User can select their cuisine preferences when making an account
* User can set the cuisine type when uploading a post
* User can view recipes automatically configured to their set preferences during account creation

### 2. Screen Archetypes

* Login Screen
   * User can enter their username and password to log in
   <!--* User can be taken to the registration screen-->
* Registration Screen
   * User can sign up to create a new account (username, password, email, and phone number)
   <!--* User can go back to the login screen-->
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
    <!--* User can choose whether to upload it to the server or cancel-->
* Search
    * User can search for recipes or users in a text bar
    * User can view existing recipes from the Edamam API
* Other User Profile Screen
    * User can view another user's username, profile picture, and number of posts
    * User can view photos of recipes
* Personal Profile Screen
    * User can view their username, profile picture, and number of posts
    * User can view photos of recipes
    <!--* User can access a preferences screen-->
* Detailed Recipe Screen
    * User can view a title, ingredient list, and instructions for a specific recipe
    * User can go back to the previous screen
* User Preferences Screen
    * User can change their profile picture, username, and password
    * User can log out

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

## Wireframes
![](https://i.imgur.com/2buEA0g.jpg)

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
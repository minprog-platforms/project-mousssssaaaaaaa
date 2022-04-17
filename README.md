# proposal- Bucketlit - mousssssaaaaaaa
project-mousssssaaaaaaa created by GitHub Classroom

* Er was geen read.me of folder dus moet ik zelf een aanmaken?

# Bucketlist

## Problem statement
Personally I often find myself coming up with new ideas or projects I would like to pursue in the future.
Writing these ideas down in a bucketlist helps keep track of these ideas. 
The drawback of having a large static makes me only look at list when wanting to add new ideas to the bucketlist. 
This results in me and probably other people with a bucketlist having a ever growing list of ideas in the background.

## Solution sketch
###### Summary
This application will hopefully make the user more exicted to interact with his or her bucketlist. The user will weekly receive one (or more) randomly ideas from the bucketlist. 

###### Visual sketch
1. Bucket list goals view is the homepage which shows the current bucket list goals the user has to try and achieve. The user can also add a new goal by pressing the top button. 
2. When the Shop button is pressed the user is transported to the shopping area where the user can buy an item as a reward for acheving goals.
3. This is the view of a adding a new bucket list goal, where the user has to enter a form.
4. This is the view of a adding a new bucket list item, where the user has to enter a form.

## Prerequisites
###### Datasources
Because the bucketlist and the shopitems will be set by the users there wont be any external data required. Perhaps a good feature could be that a user can load in bucketlist items and shop items from external csv or excel file but this won't be crucial for the app.  

###### External components
-All the bucketlist  will be stored in a list and random name picker will choose which goals to display. The 'Gamekit' library contains GKRandomSource  class with its sharedRandom() class method for this. 
-I want to display my shop items in certain stylistic way, but this can be solved with different methods. 'Bootstrap Gallery' Library contains some examples.  

###### Similar (web)apps
-Buckist - Create and Manage Bucket List
This andriod app has the same concept but uses a static list without rewards. This option does include a synchronize bucket on multiple devices and option to explore other users goals. This could perhaps be achieved with Icloud sync and a upload/ download function to the internet. This app also contains the option the customize the app, it seems like they programmed standard templates for this.

-Soon
This IOS app also stores a static bucketlist for users. The benefits of this app is that you users can have multiple categories. This might be harder to include in my version because I am trying to limit to visably option to keep the next goal a mystery. Soon also stores the bucket list goals completed, this is probably done by adding the completed task to a new 'achievements' list. 

-Bucket List
This andriod app keeps it simple but offers some nice features. When completing a goal it will save the time and date to the achievements list. The app performs this by having the user check a box when completed which triggers a function to save the time and date of that action. This features has the benefit to make other features like analytics or doubling bonus more feasible. 

###### Hardest parts 
It might be difficult to balance the 'game' aspect of having goals that are challenging and reachable when the user decides the reward and the price. I also assume that the user would have to enter a lot of goals and items before the randomized generator will offer interesting options. 




# proposal- Bucketlist - mousssssaaaaaaa
project-mousssssaaaaaaa created by GitHub Classroom by Moussa Idaassi

# Bucketlist

## screenshots
![Bucketlist](https://user-images.githubusercontent.com/65379947/171281314-2fdacd22-4568-406c-92f7-81939b957f80.PNG)
![RewardStore](https://user-images.githubusercontent.com/65379947/171281148-960e2f2e-efc5-450f-823e-dde3384b72ae.PNG)




## description of the app’s purpose


## Problem statement
Personally I often find myself coming up with new ideas without following them up.
Writing these ideas down in a bucket list helps keep track of these ideas. 
But the drawback of having a large static list remains that it is only pops up in my mind when adding new ideas to the bucket list. 
This results in me and probably other people with a bucket list having a ever growing list of ideas on there bucket list.

## Solution sketch
![Adding new items](/doc/additionals.png)
![Homescreen](/doc/homescreen.png)

###### Summary
This application will hopefully make the user more exicted to interact with his or her bucketlist. The user will receive new goals from time to time to be completed for a reward choosen by the user. 

###### Visual sketch
1. The first view is the homepage which shows the current bucket list goals. The user can also add a new goal by pressing the top button. 
2. When the Shop button is pressed the user is transported to the shopping area where the user can buy an item as a reward for achieving goals.
3. This is the view of a adding a new bucket list goal, where the user has to enter a form.
4. This is the view of a adding a new bucket list item, where the user has to enter a form.

## Prerequisites
###### Datasources
Because the bucket list and the shop items will be set by the users there won't be any external data required. Perhaps a good feature could be that a user can load in bucketlist items and shop items from external csv or excel file but this won't be crucial for the app.  

###### External components
- All the bucketlist  will be stored in a list and random name picker will choose which goals to display. The 'Gamekit' library contains GKRandomSource  class with its sharedRandom() class method for this. 
- I want to display my shop items in certain stylistic way, this can be achieved with different methods. 'Bootstrap Gallery' Library contains some examples.  

###### Similar (web)apps
- Bucklist - Create and Manage Bucket List
This andriod app has the same concept but uses a static list without rewards. This app does include a synchronize option for multiple devices and a option to explore other users goals. This could perhaps be achieved with Icloud sync. Having to option to share with friends will probably require hosting of a database. This app also contains the option the customize the app, the developers programmed standard templates for this.

- Soon - This IOS app also stores a static bucketlist for users. The benefits of this app is that you users can have multiple categories. This might be harder to include in my version because I'm trying to limit to visable options to keep the next goal a mystery. Soon also stores the bucket list goals completed, this is probably done by adding the completed task to a 'achievements' list. 

- Bucket List - This andriod app keeps it simple but offers some nice features. When completing a goal it will save the time and date to the achievements list. The app performs this by having the user check a box when completed which triggers a function to save the time and date of that action. This features has the benefit to make other features like analytics or incentives (e.g. double reward bonus) more feasible. 

###### Hardest parts 
It might be difficult create a right loop of adding a goal to list which will then create a randomized task list. Another obstacle could be that the user would have to enter a lot of goals and items before the randomized generator will offer interesting options. I also assume that to balance the 'game' aspect of having goals that are challenging and reachable when the user decides the reward and the price.



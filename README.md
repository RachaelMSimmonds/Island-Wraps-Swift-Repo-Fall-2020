# Island-Wraps-Swift-Repo-Fall-2020

Final Project Repo for Fall 2020 ISTE-454 
=========================================
## Mobile Application Development I

### Project: Island Wraps App
 
**By:**
       **Alex Ketavongsa and Rachael Simmonds**
       
Product Definition Statement:
-----------------------------
This application will be a mobile “Point of Sales” system to allow customers to order food, contact the client/business, be alerted of recent or upcoming events, view a menu with prices, and be redirected to the clients social media page(s). This application will be for those who cannot wait for food inside a store or people who like food delivery services, but most importantly it is for the client, business owner of Island Wraps who need an application to reach a bigger audience of consumers. 
The difference from the competition is that I want the UI especially to be user friendly to customers. Many times other businesses will have an ordering application that is very confusing or doesn’t properly save a users choices which will frustrate them to the point they will move on to another site. The business clients cuisine is exquisite and very appetizing so I would like the users to be indulged in the website in order to have a constant flow of business for our client.

---

**Features Implemented:**
* A readable menu page 
* Ordering page/Cart on iPhone to store selected/wanted items (Needs further implementation)
* Homepage with updated announcements 
* In app reviews (Located on homepage within a link)
* An events page (Map)
* A contact page 
* A social media page 
 
**Features Hoped to be Implemented in Future Release:**
* An optional login in system for the customer
* Catering request/inquiry
* Calendar on iPhone
* A gallery page for the cuisine
* A way to store user credentials

---
 
Self evaluation and Documentation
---------------------------------
**Grade:**
Personally, we would grade ourselves with a “B” for the project. We had a solid proposal for the project but I think we fell short with time and implementation. We overlooked our time span we had left to work with this project and did not have the resources to implement a core feature of the app we wanted to implement. It also deserves a “B” because we weren’t able to implement any extra features to it either due to our time constraints and other conflicting class projects. Positively thinking, we were able to implement most of the app's functionality including the homepage, a readable menu, links to the clients social media pages, and a contact page. If we had more time I believe we could have had everything necessary implemented and maybe more.
 
Described Classes/Structs:
--------------------------
**Structs:**
_ContentView Struct_: This struct allows the app to run fully and function together using multiple views. It is where you run the application to view it working. It also implements the tab views within the app by adding each view within a TabView.
MenuListView Struct: This struct shows the list of main items included in the menu. Will lead you to the MenuDetailView file through a navigation view.
MenuDetailView Struct: Within this struct you can see individual food items in each list group with their prices and descriptions.
MapView Struct: This is where the events will be displayed but in a map formation. You can get the directions directly to each event by tapping on them with the users exact location.
MyMapTab Struct: This struct has been changed and won’t be used anymore. (Ignore).
CartView Struct: This struct is where we would have had the user’s food selections stored in a cart fashion, unfortunately, we did not have time to fully implement it.
HomeView Struct: This struct is the homepage of the application where the user will be brought to each time they launch the app. It includes reviews and a general announcement.
SocialView Struct: This struct allows a user to follow/locate the client’s social media pages, including, Facebook, Instagram, and Twitter through a button action click on the page.
ContactView Struct: This struct is where the user will be able to find the clients phone number and email address to get in contact with them in case they have further questions or want to book a catering order. Should be able to open the Phone Keypad and Email app but the simulator would not allow it to do so.
Cart Struct: This struct is not in use, but was an attempt to further implement the cart to work. (Ignore).
Classes:
Menu Class: This is where all the variables are declared and used from the data.plist to get the information to be displayed in an orderly fashion on the MenuListView.Swift and MenuDetailView.Swift files on the UI of the application.
Menus Class: This class makes all the variables stored in the Menu class observable and be able to be used across multiple views and update them in real time or load them in faster.
LocationManager Class: This class imports CoreLocation which allows the users location to be tracked and allows us to input pin point locations on the map we have on the MapView struct using latitude and longitude coordinates.
Event Class: Like our Menu class, this is where all the event variables are declared from the data.plist to get the information to be displayed within each pinpoint on the MapView.Swift file on the application. This allows us to get the pins to be dropped in specific locations due to their latitude and longitude.
Events Class: This class makes all the variables stored in the Event class observable and be able to be used across multiple views and update them in real time or load them in faster, but we only utilize them on the MapView.
 
Declared Tutorials:
 
Code Tutorial(s) Used for Cart Page:
SwiftUI Cart Page UI With Custom Swipe To Delete Action - Complex UI - SwiftUI 2.0 Tutorials https://www.youtube.com/watch?v=jXVQDmeNb8A&t=154s  By: Kavsoft
SwiftUI Complex UI Tutorials - E-Commerce App Cart Page UI - Xcode 12 - SwiftUI 2.0 Tutorials https://www.youtube.com/watch?v=IfQxVY6bHag&t=352s By: Kavsoft
 
Code Tutorial(s) Used for Social Media Page:
https://stackoverflow.com/questions/56518029/how-do-i-use-sfsafariviewcontroller-with-swiftui By: bheinz
 
Code Tutorial(s) Used for Contact Page:
https://stackoverflow.com/questions/57582653/how-to-create-tappable-url-phone-number-in-swiftui By: Steve Dugan
 
Code Tutorial Site Used for General Help:
https://www.hackingwithswift.com/books/ios-swiftui/ By: Paul Hudson

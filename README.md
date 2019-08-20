# Moneybox iOS Task
Moneybox Graduate iOS Programmer Task by Andrew Zandt-Valentine.

- The cloned directory should be runnable via XCode and the simulator.
- I prefer to do my UI programmatically, as such I have included the SnapKit API to help with constraints. This was included using CocoaPods.
- Minor unit testing has been completed on two simple login validations, didn't have time to fully test the network functions.

# Project Overview
View Controllers: The View Controllers contain the code to handle user interactions with the UI elements.
- LoginVC also contains a closure method which interacts with the NetworkVerificationHandler to log in.
- HomepageVC also contains TableView delegate and Data Source methods to supply downloaded information to the TableView using the NetworkDataHandler.
- AccountVC also handles interacting with the NetworkDataHandler in order to send a POST message to add money to the moneybox.
    
Views: The View classes contain the code to create and layout all of the UI elements and their constraints using SnapKit. I prefer to create each element individually as I find it easier to read the modifications of a specific element, e.g. a label, all in one place. However a standard label class could also have been created.

Network Helpers: This folder contains a few API elements which allow for easier communication with the server.
- LoginHandler provides a way to check the current state of the user's logged in status and change screens accordingly. This provides a safe way to ensure that a user never has any access to account data if they are not logged in.
- NetworkVerificationHandler provides an API to log in to the moneybox database and retrieve a bearer token.
- NetworkDataHandler provides an API to fetch Account data from the server and also to perform a moneybox top up request.
- HttpRequestBuilder provides an API to create an HttpRequest, taking into account additional headers and parameters given.

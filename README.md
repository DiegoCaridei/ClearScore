# ClearScore – iOS technical assessment

We would like to see how well you write iOS apps to represent real concepts and problems.
Notes: 

* There is no 100% correct answer. Make any decisions you feel are sensible.
* You can use any frameworks you like but write about why you chose it.
* Your code must be documented, compile and be testable by us. At the end, please push any code you have written to GitHub or Bitbucket and then send us a link to the repository.

Write an application that will display a donut view which pulls the credit score information from the endpoint given. The wire frame shows an example of what is to be achieved.

The donut should display the correct value received from the endpoint and use that value to fill the outline of the donut but the same percentage. You don’t need to worry about the five white circles on the bottom.

The endpoint: https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values

## ClearScore – iOS technical assessment

### Requirements

The following requirements should be met:

* Use Swift 3.0.
* The code should be production grade.
* It should compile and run.

### Tips/Advise

* Testing is very important for us and you should take that into consideration when creating this demo. Even if you don't write a single test (e.g. because of time constraints), your app should be easy to test.
* Error scenarios should be taken into consideration as well and how easy is to add them, even if you don't explicitly show them (e.g. using an UIAlertController).
* Although UI and UX are important, in this demo, we are more concerned on how you architect your application and your thought process. It should take into consideration features that might be added in the future.
* You can use any 3rd party library you wish (Alamofire, ReactiveCocoa, PromiseKit, Realm, etc). In case you do, be prepared to justify why you used it. You can use CocoaPods, Carthage or Git Submodules for this (please don't drag and drop stuff around).

Clean the file project structure (if you are creating one from scratch) and remove any unused methods (e.g AppDelegate).

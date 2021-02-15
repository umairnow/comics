### Description:

This is an iOS App developed in Swift language. 
Opening the app will immediately load the current comic from API. 
User also have option to search for a comic either by comic number or by any search query. 
On searching, the comic will be loaded below the search bar with its details.

### To-Do:

* API calling
* Offline mode
* Search functionality

### Done:

* Basic project structure
* Design pattern for communication between different layers of project
* User interface through storyboard
* Referencing of user interface with business logic
* Pods setup and required libraries to run the project
* Maintained git history

### Project Structure:

In the project, I have modified MVVP and VIPER patterns, so that it wouldn't take
time to setup such a small project. While designing the pattern, I have taken care of 
testability of the project and added abstraction for all layers.
<p>
When `viewDidLoad` of `VCDetailComic` is invoked, it sends message via protocol-delegate
pattern to `ComicDetailInteractor` to load the current comic from server. 
When it gets response from server through `ComicService` it sends response to Interactor and 
interactor passes it to view controller
</p>
<p>
If user search something, it first checks the selected index of segmented control
and decides whether it is a text search or a nummber search and calls api accordingly.
</p>


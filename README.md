### Description:

This is an iOS App developed in Swift language. 
Opening the app will immediately load the current comic from API. 
User also have option to search for a comic either by comic number or by any search query. 
On searching, the comic will be loaded below the search bar with its details.

### To-Do:

* API calling
* Offline mode

### Done:

* Basic project structure
* Design pattern for communication between different layers of project
* User interface through storyboard
* Referencing of user interface with business logic
* Pods setup and required libraries to run the project
* Maintained git history
* Possibility to search the comic by text and number
* Possibility to show the comic details i-e: image, description, title etc on screen

### Project Structure:

In the project, I have modified MVVP and VIPER patterns, so that it wouldn't take
time to setup for such a small project. While designing the pattern, I have taken care of 
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
<p>
I have created just one interactor because for now we only need to send results to `VCComicDetail`. 
It can be changed in future.
</p>
<p>
Interactor is responsible of parsing inputs from view controller and also parsing responses from server before
sending to view controller. View controller can just send requests and wait for responses.
</p>


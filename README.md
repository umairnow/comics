### Description:

This is an iOS App developed in Swift language. 
I have decided to provide following features to make MVP
1. Show current comic
2. Search comic by number
3. Search comic by text
4. Offline mode

Opening the app will immediately load the current comic from API. 
User also has option to search for a comic either by comic number or by any search query. 
On searching, the comic will be loaded below the search bar with its details.

### Done:

* Basic project structure
* Design pattern for communication between different layers of project
* User interface through storyboard
* Referencing of user interface with business logic
* Pods setup and required libraries to run the project
* Maintained git history
* Show current comic with description
* Search comic by number
* Search comic by text
* Offline storage by url cache

### User Manual

* Opening the application will load current comic automatically
* Select "Search by Text" to search comic by typing text
* Select "Search by Number" to search comic by number
* Tap on background or press search button on keyboard to start search


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
I have created just one interactor because for now we only need to send results to `VCComicDetail`. 
It can be changed in future.
</p>
<p>
Interactor is responsible of parsing inputs from view controller and also parsing responses from server before
sending to view controller. View controller can just send requests and wait for responses.
</p>
<p>
`VCComicDetail` can be reused that is why it is made separate. It can be reused when there are multiple search results shown 
in a list and user taps on a row to see the details.
</p>
<p>
Moya (a third party library) is used to manage networking and parsing
</p>


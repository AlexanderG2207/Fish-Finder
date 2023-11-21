# Fish Finder

This App was created within the intro course of the iPraktikum at the Technical University of Munich. The iPraktikum at the Technical University of Munich aims to teach iOS development within agile teams.

## Requirements

| #  | Description                                                                         | Implemented |
|----|-------------------------------------------------------------------------------------|-------------|
| 1  | Create at least 5±2 custom views                                                    |      ✅     |
| 1a | Use the List view in at least one of the custom views                               |      ✅     |
| 1b | Use AsyncImage in at least one of the custom views.                                 |      ✅     |
| 1c | Import and display a custom font in at least one of the custom views                |      ✅     |
| 2  | Include at least one asynchronous API call handled using async / await.             |      ✅     |
| 2a | Handle network errors and display appropriate error messages.                       |      ✅     |
| 3  | Use the MVVM pattern throughout your app.                                           |      ✅     |
| 3a | Avoid business logic in your SwiftUI views.                                         |      ✅     |
| 3b | Use appropriate property wrappers in your views.                                    |      ✅     |
| 3c | Use at least one published property in a ViewModel.                                 |      ✅     |
| 4  | Follow Apple's Human Interface Guidelines while creating the UI.                    |      ✅     |
| 4a | Support Dark Mode.                                                                  |      ✅     |
| 5  | Include at least one third-party package.                                           |      ✅     |
| 5a | Ensure that you install the package of your choice using the Swift Package Manager. |      ✅     |
| 6  | Use SF Symbols.                                                                     |      ✅     |
| 7  | Source code follows best practices, is readable, and is easy to understand.         |      ✅     |
| 7a | Follow coding guidelines.                                                           |      ✅     |
| 7b | Comment your code inline.                                                           |      ✅     |
| 7c | Document your code.                                                                 |      ✅     |
| 7d | Use Apple's Logger throughout your app.                                             |      ✅     |

## Documentation

##### All Testing was done using an iPhone X.

### Features

> Fish Finder allows the user to read up on the world's most known and most eaten Fish. The user is able to scroll through a list of different types of Fish and when a fish that interests the user is found, the user can click on the Fish and view all kinds of facts about that specific Fish such as the name, scientific name, picture, quote, population, availability, harvest type, health benefits, description, location, habitat, biology and color of the Fish.

> The loading of images is done asynchronously and allows the user to carry on using the app whilst the images are being loaded into the App.

> As extra functionality, the user is able to go fishing in the app (with confetti ;)) and is also able to see a video loop of Fish in the ocean.

### Screens

#### Home Screen

> The Home Screen is the screen that is initialized first. The Home Screen displays the App name and a picture of a Fish. An introduction/description text is displayed and at the bottom of the screen, a video loop of Fishes in the ocean is played.

#### Fishes Screen

> The Fishes Screen calls the API when displayed and displays all the Fishes returned by the API in a List with a picture and name of each Fish. When a Fish is clicked on, it takes the user to the Fish Screen of that specific Fish.

#### Fish Screen

> In the Fish Screen, the user can see all kinds of Information about the Fish that the user selected. The information that is displayed is the name, scientific name, picture, quote, population, availability, harvest type, health benefits, description, location, habitat, biology, and color of the Fish. A back button is displayed to return to the Fishes Screen.

#### Settings Screen

> The Settings Screen displays a toggle that allows the user to choose between light and dark modes. There is a go fishing button that takes the user confetti fishing! At the bottom of the screen, the user can see information regarding the version and about information.

### Requirements

#### 1) Create at least 5±2 custom views created

> The "HomeView", "FishesView", "FishView" and the "SettingsView". They are normal Views adhering to the View Protocol. The Views are also connected with a TabView that links and navigates them together in the "ContentView".

#### 1a) Use the List view in at least one of the custom views

> I implemented the List view in the "FishesView" by displaying the List view and iterating over an array of Fish which was called from the API to then display each Fish in its own list field.

#### 1b) Use AsyncImage in at least one of the custom views.

> AsyncImage was implemented in the "FishesView" and "FishView", displaying an Illustration Photo of each Fish. I implemented it by using "AsyncImage" in the View. I then added the website link of the Illustration Photo of each Fish by inserting the link I received for each Fish from the API Call.

#### 1c) Import and display a custom font in at least one of the custom views.

> Since Xcode 13, Apple hasn't automatically created an info.plist file where one can simply name and add custom fonts. I therefore had to change the Targets in the info section of the Project and add the key "Fonts provided by Apple" with my custom font "OrganicRelif" being part of the array of fonts. The font was then implemented in the "HomeView" title and the "FishView" fish name by adding "Font.custom("OrganicRelief", size)" to the .font modifier of the Text.

#### 2) Include at least one asynchronous API call handled using async / await.

> This took me a while, but I created a model for the Fish and created a @Published variable of type Fishes. I then created an async "fetchData()" function which called the "fishwatch.gov" API and awaited a response. I then decoded the JSON Response into the Fishes variable which saved the Array of Fish objects. 

#### 2a) Handle network errors and display appropriate error messages.

> Network errors are caught and handled by triggering a boolean when an error occurs. If the boolean is changed during an unsuccessful API Call, the user is notified of the Error and is able to retry the API Call. The appropriate Error message is also logged with the Logger.

#### 3) Use the MVVM pattern throughout your app.

> The MVVM pattern was implemented by creating a "FishModel" class which held the model for the Fish object and Fishes array. I then created a ViewModel for some of the Views which held the logic and functions. I then created a View struct for each one of my screens to hold the UI.

#### 3a) Avoid business logic in your SwiftUI views.

> Business Logic was avoided as much as possible. The only business logic is in the "FishesView" where the "isFetching" and "isFetchingError" booleans are checked. Besides that, all other logic is done in the corresponding ViewModels.

#### 3b) Use appropriate property wrappers in your views.

> I used @StateObject in the "FishesView" to create a variable of type "FishesViewModel" to be able to access the "fetchData()" function which was created in the "FishesViewModel".

#### 3c) Use at least one published property in a ViewModel.

> One example of using the @Published property was implemented in the "FishesViewModel", where I published the "fetchedFishes" Array of Fishes for the View to be able to access the Array with all the different Fish objects.

#### 4) Follow Apple's Human Interface Guidelines while creating the UI.

> Things such as "making it clear when loading is occurring" were handled by adding ProgressViews in places where network requests were made, such as with the AsyncImages or the API call. Navigation was made intuitive by creating a TabView which allows the user to see all the different available Screens.

#### 4a) Support Dark Mode.

> Supporting Dark Mode was done by creating a toggle. The toggle was linked to a boolean called "isDarkMode" which was saved in @AppStorage to be saved even when the user closes and then reopens the App. The boolean was checked in the "ContentView" view and based on the boolean the colorScheme was set for the environment which changed the appearance mode for the whole App.

#### 5) Include at least one third-party package.

> The Packages I installed were "ConfettiSwiftUI" and "VideoPlayer". I applied "ConfettiSwiftUI" in the Settings view with the different configurations to display Fish emojis after clicking on the fishing Rod emoji. "VideoPlayer" was implemented on the Home Screen to display a video of fish swimming in the ocean and the configuration of the settings for the "VideoPlayer" was implemented in the "HomeViewModel".

#### 5a) Ensure that you install the package of your choice using the Swift Package Manager.

> To install the 2 packages I went into the Project Settings > General and under "Frameworks, Libraries, and Embedded Content" I clicked the + button and followed it by pasting the GitHub repository link to the the packages. The Swift Package Manager took over the installation, and the packages were ready to use.

#### 6) Use SF Symbols.

> SF Symbols was used for the TabView of the App. These Symbols were incorporated by using a normal Image view and choosing "systemName" as the parameter description with the corresponding SF Symbol name such as "slider.horizontal.3".

#### 7) Source code follows best practices, is readable, and easy to understand.

> I made sure to make my code as easy to understand as possible by reformatting my code and making sure all variables, functions, structs, and classes had understandable and good names. I also made sure to use Camel Case for variables and function names.

#### 7a) Follow coding guidelines.

> Coding guidelines were implemented by using good variable names and function names. Such as distinguishing between "Fish", which is a single Fish object, and "Fishes", which is an array of "Fish" objects.

#### 7b) Comment your code inline.

> Code, where understanding may be difficult, was commented on and described to try and explain the intended functionality.

#### 7c) Document your code.

> The code was documented in this README File by using my normal note editor.

#### 7d) Use Apple's Logger throughout your app.

> The logger was used in the "FishesViewModel" where the API call is made. I implemented the Logger by initializing a Logger variable and used it to display a log when the API request was successful and also to log an error message when there was an error in the call. 

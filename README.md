# Wongnai Intern Assignment

## Description
WongnaiInternAssignment is an iOS application developed as part of an intern assignment for Wongnai. The app fetches and displays a list of photos from api.500px.com, showcasing important details such as the photo name, description, and especially likes count.

## Features
- Fetches and displays a list of photos from API
- Supports pull-to-refresh functionality to reload the photo data
- Shows photo details, including name, description, and likes count
- Implements asynchronous image loading and caching using SDWebImage library
- Follows MVVM (Model-View-ViewModel) architectural pattern

## Requirements
- iOS 12.0+
- Xcode 15+
- Swift 5.10+

## Installation
1. Clone the repository:
- git clone https://github.com/oatwarat/WongnaiInternAssignment.git
2. Open the project in Xcode:
- cd WongnaiInternAssignment
- open WongnaiInternAssignment.xcodeproj
3. Install dependencies using CocoaPods:
- pod install
4. Open the generated workspace:
- open WongnaiInternAssignment.xcworkspace
5. Build and run the application in Xcode.


## Architecture
The WongnaiInternAssignment project follows the MVVM (Model-View-ViewModel) architectural pattern. The key components of the MVVM architecture in this project are:

- Model: Represents the data and business logic of the application.
- View: Responsible for displaying the user interface and handling user interactions.
- ViewModel: Acts as an intermediary between the Model and the View.

## API
The WongnaiInternAssignment project utilizes the 500px API to fetch popular photos. The API endpoint used is:
- `https://api.500px.com/v1/photos?feature=popular&page=1`


## Credits
The following resources were helpful during the development of this project:
- [SDWebImage Documentation](https://sdwebimage.github.io/)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)

## Contact
- Email: waratppp@gmail.com
- GitHub: [oatwarat](https://github.com/oatwarat)

# Game of Life


 The deployement target of the project is iOS 13.0 and the project use `cocopoads` (see https://guides.cocoapods.org) as dependency manager in order to use the custom `SwiftLint` script.

# Run the project

 - after cloning the repository move to the project's folder and run the `pod install` command in the terminal (see https://guides.cocoapods.org) in order to install the dependenccy
 - select the Target `GoL` and use any iPhone simulator.
 
 # Misc
- The project use a custom `Logger` class, if you need to print anything use `Logger.log(...)` instead of print because the SwiftLint script doesn't allow the usage of `print(...)` (or delete the rule at the end of the .swiftLint.yml)

# Source
- The UI is based on https://learnappmaking.com/game-of-life-in-swift-how-to/ implementation

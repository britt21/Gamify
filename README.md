* Overview
GameHome is an interactive Flutter application where players engage in a simple selection game. The goal is to find the correct item based on a given clue. When the correct item is selected, the player advances to the next screen.

Features
Immersive Experience: The app hides the system UI for a full-screen experience.
Interactive Gameplay: Players select items to match the given clue. Correct selections advance the game, while incorrect selections prompt the player to try again.
Animated Feedback: Selected items are highlighted, and feedback is provided when the correct or incorrect item is chosen.
Customizable UI: The app includes custom colors and assets for a visually appealing interface.
How to Play
Clue Display: The game starts with a clue displayed in a container at the top of the screen. The clue consists of a description of the item the player should find.
Item Selection: Below the clue, a row of items is displayed. The player can tap on any item to select it.
Game Logic:
If the correct item is selected, the player is taken to the next screen (ScreenTwo).
If an incorrect item is selected, a dialog is shown indicating the mistake, and the player is prompted to try again.
Result Dialog: When an incorrect item is selected, a dialog box appears with a message and a button to close the dialog and continue the game.
- Getting Started Prerequisites:
Flutter SDK
Dart
Android Studio or Visual Studio Code
Installation
Clone the repository:
bash
Copy code
git clone https://github.com/yourusername/gamehome.git
Navigate to the project directory:
bash
Copy code
cd gamehome
Get the dependencies:
bash
Copy code
flutter pub get
Running the App
To run the app on an emulator or a connected device:

bash
Copy code
flutter run
Code Structure
GameHome: The main screen of the game. It manages the UI and the game logic.
ScreenTwo: The screen displayed when the player selects the correct item.
Item Selection Logic: Tracks which items have been selected and determines if the correct item is chosen.
RichText: Displays the clue with specific words highlighted in bold for emphasis.
Assets
Images: The images used for the items are stored in the assets folder.
Colors: Custom colors are defined in the colors.dart file located in the utils directory.

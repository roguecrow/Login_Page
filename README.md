# LoginPage widget

The `LoginPage` is a stateful widget that displays a form for users to login. It takes in an optional `onTap` function that is called when the "Register now" button is pressed.

## Import Statements

The `LoginPage` widget imports the following libraries:

1. `package:auth_project/components/my_button.dart` - a custom button widget.
2. `package:auth_project/components/my_textfield.dart` - a custom text field widget.
3. `package:auth_project/components/square_tile.dart` - a custom widget that displays an image in a square tile.
4. `package:auth_project/services/auth_service.dart` - a custom authentication service.
5. `package:firebase_auth/firebase_auth.dart` - the Firebase authentication package.
6. `package:flutter/material.dart` - the material design framework for building Flutter applications.

## Stateful Widget

The `LoginPage` widget extends `StatefulWidget` and overrides the `createState()` method to create an instance of `_LoginPageState`. This is the stateful part of the widget that can change dynamically.

## Private Variables

The `_LoginPageState` class has two private variables for the email and password text fields:

1. `emailController` - A text editing controller for the email text field.
2. `passwordController` - A text editing controller for the password text field.

## Private Methods

The `_LoginPageState` class has two private methods:

1. `signUserIn()` - Signs in a user with their email and password. It shows a `CircularProgressIndicator` while it signs the user in, and shows an error message if the sign-in fails.
2. `ShowErrorMessage(String message)` - A helper method that shows an error message in a dialog.

## Build Method

The `build()` method returns a `Scaffold` widget with a `SafeArea` and a `SingleChildScrollView`. The `SingleChildScrollView` allows the user to scroll the view when the keyboard pops up. The `build()` method also returns a `Column` widget that contains the following:

1. A logo and a "Welcome back you've been missed!" text.
2. Two `MyTextField` widgets for the email and password text fields.
3. A "Forgot Password?" text and a "Sign In" button.
4. A row that displays two `SquareTile` widgets for logging in with Google or Apple.
5. A row that displays a "Not a member?" text and a "Register now" text.

This is the full code snippet for the `LoginPage` widget with documentation.






# MyTextField widget

The `MyTextField` widget is a custom stateless widget that displays a text field with a customizable hint text and obscuring of text input. It takes in a `controller`, `hintText` and `obscureText` as required parameters.

## Import Statements

The `MyTextField` widget imports the following library:

1. `package:flutter/material.dart` - the material design framework for building Flutter applications.

## Constructor

The `MyTextField` widget constructor takes in three required parameters:

1. `controller` - a field that allows manipulation of the text being entered into the text field.
2. `hintText` - a string of text that will be displayed as a hint in the text field.
3. `obscureText` - a boolean value that determines whether the text entered in the text field is obscured or not.

## Build Method

The `build()` method returns a `Padding` widget that encloses a `TextField` widget. The `TextField` widget has a `controller`, an `obscureText` boolean value, and an `InputDecoration` object. The `InputDecoration` object has the following attributes:

1. `enabledBorder` - a border that appears when the text field is enabled.
2. `focusedBorder` - a border that appears when the text field is focused.
3. `fillColor` - the background color of the text field.
4. `filled` - sets whether the background of the `TextField` is filled.
5. `hintText` - the text displayed as a hint when the user hasn't entered any value.

This is the full code snippet for the `MyTextField` widget with documentation.






# SquareTile widget

The `SquareTile` widget is a custom stateless widget that displays a square-shaped container with an image icon. It takes in an image path and an `onTap` function as required parameters.

## Import Statements

The `SquareTile` widget imports the following library:

1. `package:flutter/material.dart` - the material design framework for building Flutter applications.

## Constructor

The `SquareTile` widget constructor takes in two required parameters:

1. `imagePath` - a string path to the image asset.
2. `onTap` - a function that will be executed when the square tile is tapped.

## Build Method

The `build()` method returns a `GestureDetector` widget that encloses a `Container` widget. The `Container` widget has a `padding`, a `decoration`, and a child `Image.asset`. The `GestureDetector` widget has an `onTap` function that is called when the user taps on the square tile.

The `padding` attribute specifies the amount of padding to be provided to the container. The `decoration` attribute specifies the decoration of the container, including the border radius and color.

The `Image.asset` widget displays the image at the location specified in the `imagePath` parameter. The `height` attribute specifies the height of the image widget.

This is the full code snippet for the `SquareTile` widget with documentation.

```dart
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
```





# AuthService class

The `AuthService` class is a custom class that provides a method for signing in a user using Google authentication.

## Import Statements

The `AuthService` class imports two libraries:

1. `package:firebase_auth/firebase_auth.dart` - provides the authentication functionality using Firebase Authentication.
2. `package:google_sign_in/google_sign_in.dart` - provides the authentication functionality using Google Sign-In.

## Method

The `signInWithGoogle()` method is an asynchronous method that returns a `Future<UserCredential?>` object. This method signs in a user using Google authentication.

The method first calls `GoogleSignIn().signIn()` to prompt the user to sign in with their Google account. Upon successful sign-in, the method uses `GoogleSignInAccount` object to get the `GoogleSignInAuthentication` object to obtain the user's authentication credentials.

The next step creates a `GoogleAuthProvider.credential()` object using the `accessToken` and `idToken` from the authentication credentials. This credential is then used to authenticate the user with Firebase Authentication using the `signInWithCredential()` method.

If the authentication is successful, a `UserCredential` object is returned as part of the `Future<UserCredential?>` object.

This is the full code snippet for the `AuthService` class with documentation.

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    // Prompt the user to sign in with their Google account
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain the user's authentication credentials
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create a Google auth credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Authenticate with Firebase Authentication using the Google auth credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
```




# RegisterPage class

The `RegisterPage` class is a `StatefulWidget` that displays a registration form page for a new user to sign up with their email and password, or using their Google or Apple accounts.

## Import Statements

The `RegisterPage` class imports:

1. `package:flutter/material.dart` - provides the core Flutter framework.
2. `package:firebase_auth/firebase_auth.dart` - provides the authentication functionality using Firebase Authentication.
3. `package:auth_project/components/my_button.dart` - imports a custom-made button widget.
4. `package:auth_project/components/my_textfield.dart` - imports a custom-made textfield widget.
5. `package:auth_project/components/square_tile.dart` - imports a custom-made square tile widget.
6. `package:auth_project/services/auth_service.dart` - provides the `signInWithGoogle()` method for authentication using Google.

## Variables

The `RegisterPage` class has the following variables:

1. `emailController` - a `TextEditingController` object representing the email textfield controller.
2. `passwordController` - a `TextEditingController` object representing the password textfield controller.
3. `confirmpasswordController` - a `TextEditingController` object representing the confirm password textfield controller.

## Methods

The `RegisterPage` class has the following methods:

1. `signUserUp()` - a method that is used to sign up the user using their email and password. It shows a loading spinner while signing up and checks for any errors. If there are no errors, it creates a new user using Firebase Authentication's `createUserWithEmailAndPassword()` method. If the password and confirm password fields do not match, it displays an error message.
2. `ShowErrorMessage()` - a method that shows an error message in an `AlertDialog` for any `FirebaseAuthException` errors during the sign-up process.

## Widget Tree

The `RegisterPage` class builds a widget tree comprising of the following widgets:

- `Scaffold` - A top-level widget that provides a framework for standard app features like an app bar, navigation drawer, and more.
  - `SafeArea` - A widget that ensures the user interface is safe regardless of the device on which it is running.
    - `SingleChildScrollView` - A widget that provides a scrollable container; useful when the content of the body is larger than that of the device.
      - `Center` - A widget that centers its child widget along the center of the x and y axes.
        - `Column` - A widget that displays its child widgets in a vertical order.
          - `SizedBox` - A widget that provides a fixed height or width between widgets.
          - `Text` - A widget that displays a text.
          - `MyTextField` - A custom-made widget that displays a textfield with customizable border and text styles.
          - `MyButton` - A custom-made widget that displays a rounded button with customizable label and background color.
          - `Padding` - A widget that insets its child by a given amount of pixels.
            - `Row` - A widget that displays its child widgets in a horizontal order.
              - `Divider` - A widget that displays a horizontal or vertical line.
              - `Text` - A widget that displays a text.
              - `GestureDetector` - A widget that detects gestures on its child widget.
          - `SquareTile` - A custom-made widget that displays a square-shaped tile with customizable image.
          - `Text` - A widget that displays a text.
          
          
          
          
          
          # Documentation for MyButton class

The `MyButton` class is a custom-made button widget that displays a rounded button with a customizable label and background color.

## Import Statements

The `MyButton` class imports:

1. `package:flutter/material.dart` - provides the core Flutter framework.

## Variables

The `MyButton` class has the following variables:

1. `onTap` - a `Function()` object representing the function to be triggered on button press.
2. `text` - a `String` object representing the label to be displayed on the button.

## Methods

The `MyButton` class has no additional methods.

## Widget Tree

The `MyButton` class builds a widget tree comprising of the following widgets:

- `GestureDetector` - A widget that detects gestures on its child widget.
  - `Container` - A widget that provides a fixed height and width with customizable styling.
    - `Center` - A widget that centers its child widget along the center of the x and y axes.
      - `Text` - A widget that displays a text.
      
      
      
      
      
      # LoginOrRegisterPage

The `LoginOrRegisterPage` class is a stateful widget that displays either a login page or a register page based on user's choice. 

## Import Statements

The `LoginOrRegisterPage` class imports:

1. `package:flutter/material.dart` - provides the core Flutter framework.
2. `package:auth_project/pages/login_page.dart` - imports the `LoginPage` class for displaying the login page.
3. `package:auth_project/pages/register_page.dart` - imports the `RegisterPage` class for displaying the register page.

## Variables

The `LoginOrRegisterPage` has the following variables:

1. `showLoginPage` - a boolean variable that decides which page to show based on its value.

## Methods

The `LoginOrRegisterPage` class has the following methods:

1. `togglePages()` -  switches the value of `showLoginPage` when called. 

## Widget tree

The `LoginOrRegisterPage` builds a widget tree comprising of the following widgets:

- `LoginPage` - A widget that displays the login page.
  - `RegisterPage` - A widget that displays the register page.
    - `GestureDetector` - a widget that detects if an onTap event has occurred on the child widget it contains.
      - `Container` - A widget that provides a fixed height and width with customizable styling.
        - `Column` - A widget that arranges its children in a vertical manner. 
          - `Text` - a widget that displays a text message.
          - `TextButton` - a widget that displays a button option for switching between pages.   
   

import 'package:auth_project/components/my_button.dart';
import 'package:auth_project/components/my_textfield.dart';
import 'package:auth_project/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {

    showDialog(context: context, builder: (context){
      return  const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);

    } on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      if(e.code == 'user-not-found'){
        wrongEmailMessage();
      }
      else if(e.code == 'wrong-password'){
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(title: Text('Incorrect Email'),
      );
    }
    );
  }
  void wrongPasswordMessage(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(title: Text('Incorrect Password'),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text("LOGO",
                  style: TextStyle(
                      fontSize: 50),
                ),
                const SizedBox(height: 50),

                Text('Welcome back you\'ve been missed!',
                  style: TextStyle(
                      color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                 MyTextField(
                  controller: emailController,
                   hintText:  'Email',
                   obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(height: 100),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or Continue With'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 30),
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Text('Not a member?'),
                  SizedBox(width: 4),
                  Text('Register now',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

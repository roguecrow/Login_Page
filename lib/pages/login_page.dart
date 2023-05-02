import 'package:auth_project/components/my_button.dart';
import 'package:auth_project/components/my_textfield.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
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
                controller: usernameController,
                 hintText:  'Username',
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

              const SizedBox(height: 50),

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
              Row(children: [
                Image.asset('lib/images/apple.png',
                  height: 72,
                ),
                Image.asset('lib/images/google.png',
                  height: 72,
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUserIn() {

  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_application/datamodels/profile.dart';
import 'package:my_application/pages/first_page.dart';
import 'package:my_application/pages/forgotpassword_page.dart';
import 'package:my_application/pages/register_page.dart';

import '../components/login components/login_form_textfield.dart';
import '../components/login components/singinbtn.dart';
import '../components/login components/squaretile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Profile profile = Profile(
      firstName: '',
      lastName: '',
      nationalityCardId: '',
      address: '',
      tel: '',
      email: '',
      password: '',
      confirmPassword: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.grey[300],
              body: SafeArea(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25),

                          //logo
                          const Icon(
                            Icons.lock,
                            size: 70,
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "Welcome back again!",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Username textfield
                          LogInFormTextField(
                            controller: usernameController,
                            hintText: "email",
                            obscureText: false,
                            onSaved: (text) {
                              profile.email = text;
                            },
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please insert your email'),
                              EmailValidator(
                                  errorText: 'Email pattern invalid')
                            ]),
                          ),

                          const SizedBox(height: 25),

                          // Password text field
                          LogInFormTextField(
                            controller: passwordController,
                            hintText: "password",
                            obscureText: true,
                            onSaved: (text) {
                              profile.password = text;
                            },
                            validator: RequiredValidator(
                                errorText: 'Please insert password'),
                          ),

                          const SizedBox(height: 5),

                          // Forgot password?
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ForgotPassWord();
                                      }));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.grey[600]),
                                    ))
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Sign In Button
                          SignInBtn(onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState?.save();
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: profile.email.toString(),
                                        password: profile.password.toString())
                                    .then((value) {
                                  formKey.currentState?.reset();
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return FirstPage();
                                  }));
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message.toString(),
                                    gravity: ToastGravity.TOP);
                              }
                            }
                          }),

                          const SizedBox(height: 25),

                          // Or continue with
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "Or continue with",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ))
                            ]),
                          ),

                          const SizedBox(height: 25),

                          // Google, Facebook button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SquareTile(
                                  imagePath: 'asset/images/google-logo.png'),
                              SizedBox(
                                width: 20,
                              ),
                              SquareTile(
                                  imagePath: 'asset/images/facebook-logo.jpg'),
                            ],
                          ),

                          const SizedBox(height: 15),

                          // Not a member?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Not a member?",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(width: 2),
                              TextButton(
                                  child: Text(
                                    "Register now",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage();
                                    }));
                                  })
                            ],
                          ),

                          const SizedBox(height: 5),

                          // Not now
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return FirstPage();
                                    }));
                                  },
                                  child: Text(
                                    "Not now",
                                    style: TextStyle(color: Colors.blueAccent),
                                  )),
                              Text(
                                "(Using without sign in)",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}


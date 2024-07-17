import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_application/pages/login_page.dart';
import 'package:my_application/models/profile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

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
                body: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Text(
                                "Please insert your information",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "First Name",
                                    hintText: "First Name"),
                                onSaved: (text) {
                                  profile.firstName = text;
                                },
                                validator: RequiredValidator(
                                    errorText: 'Please insert your first name'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Last Name",
                                    hintText: "Last Name"),
                                onSaved: (text) {
                                  profile.lastName = text;
                                },
                                validator: RequiredValidator(
                                    errorText: 'Please insert your last name'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Nationality Card ID",
                                    hintText: "Nationality Card ID"),
                                onSaved: (text) {
                                  profile.nationalityCardId = text;
                                },
                                validator: RequiredValidator(
                                    errorText:
                                        'Please insert your nationality card ID'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                minLines: 1,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    labelText: "Address", hintText: "address"),
                                onSaved: (text) {
                                  profile.address = text;
                                },
                                validator: RequiredValidator(
                                    errorText: 'Please insert your address'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Tel No.", hintText: "tel no."),
                                onSaved: (text) {
                                  profile.tel = text;
                                },
                                validator: RequiredValidator(
                                    errorText: 'Please insert your tel no.'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Email", hintText: "email"),
                                onSaved: (text) {
                                  profile.email = text;
                                },
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Please insert your email'),
                                  EmailValidator(
                                      errorText: 'Email pattern invalid')
                                ]),
                                //RequiredValidator(errorText: 'Please insert your email'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "password"),
                                obscureText: true,
                                onSaved: (text) {
                                  profile.password = text;
                                },
                                validator: RequiredValidator(
                                    errorText: 'Please insert password'),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    hintText: "confirm password"),
                                obscureText: true,
                                onSaved: (text) {
                                  profile.confirmPassword = text;
                                },
                                validator: RequiredValidator(
                                    errorText:
                                        'Please insert confirm password'),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginPage();
                                        }));
                                      },
                                      child: Text("Go Back")),
                                  ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState?.save();
                                          try {
                                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                              email: profile.email.toString(),
                                              password: profile.password.toString(),
                                             ).then((value) async {
                                              await userCollection.add({
                                              "First Name": profile.firstName,
                                              "Last Name": profile.lastName,
                                              "Nationality Card ID or Passport ID": profile.nationalityCardId,
                                              "Address": profile.address,
                                              "Tel": profile.tel,
                                              "Email": profile.email,
                                              "Password": profile.password,
                                              }).then((value) {
                                                formKey.currentState?.reset();
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Account created successfully",
                                                    gravity: ToastGravity.TOP);
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return LoginPage();
                                                }));
                                              });
                                            });
                                          } on FirebaseAuthException catch (e) {
                                            Fluttertoast.showToast(
                                                msg: e.message.toString(),
                                                gravity: ToastGravity.TOP);
                                          }
                                        }
                                      },
                                      child: Text("Register"))
                                ],
                              )
                            ]),
                          ),
                        ))));
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

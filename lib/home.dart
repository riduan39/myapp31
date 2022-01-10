import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp31/provider/proider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  bool isLogIn = false;

  String email = "";
  String password = "";
  String username = "";

  _handleSignUpData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      isLogIn ? signup(email, password) : signin(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Email/Pass Auth"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLogIn
                    ? TextFormField(
                  key: ValueKey("name"),
                        decoration:
                            InputDecoration(hintText: "Enter Your User Name"),
                        validator: (value) {
                          if (value.toString().length < 3) {
                            return "Username is Small";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            username = value!;
                          });
                        },
                      )
                    : Container(),
                TextFormField(
                  key: ValueKey("Email"),
                  decoration: InputDecoration(hintText: "Enter Your Email"),
                  validator: (value) {
                    if (!(value.toString().contains("@"))) {
                      return "Invalid email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                TextFormField(
                  key: ValueKey("Password"),
                  decoration: InputDecoration(hintText: "Enter Your Password"),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return "weak password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSignUpData,
                    child: isLogIn ?  Text("Sign Up") : Text("Login"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogIn = !isLogIn;
                    });
                  },
                  child: isLogIn ? Text("Already SignUp ? Login") : Text("Already have an Account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';
import 'package:movie_app/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SignupView> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  late String name, email, password;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    // _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
                color: new Color(0xffF5591F),
                gradient: LinearGradient(
                  colors: [(Color.fromRGBO(36, 54, 101, 1.0)), Color.fromARGB(255, 100, 96, 93)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/images/movie_logo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (nameValue) {
                  if (nameValue!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  name = nameValue;
                  return null;
                },
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffF5591F),
                  ),
                  labelText: "Username",
                  hintText: "Enter Username",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (emailValue) {
                  if (emailValue!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailValue)) {
                    return 'Masukan Email!';
                  }
                  email = emailValue;
                  return null;
                },
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  labelText: "Email",
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                obscureText: _secureText,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (passwordValue) {
                  if (passwordValue!.isEmpty) {
                    return 'Masukan Password!';
                  }
                  password = passwordValue;
                  return null;
                },
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  focusColor: Color(0xffF5591F),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                  ),
                  labelText: "Password",
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                obscureText: _secureText,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (passwordValue) {
                  if (passwordValue!.isEmpty) {
                    return 'Masukan Password!';
                  }
                  password = passwordValue;
                  return null;
                },
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                  ),
                  labelText: "Confirm Password",
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // if (_formKey.currentState!.validate()) {
                //   _register();
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 35),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [(Color.fromRGBO(36, 54, 101, 1.0)), Color.fromARGB(255, 100, 96, 93)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: Text(
                  _isLoading ? 'Proccessing..' : 'REGISTER',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account?  "),
                  GestureDetector(
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        )));
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'name': name, 'email': email, 'password': password};

    var res = await Network().auth(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else {
      if (body['message']['name'] != null) {
        _showMsg(body['message']['name'][0].toString());
      } else if (body['message']['email'] != null) {
        _showMsg(body['message']['email'][0].toString());
      } else if (body['message']['password'] != null) {
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}

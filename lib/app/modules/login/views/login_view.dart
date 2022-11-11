import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/views/home_view.dart';
import 'package:movie_app/app/modules/signup/views/signup_view.dart';
import 'package:movie_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../network/api.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginView> {
  var _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _isLoading = false;
  bool _isHiddenPassword = true;

  showHide() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  late String email, password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
                color: new Color.fromRGBO(36, 54, 101, 1.0),
                gradient: LinearGradient(
                  colors: [
                    (Color.fromRGBO(36, 54, 101, 1.0)),
                    Color.fromARGB(255, 100, 96, 93)
                  ],
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
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Login",
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                obscureText: _isHiddenPassword,
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
                    icon: Icon(_isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  labelText: "Password",
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Write Click Listener Code Here
                },
                child: Text("Forget Password?"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color.fromRGBO(36, 54, 101, 1.0)),
                    Color.fromARGB(255, 100, 96, 93)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?  "),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        )));
  }

  _login() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      // _showAlertDialog(context);
      setState(() {
        _isLoading = true;
      });
      var data = {'email': email, 'password': password};
      var res = await Network().auth(data, '/login');
      var body = json.decode(res.body);
      _formKey.currentState!.save();

      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => HomeView()),
        );
      } else {
        // _showMsg(msg) {
        //   final snackBar = SnackBar(
        //     content: Text(msg),
        //   );
        //   _scaffoldKey.currentState!.showSnackBar(snackBar);
        // }
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
}

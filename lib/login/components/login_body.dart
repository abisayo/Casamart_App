import 'package:Casamart/constants.dart';
import 'package:Casamart/login/components/sign_form.dart';
import 'package:Casamart/register/register.dart';
import 'package:Casamart/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return LoginBody();
      },
    );
  }
}

class _LoginBodyState extends State<LoginBody> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  

  // initialize login state
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: new SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: KButtonColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Login with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                buildGoogleButton(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changeScreen(context, Register());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: KPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.grey[200],
        onPressed: () async {
          // User user = await auth.googleSignIn();
          // if (user != null) {
          //   _userServices.createUser({
          //     "name": user.displayName,
          //     "photo": user.photoURL,
          //     "email": user.email,
          //     "userId": user.uid,
          //     "phone": user.phoneNumber
          //   });
          //   changeScreenReplacement(context, HomeScreen());
          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                height: getProportionateScreenHeight(30),
                width: getProportionateScreenWidth(30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/google.png"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.bold,
                color: KButtonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

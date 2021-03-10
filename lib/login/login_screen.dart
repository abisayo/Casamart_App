import 'package:Casamart/components/custom_suffix_icon.dart';
import 'package:Casamart/register/register.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import 'package:Casamart/constants.dart';
import 'package:provider/provider.dart';
import 'package:Casamart/provider/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("Sign In"),
          centerTitle: true,
        ),
        body: user.status == Status.Authenticating
            ? Loading()
            : SingleChildScrollView(
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                buildEmailFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(30)),
                                buildPasswordFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(30)),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: remember,
                                        activeColor: KPrimaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            remember = value;
                                          });
                                        }),
                                    Text("Remember me"),
                                    Spacer(),
                                    Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                                SizedBox(
                                  width: double.infinity,
                                  height: getProportionateScreenHeight(56),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: KPrimaryColor,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        if (!await user.signIn(
                                            _emailTextController.text,
                                            _passwordTextController.text))
                                          _key.currentState.showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text("Sign In Failed")));
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(20),
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryLightColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
                    )),
              ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextController,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your mail",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/images/mail.svg"),
          border: InputBorder.none),
      validator: (value) {
        if (value.isEmpty) {
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return "Please make sure your email address is valid";
          } else {
            return null;
          }
        }
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordTextController,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/images/key.svg",
          ),
          border: InputBorder.none),
      validator: (value) {
        if (value.isEmpty) {
          return "The password field cannot be empty";
        } else if (value.length < 6) {
          return "The Password has to be at least 6 characters long";
        }
        return null;
      },
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

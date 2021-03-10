import 'package:Casamart/components/custom_suffix_icon.dart';
import 'package:Casamart/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../size_config.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmpasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: user.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      Text(
                        "Register Account",
                        style: TextStyle(
                          color: KButtonColor,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Register with your email, name,\n Phone Number and password",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.08),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            buildNameFormField(),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            buildEmailFormField(),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            buildPhoneFormField(),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            buildPasswordFormField(),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            buildConfirmPasswordFormField(),
                            SizedBox(height: getProportionateScreenHeight(30)),
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
                                    if (!await user.signUp(
                                        _emailTextController.text,
                                        _passwordTextController.text,
                                        _phoneTextController.text,
                                        _nameTextController.text))
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text("Sign Up Failed")));
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: KPrimaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: _nameTextController,
      decoration: InputDecoration(
          labelText: "Full Name",
          hintText: "Enter your name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/images/user.svg"),
          border: InputBorder.none),
      validator: (value) {
        if (value.isEmpty) {
          return "The name field cannot be empty";
        }
        return null;
      },
    );
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: _phoneTextController,
      decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/images/phone.svg"),
          border: InputBorder.none),
      validator: (value) {
        if (value.isEmpty) {
          return "The phone number field cannot be empty";
        }
        return null;
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
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/images/key.svg"),
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

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _confirmpasswordTextController,
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/images/key.svg"),
          border: InputBorder.none),
      validator: (value) {
        if (value.isEmpty) {
          return "The password field cannot be empty";
        } else if (value.length < 6) {
          return "The Password has to be at least 6 characters long";
        } else if (_passwordTextController.text != value) {
          return "the passwords do not match";
        }
        return null;
      },
    );
  }
}

import 'package:Casamart/components/custom_suffix_icon.dart';
import 'package:Casamart/constants.dart';
import 'package:Casamart/provider/user_provider.dart';
import 'package:Casamart/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() :  Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
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
            SizedBox(height: getProportionateScreenHeight(20)),
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
                    if (!await user.signIn(_emailTextController.text,
                        _passwordTextController.text))
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("Sign In Failed")));
                  }
                },
                child: Text(
                  "Login",
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
    );
    // ignore: dead_code
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
}

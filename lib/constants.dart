import 'package:flutter/material.dart';

const KPrimaryColor = Colors.green;
const KPrimaryLightColor = Color(0xFFFFECDF);
const KPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const KSecondaryColor = Color(0xFF979797);
const KTextColor = Color(0xFF757575);
const KButtonColor = Colors.black;

const KAnimationDuration = Duration(milliseconds: 200);

//methods

void changeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

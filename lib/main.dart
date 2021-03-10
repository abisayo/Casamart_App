import 'package:Casamart/provider/user_provider.dart';
import 'package:Casamart/screens/splash/splash_screen.dart';
import 'package:Casamart/userdashboard/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/login_screen.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider.initialize(),
    child: MaterialApp(
        title: 'Casamart',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: ScreenController()),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return SplashScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomeScreen();
      default : return SplashScreen();
    }
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//   // This widget is the root of your application
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Casamart',
//       debugShowCheckedModeBanner: false,
//       theme: theme(),
//       home: SplashScreen()
//     );
//   }
// }

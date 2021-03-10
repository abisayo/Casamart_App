import 'package:Casamart/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: _currentTab,
      onTap: (int value) {
        switch (value) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
          case 4:
            user.signOut();
            break;
        }
        setState(() {
          _currentTab = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20.0,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Home",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            size: 20.0,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Products",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_basket_rounded,
            size: 20.0,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Orders",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            size: 20.0,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Categories",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 20.0,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

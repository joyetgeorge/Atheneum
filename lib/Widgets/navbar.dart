import 'package:Atheneum/Screens/AddData_Page.dart';
import 'package:Atheneum/Screens/Books.dart';
import 'package:Atheneum/Screens/Cart.dart';
import 'package:Atheneum/Screens/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List Pages = [
      HomeScreen(),
      Books(),
      Cart(),
      Scaffold(
        body: Center(child: Text("Wishlist")),
      ),
      Scaffold(
        body: Center(child: Text("Profile")),
      ),
    ];
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      currentIndex: index,
      onTap: (int index) {
        setState(() {
          this.index = index;
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Pages[index],
              ));
        });
      },
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              FeatherIcons.home,
              color: Colors.black,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.book,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              FeatherIcons.book,
              color: Colors.black,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.shoppingCart,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              FeatherIcons.shoppingCart,
              color: Colors.black,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.heart,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              FeatherIcons.heart,
              color: Colors.black,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.user,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              FeatherIcons.user,
              color: Colors.black,
            ),
            label: ""),
      ],
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/view/scan_page.dart';
import 'package:flutter_onboarding/view/screens/cart_page.dart';
import 'package:flutter_onboarding/view/screens/favorite_page.dart';
import 'package:flutter_onboarding/view/screens/home_page.dart';
import 'package:flutter_onboarding/view/screens/profile_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomePage(),
      FavoritePage(favoritedPlants: favorites,),
      CartPage(addedToCartPlants: myCart,),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
 

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: const TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
           const Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
       Get.toNamed(AppRoutes.qrPage);
        },
        backgroundColor: Constants.primaryColor,
        child:  Image.asset(ImageAssets.floatingActionButtonImage, height: 30.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: Constants.iconsBottomNavBar,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritesPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritesPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        }
      ),
    );
  }
}

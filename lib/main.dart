import 'package:dragonstone/aboutpage/about_page.dart';
import 'package:dragonstone/charactersscreen/characters_screen.dart';
import 'package:dragonstone/dragonscreen/dragon_screen.dart';
import 'package:dragonstone/homescreen/home_screen.dart';
import 'package:dragonstone/mapscreen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_tabbar_widget/rounded_tabbar_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: RoundedTabbarWidget(
        itemNormalColor: Colors.white,
        itemSelectedColor: Colors.grey,
        tabBarBackgroundColor: Colors.black87,
        tabIcons: const [
          FontAwesomeIcons.house,
          FontAwesomeIcons.crown,
          FontAwesomeIcons.map,
          FontAwesomeIcons.dragon,
          FontAwesomeIcons.circleInfo,
        ],
        pages:  const [
          HomeScreen(),
          CharactersScreen(),
          MapScreen(),
          DragonScreen(),
          AboutPage(),
        ],
        selectedIndex: 0,
      ),
    );

  }
}

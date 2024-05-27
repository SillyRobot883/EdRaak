import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/choose_game_screen/game_catalog_screen.dart';
import 'package:test_1/main_screen/LoginPage.dart';
import 'package:test_1/main_screen/Settings.dart';
import 'package:get/get.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/Main_menu_Image.png'), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 95.0),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => GameCatalog(),
                          transition: Transition.zoom,
                          duration: Duration(milliseconds: 300));

                      //make it go to the catalog page
                      // was The_game()
                    },
                    style: ElevatedButton.styleFrom(
                      // Set background color
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'العب',
                      style: GoogleFonts.tajawal(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                FirebaseAuth.instance.currentUser == null
                    ? ElevatedButton(
                        child: Text(
                          'تسجيل دخول',
                          style: GoogleFonts.tajawal(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Get.to(() => LoginPage(),
                              transition: Transition.leftToRight,
                              duration: Duration(milliseconds: 400));
                        },
                      )
                    : SizedBox(),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  child: Text(
                    'الإعدادات',
                    style: GoogleFonts.tajawal(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Get.to(() => Settings(),
                        transition: Transition.downToUp,
                        duration: Duration(milliseconds: 400));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:test_1/main.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  String? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/assets/image/images/SettingsPage.jpg'), // Replace with your actual image path
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Center(
                child: Text(
              'الإعدادات',
              style: GoogleFonts.tajawal(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
            const SizedBox(
              height: 70,
            ),
            Center(
                child: Text(
              'اختر لون صناديق الإجابه',
              style: GoogleFonts.tajawal(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
            SizedBox(
                height: 200,
                width: 280,
                child: GridView(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 30,
                  ),
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("color", "amber");
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'تم إختيار اللون',
                            message: '',
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      color: Colors.amber,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("color", "white");
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'تم إختيار اللون',
                            message: '',
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      color: Colors.white,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("color", "blue");
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'تم إختيار اللون',
                            message: '',
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      color: Colors.blue,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("color", "grey");
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'تم إختيار اللون',
                            message: '',
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      color: Colors.grey,
                    ),
                  ],
                )),
            const SizedBox(
              height: 75,
            ),
            MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainMenu(),
                  ));
                },
                child: Text(
                  'حفظ',
                  style: GoogleFonts.tajawal(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:test_1/main_screen/main_menu.dart';
import 'package:provider/provider.dart';
import 'audio_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? color;
  bool isSoundOn = true;
  double volume = 1.0;

  @override
  void initState() {
    super.initState();
    loadPreferences();
    final audioManager = Provider.of<AudioManager>(context, listen: false);
    audioManager.init().then((_) {
      if (isSoundOn) {
        audioManager.setVolume(volume);
        audioManager.play();
      }
    });
  }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSoundOn = prefs.getBool('isSoundOn') ?? true;
      volume = prefs.getDouble('volume') ?? 1.0;
    });
  }

  void savePreferences(bool isSoundOn, double volume) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSoundOn', isSoundOn);
    prefs.setDouble('volume', volume);
  }

  void toggleSound() {
    setState(() {
      isSoundOn = !isSoundOn;
      final audioManager = Provider.of<AudioManager>(context, listen: false);
      if (isSoundOn) {
        audioManager.setVolume(volume);
        audioManager.play();
      } else {
        audioManager.stop();
      }
      savePreferences(isSoundOn, volume);
    });
  }

  void updateVolume(double newVolume) {
    setState(() {
      volume = newVolume;
      if (isSoundOn) {
        final audioManager = Provider.of<AudioManager>(context, listen: false);
        audioManager.setVolume(volume);
      }
      savePreferences(isSoundOn, volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image/images/SettingsPage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100), // Adjust top margin to move content upwards
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
                ),
              ),
              const SizedBox(height: 30), // Reduced space
              Center(
                child: Text(
                  'اختر لون صناديق الإجابه',
                  style: GoogleFonts.tajawal(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
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
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("color", "amber");
                        final snackBar = SnackBar(
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
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("color", "white");
                        final snackBar = SnackBar(
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
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("color", "blue");
                        final snackBar = SnackBar(
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
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("color", "grey");
                        final snackBar = SnackBar(
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
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150, // Explicitly set the width
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Get.offAll(
                          () => MainMenu(),
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      child: Text(
                        'حفظ',
                        style: GoogleFonts.tajawal(
                          fontSize: 16.0, // Adjust font size here
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150, // Match the width of the "حفظ" button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSoundOn ? Colors.red : Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        isSoundOn ? 'إيقاف الصوت' : 'تشغيل الصوت',
                        style: GoogleFonts.tajawal(
                          fontSize: 16.0, // Adjust font size to match "حفظ"
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: toggleSound,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'مستوى الصوت',
                style: GoogleFonts.tajawal(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Slider(
                  value: volume,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  label: (volume * 100).round().toString(),
                  onChanged: (double value) {
                    updateVolume(value);
                  },
                ),
              ),
              const SizedBox(height: 10), // Add space for the logout button
              FirebaseAuth.instance.currentUser == null
                  ? SizedBox()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange[600],
                      ),
                      child: Text(
                        FirebaseAuth.instance.currentUser!.email == null
                            ? 'تسجيل خروج'
                            : '${FirebaseAuth.instance.currentUser!.email} تسجيل خروج من ',
                        style: GoogleFonts.tajawal(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      onPressed: () async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        googleSignIn.disconnect();
                        await FirebaseAuth.instance.signOut();
                        final snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'تم تسجيل الخروج بنجاح',
                            message: '',
                            contentType: ContentType.success,
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          " MainMenu ",
                          (route) => false,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

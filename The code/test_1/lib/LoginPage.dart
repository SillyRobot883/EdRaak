import 'package:flutter/material.dart';
import 'package:test_1/The_game.dart';

void LoginPage1() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // TODO: Add authentication logic here (e.g., check against a database)

    // For demonstration purposes, just print the credentials
    print('Username: $username, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edrak Game  Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/Login_Page_Background.png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/main_CharacterTheme.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16.0),
            Text(
              'Edrak',
              style: TextStyle(
                fontSize: 24.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement play button action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => The_game()),
                );
              },
              child: Text('Play as a guest'),
            ),
          ],
        ),
      ),
    );
  }
}

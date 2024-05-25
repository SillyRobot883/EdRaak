import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_1/main_screen/SignUp.dart';

void main() {
  // Create a mock FirebaseAuth instance
  final mockAuth = MockFirebaseAuth();

  group('SignUp Page', () {
    testWidgets('SignUp Page UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUp()));

      expect(find.text('التسجيل'), findsOneWidget);
      expect(find.text('اسم المستخدم'), findsOneWidget);
      expect(find.text('البريد الالكتروني'), findsOneWidget);
      expect(find.text('كلمة السر'), findsOneWidget);
      expect(find.text('تسجيل'), findsOneWidget);
    });

    testWidgets('SignUp Page Functionality Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUp()));

      // Find the input fields and button
      final usernameField = find.byType(TextFormField).at(0);
      final emailField = find.byType(TextFormField).at(1);
      final passwordField = find.byType(TextFormField).at(2);
      final signUpButton = find.text('تسجيل');

      // Enter valid details
      await tester.enterText(usernameField, 'testuser');
      await tester.enterText(emailField, 'testuser@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.tap(signUpButton);
      await tester.pump();

      // Verify the interaction with FirebaseAuth
      verify(mockAuth.createUserWithEmailAndPassword(
        email: 'testuser@example.com',
        password: 'password123',
      )).called(1);
    });
  });
}

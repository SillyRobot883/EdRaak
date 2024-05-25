// Import necessary libraries
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mock annotations using @GenerateMocks
@GenerateMocks([FirebaseAuth])
class MockFirebaseAuth extends Mock implements FirebaseAuth {
  // Optionally define mock behavior for specific methods
  // Example:
  User? currentUser;

  @override
  User? get currentUser => currentUser;

  // You can define mocks for other methods as needed
}
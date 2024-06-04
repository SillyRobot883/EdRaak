// web_interop.dart
@JS()
library interop;

import 'package:js/js.dart';

@JS('signInWithGoogle')
external Future<dynamic> signInWithGoogle();
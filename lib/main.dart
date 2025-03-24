import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eos_advance_login/screens/login_screen.dart';
import 'package:eos_advance_login/screens/home_screen.dart';
import 'package:eos_advance_login/theme/foundation/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Firebase 초기화 대기 중
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return HomeScreen(); // 로그인 후 홈 화면으로 이동
          } else {
            return LoginScreen(); // 로그인 화면
          }
        },
      ),
    );
  }
}

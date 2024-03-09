import 'package:coody_delivery/core/utils/colors.dart';
import 'package:coody_delivery/features/home/home_view.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBVQjLm_eniH4zi5f9Jo-AJeVOBhqqFU0s',
          appId: 'com.kimit.delivery',
          messagingSenderId: '968110009539',
          projectId: 'conloe'));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.colorprimer,
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
          scaffoldBackgroundColor: Colors.white,

          snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.red),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Color(0xfff0f5fa),
            alignLabelWithHint: true,

            // // contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff31343d)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xfff0f5fa),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff0f5fa)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xfff0f5fa),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xfff0f5fa),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          // useMaterial3: false
        ),
        home: HomeView());
  }
}

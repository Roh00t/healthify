import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/views/about_page_view.dart';
import 'package:healthify/views/editProfile_page_view.dart';
import 'package:healthify/views/fitness_page_view.dart';
import 'package:healthify/views/home_page_view.dart';
import 'package:healthify/views/login_page_view.dart';
import 'package:healthify/views/menu_page_view.dart';
import 'package:healthify/views/profile_page_view.dart';
import 'package:healthify/views/register_page_view.dart';
import 'package:healthify/views/setting_page_view.dart';
import 'package:healthify/views/welcome_page_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
void main() async{
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode)
      exit(1);
  };
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthService>(create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: kBackgroundColor,
          primarySwatch: Colors.blue,
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomePage(),
        routes: {
          '/home':(context)=> HomePage(),
          '/welcome':(context)=> WelcomePage(),
          '/login':(context)=> LoginPage(),
          '/register':(context)=> RegisterPage(),
          '/about':(context)=>AboutPage(),
          '/fitness':(context)=>FitnessPage(),
          '/menu':(context)=>MenuPage(),
          '/settings':(context)=>SettingsPage(),
          '/profile':(context)=> ProfilePage(),
          '/editProfile':(context)=>EditProfilePage(),
        },
        
      ),
    );
  }
}
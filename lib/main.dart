import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/services/auth_service.dart';
import 'package:healthify/services/wrapper.dart';
import 'package:healthify/views/login_page_view.dart';
import 'package:healthify/views/register_page_view.dart';
import 'package:healthify/views/welcome_page_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async{
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
        home: AnimatedSplashScreen(
          duration: 1500,
          splash: Image.asset('assets/images/splashScreen.png'),
          nextScreen: WelcomePage(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.amber,
        ),
        routes: {
          '/welcome':(context)=> WelcomePage(),
          '/login':(context)=> LoginPage(),
          '/register':(context)=> RegisterPage(),
          '/home':(context)=> Wrapper(),
        },
      ),
    );
  }
}
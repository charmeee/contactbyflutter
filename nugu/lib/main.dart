import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:nugu/mainpage.dart';
import 'package:nugu/login.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

import 'package:flutterfire_ui/auth.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
        title: "그..누구?",
      )
  );
}

class MyApp extends StatefulWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userEmail="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return login();
              // return SignInScreen(
              //     providerConfigs: [
              //       GoogleProviderConfiguration(
              //         clientId:
              //         '73355516548-lfc27mq0rbamsii9jbp3vufo3ulgnsk1.apps.googleusercontent.com',
              //       ),
              //       EmailProviderConfiguration(),
              //     ]
              //);
            } else {

              return mainpage(userEmail:snapshot.data?.email.toString(),uid: snapshot.data?.uid,);
            }
          },
        ),
      ),
    );
  }


}


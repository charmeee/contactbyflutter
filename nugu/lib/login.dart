import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:nugu/mainpage.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ],
);

class login extends StatefulWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  var userEmail;
  GoogleSignInAccount? user = _googleSignIn.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override



  Widget build(BuildContext context) {

    Future<User?> signInWithGoogle() async {
      // Trigger the authentication flow

      final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: ['email']).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? fireUser = authResult.user;

      // Once signed in, return the UserCredential
      return fireUser;
    }

    return  Scaffold(
        backgroundColor: const Color(0xffB9CEEB),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('img/logo.png',height: 200,width: 200,),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(userEmail ??""),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.indigo,
                        ),
                        onPressed: user !=null?null: ()async{signInWithGoogle(); setState(() {
                          userEmail=user?.email.toString();
                        });},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.android,),
                            Text("구글로그인" ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

//await
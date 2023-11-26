import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:project_firebase/pages/home.dart';
import 'package:project_firebase/pages/signup.dart';
import 'package:project_firebase/services/Auth_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _nameState();
}

class _nameState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = signup();

   @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? tokne = await authClass.getToken();
    print("tokne");
    if (tokne != null)
      setState(() {
        currentPage = myhome();
      });
  }

 
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: currentPage,
    );

} }
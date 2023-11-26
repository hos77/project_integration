import 'package:flutter/material.dart';
import 'package:project_firebase/pages/signin.dart';
import 'package:project_firebase/services/Auth_service.dart';

class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _nameState();
}

class _nameState extends State<myhome> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authClass.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => signin()),
                    (route) => false);
              }),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class DrawerNabvar extends StatefulWidget {
  String url;
  String name;
  String email;
  DrawerNabvar({
    required this.url,
    required this.name,
    required this.email,
  });
  @override
  _DrawerNabvarState createState() => _DrawerNabvarState(
        url: url,
        name: name,
        email: email,
      );
}

class _DrawerNabvarState extends State<DrawerNabvar> {
  String url;
  String name;
  String email;
  _DrawerNabvarState({
    required this.url,
    required this.name,
    required this.email,
  });
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: ListView(
      children: [
        UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(child: Image.network(url),),
          
        ),
        decoration: BoxDecoration(
          color: Colors.orange
        ),
        )
      ],
     ),
     
    );
  }
}

import 'package:eshop/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PhnOTP extends StatefulWidget {
  const PhnOTP({super.key});

  static  String verfiy ="";

  @override
  State<PhnOTP> createState() => _PhnOTPState();
}

class _PhnOTPState extends State<PhnOTP> {

   GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  TextEditingController countryCode = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/avatar.jpg',
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Verify With Google',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "We need to register your profile before getting started !",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
           
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()  {
                 _googleSignIn.signIn().then((userData) {
              setState(() {
                _userObj = userData;
                url = _userObj!.photoUrl.toString();
                name = _userObj!.displayName.toString();
                email = _userObj!.email;
              });
              if (userData != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (Dashborad()),
                  ),
                );
              }
            }).catchError((e) {
              print(e);
            });
                 
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('images/google.png')),
                    Text(
                      "Sing In with Google",
                      style: TextStyle(fontSize: 21),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:eshop/pages/dashboard.dart';
import 'package:eshop/pages/inbox.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyProfile extends StatefulWidget {

  
  String url;
  String name;
  String email;
  MyProfile({
    required this.url,
    required this.name,
    required this.email,
  });
  

  @override
  State<MyProfile> createState() => MyProfileStatefulWidgetState(
        url: url,
        name: name,
        email: email,
      );
}

class MyProfileStatefulWidgetState extends State<MyProfile> {
  String url;
  String name;
  String email;
  MyProfileStatefulWidgetState({
    required this.url,
    required this.name,
    required this.email,
  });
  GoogleSignIn _googleSignIn = GoogleSignIn();
var selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashborad()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => InboxWidget()));
        break;
      case 2:
        print('Case 2');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyProfile(
                      url: url,
        name: name,
        email: email,
                    )));

        break;
    }
  }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: Colors.orange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Profile Page')],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 55),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(6), // Border radius
                    child: ClipOval(child: Image.network(url)),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              email,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.orange, width: 1),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Edit your account",
                    style: TextStyle(color: Colors.orange),
                  )),
            ),
            Container(
              width: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 20,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor:
                                    Colors.orange, // <-- Button color
                                foregroundColor: Colors.red, // <-- Splash color
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Settings',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 161, 106, 23),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor:
                                  Colors.orange, // <-- Button color
                              foregroundColor: Colors.red, // <-- Splash color
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'Purchanse History',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 161, 106, 23),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor:
                                  Colors.orange, // <-- Button color
                              foregroundColor: Colors.red, // <-- Splash color
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'About Us',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 161, 106, 23),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.do_not_disturb_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor:
                                  Colors.orange, // <-- Button color
                              foregroundColor: Colors.red, // <-- Splash color
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 55, 55)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // TextButton(
            //   onPressed: () {
            //     _googleSignIn.signOut().then((value) {
            //       setState(() {});
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => (PhnOTP()),
            //         ),
            //       );
            //     }).catchError((e) {});
            //   },
            //   child: Text("Logout"),
            // )
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
                activeIcon: Icon(Icons.chat)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(Icons.person)),
          ]),
    );
  }
}

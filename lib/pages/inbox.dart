import 'package:eshop/pages/dashboard.dart';
import 'package:eshop/pages/myProfile.dart';
import 'package:flutter/material.dart';

class InboxWidget extends StatefulWidget {
  const InboxWidget({super.key});

  @override
  State<InboxWidget> createState() => _InboxWidgetState();
}

class _InboxWidgetState extends State<InboxWidget> {
  var selectedIndex = 0;

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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          var myProfile = MyProfile(
            url: '',
            email: '',
            name: '',
          );
          return myProfile;
        }));

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
            children: [
              Text(
                'Inbox',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Message.........yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(239, 228, 228, 1),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 2,
                        spreadRadius: 0,
                      )
                    ]),
                    width: 200,
                   
                    height: 60,
                    child: Card(
                      color: Colors.white60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          
                          "Start your Conversetion",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  
                  ),
                 
                ],
              ),
              SizedBox(height: 40,),
              Divider(color: const Color.fromARGB(255, 132, 130, 130),),
              SizedBox(height: 4,),
              Row(
                children: [
                 Text("Cann't find your message here ?",style: TextStyle(fontSize: 15)),
                 Text(' Visit the help center',style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w500),)
                ],
              )
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
            ]));
  }
}

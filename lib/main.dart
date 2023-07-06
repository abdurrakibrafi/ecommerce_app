import 'package:eshop/pages/on_bording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();
  Stripe.publishableKey='pk_test_51NLelAGY8WYpXeJ18coHEWR6Ah2nQuFr8w4S8Uz3bQnjA3711dpERYtAQF5GhGBjnUHXXLNPNx8GwUqMXwi6jNHe00QZ1JFlYI';
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ProviderScope(
      child: MaterialApp(
  //       routes: {
  //   '/home': (context) => Dashborad(),
  //   '/chat': (context) => Dashborad(),
  //   '/profile': (context) => MyProfile(),
  // },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
Navigator.of(context).pushReplacement(
  CupertinoPageRoute(builder: (ctx) => const Onbording())
);
    });
  }

  @override
  Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image(image: AssetImage('images/logo.png')),
         
          Padding(
            padding: const EdgeInsets.only(top:0.9),
            child: Column(
             
              children: [
                Text('Wait Please',style: TextStyle(letterSpacing: 1.8),)
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SpinKitSquareCircle(
  color: Colors.orange,
  size: 40.0,
          )
        ]),
        
      ),
     
 
);
      
    
   
  }
}

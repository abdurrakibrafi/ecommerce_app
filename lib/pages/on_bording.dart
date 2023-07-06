import 'package:eshop/pages/phn_verify.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    var primary = Colors.white;
    return SafeArea(
      
        child: IntroductionScreen(
     globalBackgroundColor: Colors.orange,
      showNextButton: true,
      next: const Icon(Icons.arrow_forward,color: Colors.white,size: 25,),
      showSkipButton: true,
      pages: [
        PageViewModel(
          title: "A eShop For Everyone",
          body: 'Visit and purchaes your chooseable products as well enjoying your life',
          image: buildImage('images/girl.png'),
          decoration: getPageDecoration(),
        ),
         PageViewModel(
          title: "Easiest Way To Online Pay",
          body: 'Throug online trasaction you will pay with any hessle & just follow some steps',
          image: buildImage('images/payable.png'),
          decoration: getPageDecoration(),
        ),
         PageViewModel(
          title: "On Time Delivery",
          body: 'We always foucs on our cutumer setifiction',
          image: buildImage('images/delivery_pic.png'),
          decoration: getPageDecoration(
            
          ),
        ),
        
      ],
       skip: const Text("Skip",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
      done: Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
      ),
      onDone: () {
        goToHome(context);
      },
      
      skipStyle: TextButton.styleFrom(primary: Colors.white),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    ));
  }
  void goToHome (context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_)=> PhnOTP()),
  );

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600,color: Colors.white),
        bodyTextStyle: TextStyle(fontSize: 20,color: Colors.white60),
        imagePadding: EdgeInsets.only(top: 94),
        pageColor: Colors.orange,
      );
}

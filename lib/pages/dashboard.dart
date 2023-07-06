import 'dart:async';

import 'package:eshop/controllers/itembag_controller.dart';
import 'package:eshop/pages/cart_pages.dart';
import 'package:eshop/pages/details_page.dart';
import 'package:eshop/pages/inbox.dart';
import 'package:eshop/pages/myProfile.dart';
import 'package:eshop/widget/chip.dart';
import 'package:eshop/widget/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class Dashborad extends ConsumerStatefulWidget {
  const Dashborad({super.key});

  @override
  ConsumerState<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends ConsumerState<Dashborad> {
  int myIndex = 0;

  void onItemTapped(index) {
    setState(() {
      myIndex = index;
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
            url:
                'https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg',
            email: 'abdurrakibrafi469@gmail.com',
            name: 'Abdur Rakib Rafi',
          );
          return myProfile;
        }));

        break;
    }
  }

  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  late final PageController pageController;
  int pageNo = 0;

  List<String> images = [
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/summer-fashion-sale-banner-design-template-62077c541db2b288dbccd6d9d1c9af3d_screen.jpg?ts=1649932911",
    "https://content.wepik.com/statics/2897958/fashion-banner-blog-9182393page1.jpg"
  ];

  Timer? caraousoleTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(pageNo,
          duration: const Duration(seconds: 2), curve: Curves.easeInOut);
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);

    caraousoleTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: Colors.orange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                'e-shop',
                style: TextStyle(fontSize: 28,fontFamily: 'Lobster'),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 12),
            child: Badge(
              label: Text(itemBag.length.toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CardPage()));
                  },
                  icon: Icon(
                    Icons.local_mall,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                itemBuilder: (_, pagePosition) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onPanDown: (d) {
                        caraousoleTimer?.cancel();
                        caraousoleTimer = null;
                      },
                      onPanCancel: () {
                        caraousoleTimer = getTimer();
                      },
                      child: Card(
                        margin: EdgeInsets.all(14),
                        child: Container(
                          // margin: EdgeInsets.all(15.0),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                image: NetworkImage(images[pagePosition]),
                                onError: (exception, stackTrace) {
                                  return print(exception);
                                },
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: images.length,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  images.length,
                  (index) => Container(
                        margin: EdgeInsets.all(1.0),
                        width: 10.0,
                        child: Icon(
                          Icons.circle,
                          size: 9,
                          color: pageNo == index
                              ? Colors.amber
                              : Colors.grey.shade300,
                        ),
                      )),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ChipView(chipLabel: "All"),
                  ChipView(chipLabel: "Kids Dress"),
                  ChipView(chipLabel: "Cosmetics"),
                  ChipView(chipLabel: "Rings"),
                  ChipView(chipLabel: "Beauty Products"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot Sales",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              height: 290,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ProductCart(
                        productIndex: index,
                      )),
            ),
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Features Products",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            MasonryGridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 6,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      getIndex: index,
                                    )));
                      },
                      child: SizedBox(
                        height: 250,
                        child: ProductCart(productIndex: index),
                      ),
                    ))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: myIndex,
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

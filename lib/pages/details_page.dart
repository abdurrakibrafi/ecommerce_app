import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/pages/cart_pages.dart';
import 'package:eshop/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(ProductNotifyerProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            'Product Details',
            style: TextStyle(color: Colors.white),
            
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardPage()));

                },
                icon: Icon(
                  Icons.local_mall,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color: Color.fromARGB(255, 255, 189, 108),
              child: Image.asset(product[getIndex].imgUrl),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar(
                          itemSize: 25,
                          initialRating: 1,
                          minRating: 1,
                          maxRating: 5,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                              empty: Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              half: Icon(
                                Icons.star_half_sharp,
                                color: Colors.orange,
                              ),
                              full: Icon(
                                Icons.star,
                                color: Colors.orange,
                              )),
                          onRatingUpdate: (value) => null),
                      SizedBox(width: 4),
                      Text("125 reviews")
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(product[getIndex].longDescription),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${(product[getIndex].price * product[getIndex].qty )}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(ProductNotifyerProvider.notifier)
                                      .descremetntQty(product[getIndex].pid);
                                }, 
                                icon: Icon(
                                  Icons.do_not_disturb_on_outlined,
                                  size: 30,
                                )),
                            Text(
                              product[getIndex].qty.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                                onPressed: () {
                                   ref
                                      .read(ProductNotifyerProvider.notifier)
                                      .incrementQty(product[getIndex].pid);
                                },
                                icon: Icon(Icons.add_circle_outline, size: 30))
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(double.infinity, 50)),
                      onPressed: () {},
                      child: Text("Add To Cart"))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            ref.read(currentIndexProvider.notifier).update((state) => value);
          },
          selectedItemColor: Colors.orange,
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

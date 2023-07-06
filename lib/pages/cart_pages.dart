import 'package:eshop/controllers/itembag_controller.dart';
import 'package:eshop/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CardPage extends ConsumerStatefulWidget {
  const CardPage({super.key});

  @override
  ConsumerState createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<CardPage> {
  // Map<String, dynamic>? paymentIntent;

  // //makepayment

  // void makePayment() async {
  //   try {
  //     paymentIntent = await createPaymentIntent();
  //     var gpay = PaymentSheetGooglePay(
  //         merchantCountryCode: 'US', currencyCode: "US", testEnv: true);
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntent!["client_secret"],
  //             style: ThemeMode.light,
  //             merchantDisplayName: 'Rafi',
  //             googlePay: gpay));
  //     displayPaymentSheet();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // //display payment

  // displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) {
  //       //Clear paymentIntent variable after successful payment
  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       throw Exception(error);
  //     });
  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  // createPaymentIntent() async {
  //   try {
  //     Map<String, dynamic> body = {
  //       "amount": '10',
  //       'currency': "USD",
  //     };

  //     http.Response response = await http.post(
  //         Uri.parse("https://api.stripe.com/v1/payment_intents"),
  //         body: body,
  //         headers: {
  //           "Authorization":
  //               "Bearer sk_test_51NLelAGY8WYpXeJ174Ju0bjUeYW7OKS70IqsutYnT7QKfEnjwS0N8HMussNgPMlZdJ4TJvMLxepyD7CcSg1IWaSD00jRuEnazas",
  //           "Content-Type": "application/x-www-form-urlencoded"
  //         });
  //     return json.decode(response.body);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final paymentController =Get.put(PaymentController());
    final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        title: Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Text(
            'Cart Page',
            style: TextStyle(color: Colors.white),
            
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_mall,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: itemBag.length,
                    itemBuilder: (context, index) => SafeArea(
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(itemBag[index].imgUrl)),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            itemBag[index].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            itemBag[index].shortDescription,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '\$${itemBag[index].price}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Have a copan code? enter here"),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FD302H",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Row(children: [
                              Text(
                                "Availabe",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.check_circle,
                                color: Colors.orange,
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '\$234',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$234',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$23%',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${ref.watch(priceCalcProvider)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: ()=>paymentController.makePayment(amount: '10', currency: 'USD')
                ,
                child: Text("Continue To Checkout")),
          )
        ],
      ),
    );
  }
}

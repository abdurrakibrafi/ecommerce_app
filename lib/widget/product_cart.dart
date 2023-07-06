import 'package:eshop/controllers/itembag_controller.dart';
import 'package:eshop/controllers/product_controller.dart';
import 'package:eshop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCart extends ConsumerWidget {
  const ProductCart({super.key, required this.productIndex});

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(ProductNotifyerProvider);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 6),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 4)
          ]),
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                child: Image.asset(product[productIndex].imgUrl)),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product[productIndex].title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product[productIndex].shortDescription,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       '\$${product[productIndex].price}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(ProductNotifyerProvider.notifier)
                                .isSelectedItem(
                                    product[productIndex].pid, productIndex);

                           if(product[productIndex].isSelected == false){
                             ref.read(itemBagPorvider.notifier).addNewItemBag(
                                ProductModel(
                                    pid: product[productIndex].pid,
                                    imgUrl: product[productIndex].imgUrl,
                                    title: product[productIndex].title,
                                    price: product[productIndex].price,
                                    shortDescription:
                                        product[productIndex].shortDescription,
                                    longDescription:
                                        product[productIndex].longDescription,
                                    reviews: product[productIndex].reviews,
                                    rating: product[productIndex].rating));
                           }
                           else{
                            ref.read(itemBagPorvider.notifier).removeItem(product[productIndex].pid);
                           }
                          },
                          icon: Icon(
                            product[productIndex].isSelected
                                ? Icons.task_alt
                                : Icons.shopping_cart,
                            size: 30,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

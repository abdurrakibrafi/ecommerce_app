

import 'package:eshop/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel>itemBag=[
   
];

class ItemBagNotifyer extends StateNotifier<List<ProductModel>>{
  ItemBagNotifyer (): super(itemBag);

// add item
  void addNewItemBag(ProductModel productModel){
    state =[
      ...state,productModel
    ];

 
  
  }
 //remove item
 void removeItem(int pid){
  state=[
    for (final product in state)
    if(product.pid != pid)product,
  ];
 }

}


final itemBagPorvider = StateNotifierProvider<ItemBagNotifyer,List<ProductModel>>((ref) {
  return ItemBagNotifyer();
});


final priceCalcProvider = StateProvider<double>((ref) {
  final itemBag = ref.watch(itemBagPorvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }
  return sum;
});
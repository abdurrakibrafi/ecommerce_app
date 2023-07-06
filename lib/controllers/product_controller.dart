import 'package:eshop/data/product_list.dart';
import 'package:eshop/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifyer extends StateNotifier<List<ProductModel>> {
  ProductNotifyer() : super(productItems);


  // is selected 
   void isSelectedItem (int pid,int index){
     
    state = [
      for (final product in state)
      if (product.pid == pid)
      product.copyWith(isSelected: !state[index].isSelected)
      else
      product
    ];
   }


  void incrementQty (int pid){
    state=[
      for(final product in state)
      if (product.pid == pid)
      product.copyWith(qty: product.qty += 1)
      else
      product,
    ];
  }
   void descremetntQty (int pid){
    state=[
      for(final product in state)
      if (product.pid == pid)
      product.copyWith(qty: product.qty -= 1)
      else
      product,
    ];
  }
}

final ProductNotifyerProvider =
    StateNotifierProvider<ProductNotifyer, List<ProductModel>>((ref) {
  return ProductNotifyer();
});

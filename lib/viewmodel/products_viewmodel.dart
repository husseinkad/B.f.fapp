import 'dart:convert';
import 'package:bff/models/error.dart';
import 'package:bff/models/loading_state.dart';
import 'package:bff/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class ProductsViewModel extends ChangeNotifier {
  late Tuple2<ErrorResponse?, List<Product>?> productsResponse;
  LoadingState loadingState = LoadingState.idle;

  List<Product> cartItems = [];

  ProductsViewModel() {
    productsResponse = const Tuple2(null, null);

    debugPrint('ProductsViewModel initialized...');
  }
  

  void fetchProducts() async {
    loadingState = LoadingState.loading;
    notifyListeners();

    var response;
    try {
      var url = Uri.parse('https://bagdadfashionfactory.pythonanywhere.com/api/products');
      debugPrint('url: $url');
      response = await http.get(
        url,
      );
      debugPrint('response: $response');
      debugPrint('response.statusCode: ${response.statusCode}');
      var jsonUsers = jsonDecode(response.body);
      var users = jsonUsers.map<Product>((_userJson) => Product.fromJson(_userJson)).toList();

      productsResponse = Tuple2(null, users);
    } catch (e) {
      if (response?.statusCode == 200) {
        productsResponse = Tuple2(ErrorResponse('توجد مشكلة في عرض المعلومات', response?.statusCode), null);
      } else {
        productsResponse = Tuple2(ErrorResponse('لا يمكن الإتصال. يرجى المحاولة فيما بعد...', -1), null);
      }

      debugPrint('e: $e');
    }

    loadingState = LoadingState.finished;
    notifyListeners();
  }
}

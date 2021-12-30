import 'dart:convert';
import 'package:bff/models/category.dart';
import 'package:bff/models/error.dart';
import 'package:bff/models/loading_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class CategoriesViewModel extends ChangeNotifier {

  late Tuple2<ErrorResponse?, List<Category>?> categoriesResponse;
  LoadingState categoriesLoadingState = LoadingState.idle;

  CategoriesViewModel() {
    categoriesResponse = const Tuple2(null, null);
    debugPrint('CategoriesViewModel initialized...');
  }


  void fetchCategories() async {
    categoriesLoadingState = LoadingState.loading;
    notifyListeners();

    var response;
    try {
      var url = Uri.parse('https://bagdadfashionfactory.pythonanywhere.com/api/Categorys');
      debugPrint('url: ${url}');
      response = await http.get(
        url,
      );
      debugPrint('response: ${response}');
      debugPrint('response.statusCode: ${response.statusCode}');
      var categoriesJson = jsonDecode(response.body);
      var categories = categoriesJson.map<Category>((_categoryJson) => Category.fromJson(_categoryJson)).toList();

      categoriesResponse = Tuple2(null, categories);
    } catch (e) {
      if (response?.statusCode == 200) {
        categoriesResponse = Tuple2(ErrorResponse('توجد مشكلة في عرض المعلومات', response?.statusCode), null);
      } else {
        categoriesResponse = Tuple2(ErrorResponse('لا يمكن الإتصال. يرجى المحاولة فيما بعد...', -1), null);
      }

      debugPrint('catch categories error: $e');
    }

    categoriesLoadingState = LoadingState.finished;
    notifyListeners();
  }

}

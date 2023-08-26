import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/html/CategoriesResponse.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];
  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromJson(resp);
    categories = [...categoriesResponse.categorias];
    print(categories);
    notifyListeners();
  }
}

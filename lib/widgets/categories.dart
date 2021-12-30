import 'package:bff/models/category.dart';
import 'package:bff/models/loading_state.dart';
import 'package:bff/viewmodel/categories_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CardItem {
  final String title;

  const CardItem({required this.title});
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}
Color colorchange = Colors.red;
class _CategoriesState extends State<Categories> {
  late CategoriesViewModel _categoriesViewModel;

  @override
  void initState() {
    super.initState();

    debugPrint('_CategoriesPageState.initState...');

    Future.microtask(() {
      if (_categoriesViewModel.categoriesResponse.item2 == null) {
        _categoriesViewModel.fetchCategories();
      }
    });
  }

  Color chnagedColor = const Color(0xFFECEAE8);
  Widget buildItemView(Category categoryItem) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              onTap: () {

              },
              child: Container(
                width: MediaQuery.of(context).size.width *0.4,
                height: MediaQuery.of(context).size.height *0.04,
                color: chnagedColor,
                child: Center(
                    child: Text(
                      categoryItem.name,
                      style: const TextStyle(fontSize: 13, fontFamily: "Tajawal", fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {

    _categoriesViewModel = Provider.of<CategoriesViewModel>(context);

    Widget view = const Text('Idle!');

    if (_categoriesViewModel.categoriesLoadingState == LoadingState.loading) {
      view = const CircularProgressIndicator();
    } else if (_categoriesViewModel.categoriesLoadingState == LoadingState.finished) {
      if (_categoriesViewModel.categoriesResponse.item1 == null) {
        view = bulidlistview(_categoriesViewModel.categoriesResponse.item2 ?? []);
      } else {
        view = const Text('Error!');
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: view));
  }
  Widget bulidlistview(List<Category> categories) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, _) => const SizedBox(
            width: 8,
          ),
          itemBuilder: (_context, index) => buildItemView(categories[index]),
        ),
      ),
    );
  }
}





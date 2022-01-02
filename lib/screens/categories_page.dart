import 'package:bff/models/category.dart';
import 'package:bff/models/loading_state.dart';
import 'package:bff/viewmodel/categories_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}
Color colorchange = Colors.red;
class _CategoriesPageState extends State<CategoriesPage> {
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
    child: Column(
      children: [
        SizedBox(
          child: Center(
            child: Stack(
              children: [
                Container(
                  child: Builder(
                      builder: (context) {
                        var  baseurl = 'https://bagdadfashionfactory.pythonanywhere.com';
                        return CachedNetworkImage(
                          imageUrl: baseurl + categoryItem.image,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            debugPrint('error: $error');
                            return const Icon(Icons.error_outline);
                          },
                        );
                      }
                  ),
                  color: Colors.white70,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                ),
                Container(
                  color: Colors.white70,
                  height: 35,
                  width: 120,
                  margin: EdgeInsets.fromLTRB(0, 200, 150, 4.0),
                  child: TextButton(
                    onPressed: (){},
                    child: Center(
                      child: Text(
                        categoryItem.name,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 20, fontFamily: 'Tajawal', fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          'الاقسام',
          style: TextStyle(fontSize: 20, fontFamily: 'Tajawal', fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Center(child: view));
  }
  Widget bulidlistview(List<Category> categories) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_context, index) => buildItemView(categories[index]),
      ),
    );
  }
}





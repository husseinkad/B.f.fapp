import 'package:bff/screens/cart_page.dart';
import 'package:bff/screens/favourite_page.dart';
import 'package:bff/viewmodel/categories_viewmodel.dart';
import 'package:bff/viewmodel/products_viewmodel.dart';
import 'package:bff/widgets/categories.dart';
import 'package:bff/widgets/mydrawer.dart';
import 'package:bff/widgets/myicons.dart';
import 'package:bff/widgets/products.dart';
import 'package:bff/widgets/quantity.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async  {
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ChangeNotifierProvider<Favourite>(create: (_) => Favourite()),
      ChangeNotifierProvider<ProductsViewModel>(create: (_) => ProductsViewModel()),
      ChangeNotifierProvider<CategoriesViewModel>(
        create: (_) => CategoriesViewModel(),
        lazy: true,
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B.F.F',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    ),
  ));
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final padding = const EdgeInsets.symmetric(vertical: 20);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Favourite_page()));
            },
            icon: const Icon(BffIcons.heartline, color: Colors.black,)

        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart_page()));
            },
            icon: const Icon(BffIcons.handbag, color: Colors.black,)
        ),
      ],
      leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(BffIcons.bar, color: Colors.black,)
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
    return Consumer<Cart>(builder: (context, cart, child){
      return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: SingleChildScrollView(
            padding: padding,
            child: Column(
              children: const [
                MyDrawer()
              ],
            ),
          ),
        ),
        key: scaffoldKey,
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.1,
              alignment: Alignment.centerLeft,
              child: const Text('Bagdad fashion factory', style: TextStyle(fontSize: 21, fontFamily: 'Sail'),),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.12,
              child: const Categories(),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.03,
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.75,
              child: const Products(),
            ),
          ],
        )
      );
    });
  }
}

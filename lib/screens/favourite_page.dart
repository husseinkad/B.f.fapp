import 'package:bff/main.dart';
import 'package:bff/models/product.dart';
import 'package:bff/screens/detils_page.dart';
import 'package:bff/widgets/myicons.dart';
import 'package:bff/widgets/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends ChangeNotifier {
  final List<Product> _items = [];
  double _totalPrice = 0.0;


  void add(Product) {
    _items.add(Product);
    _totalPrice += Product.price;
    notifyListeners();
  }

  void remove(Product) {
    _totalPrice -= Product.price;
    _items.remove(Product);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Product> get basketItems {
    return _items;
  }

  bool isInFav(Product product) {
    return _items.indexWhere((element) => element.id == product.id) >= 0;
  }


}



class Favourite_page extends StatefulWidget {
  const Favourite_page({Key? key}) : super(key: key);


  @override
  _Favourite_pageState createState() => _Favourite_pageState();
}

class _Favourite_pageState extends State<Favourite_page> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Favourite>(
      builder: (context, fav, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Padding(
                padding: EdgeInsets.all(63.0),
                child: Text('المفضلة', style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.black)),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,),
              ),
            ),
            body: fav.basketItems.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('لم يتم اضافه منتج المفضلة بعد', style: TextStyle(fontFamily: 'Tajawal', fontSize: 22)),
                  TextButton(
                    child: const Text('أبدا الاستكشاف', style: TextStyle(fontFamily: 'Tajawal', fontSize: 22)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return const MyHomePage();
                      }));
                    },
                  )
                ],
              ),
            )
                : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView.builder(
                  itemCount: fav.basketItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading:  Builder(
                          builder: (context) {
                            var baseurl = 'https://bagdadfashionfactory.pythonanywhere.com/';
                            return CachedNetworkImage(
                              imageUrl:baseurl + fav.basketItems[index].images[0].image,
                              height: 270,
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) {
                                debugPrint('error: $error');
                                return const Icon(Icons.error);
                              },
                            );
                          }
                        ),
                        title: Text(fav.basketItems[index].name),
                        subtitle:
                        Text(fav.basketItems[index].price.toStringAsFixed(0)),
                        trailing: IconButton(
                          icon: const Icon(BffIcons.deletebin),
                          onPressed: () {
                            fav.remove(fav.basketItems[index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
        );
      },
    );
  }
}
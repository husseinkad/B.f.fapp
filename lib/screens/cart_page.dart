import 'package:bff/main.dart';
import 'package:bff/models/product.dart';
import 'package:bff/screens/address_page.dart';
import 'package:bff/screens/login_page.dart';
import 'package:bff/widgets/myicons.dart';
import 'package:bff/widgets/products.dart';
import 'package:bff/widgets/quantity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  final List<Product> _items = [];
  double _totalPrice = 0.0;
  late Product product;
  final saveData = GetStorage();
  String s = '';


  void add(Product product) {
    _items.add(product);

  }

  void remove(Product product) {
    _totalPrice -= product.price;
    _items.remove(product);
    notifyListeners();
  }


  // void quantity(Product product) {
  //   _totalPrice = product.price * counter;
  //   notifyListeners();
  // }


  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Product> get basketItems {
    return _items;
  }

  // decrementQty(Product product) {
  //   final i = _items.indexWhere((e) => product == product);
  //   if (_items[i].qty == 1) {
  //     remove(product);
  //   } else {
  //     _items[i].qty -= 1;
  //     notifyListeners();
  //   }
  // }
  //
  // incrementQty(Product product) {
  //   _items[_items.indexOf(product)].qty += 1;
  //   notifyListeners();
  // }

  void addToCart(Product product) {
    bool exists = _items.indexWhere((element) => element.id == product.id) >= 0;
    if (!exists) {
      _items.add(product);
      _totalPrice += product.price;
      notifyListeners();
    }
  }

  bool isInCart(Product product) {
    return _items.indexWhere((element) => element.id == product.id) >= 0;
  }


}



class Cart_page extends StatefulWidget {
  @override
  _Cart_pageState createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Padding(
        padding: EdgeInsets.all(63.0),
        child: Text('معلومات الطلب', style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.black)),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,),
      ),
    );
    Color color = const Color(0xffF8FB56);

    return Consumer<Cart>(
      builder: (context, cart, child) {

        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: cart.basketItems.isEmpty
                ? Center(
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const Text('لم يتم اضافه منتجات بعد', style: TextStyle(fontFamily: 'Tajawal', fontSize: 22)),
                  TextButton(
                    child: const Text('أبدا التسوق', style: TextStyle(fontFamily: 'Tajawal', fontSize: 22)),
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
                    Builder(
                      builder: (context)  {

                        return ListView.builder(

              itemCount: cart.saveData.read(cart.s),
              itemBuilder: (context, index) {

                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading:  Builder(
                                  builder: (context) {
                                    var baseurl = 'https://bagdadfashionfactory.pythonanywhere.com/';
                                    return CachedNetworkImage(

                                      imageUrl:baseurl + cart.basketItems[index].images[0].image,
                                      height: 270,
                                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) {
                                        debugPrint('error: $error');
                                        return const Icon(Icons.error);
                                      },
                                    );
                                  }
                                ),
                                title: Text(cart.basketItems[index].name),
                                subtitle:
                                Text('IQD ${cart.basketItems[index].price.toString()}'),
                                trailing: IconButton(
                                  icon: const Icon(BffIcons.deletebin),
                                  onPressed: () {
                                    cart.remove(cart.basketItems[index]);
                                  },
                                ),

                              ),
                            ],
                          ),
                        );
              },
            );
                      }
                    ),
                     Positioned(
                          bottom: 0.0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('IQD ${cart.totalPrice.toStringAsFixed(0)}',
                                    style: const TextStyle(color: Colors.black, fontFamily: 'Tajawal',  fontSize: 15,),),
                                ),
                                const SizedBox(width: 180,),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(': المجموع ',
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 17,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: screenWidth * 0.3),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      child: const Text('< العودة للتسوق', style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: Colors.black)),
                                      onPressed: () async {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_context) => const MyHomePage()));
                                      },
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: screenWidth * 0.63,
                                      minHeight: screenHeight * 0.02),
                                  child: Padding(
                                    padding:  const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style:  ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(color),
                                      ),
                                      child: const Center(
                                        child: Text('الذهاب الى عملة الدفع', style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Colors.black,
                                        )),
                                      ),
                                      onPressed: () {
                                        if(2 == 1) {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_context) => const Login()));
                                        }
                                        else{
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_context) => const Address()));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                )
        );
     },);
  }
}
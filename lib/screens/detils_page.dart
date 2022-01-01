import 'package:bff/models/product.dart';
import 'package:bff/screens/favourite_page.dart';
import 'package:bff/widgets/myicons.dart';
import 'package:bff/widgets/quantity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:bff/screens/cart_page.dart';


class DetailsPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const DetailsPage(this.product);

  final Product product;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Widget buildItemView() {
    return Consumer<Cart>(
        builder: (context, cart, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
            children: [
                   Builder(
                     builder: (context) {
                       var  baseurl = 'https://bagdadfashionfactory.pythonanywhere.com/';
                       return CachedNetworkImage(
                        imageUrl: baseurl + widget.product.images[0].image,
                        height: (MediaQuery
                            .of(context)
                            .size
                            .height - MediaQuery
                            .of(context)
                            .padding
                            .top) * 0.25,
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) {
                          debugPrint('error: $error');
                          return const Icon(Icons.error);
                        },
                  );
                     }
                   ),
              SizedBox(
                height: (MediaQuery
                    .of(context)
                    .size
                    .height - MediaQuery
                    .of(context)
                    .padding
                    .top) * 0.02,
                child: const Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: (MediaQuery
                    .of(context)
                    .size
                    .height - MediaQuery
                    .of(context)
                    .padding
                    .top) * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontFamily: 'Tajawal', fontSize: 20),
                      ),
                      SizedBox(
                        height: (MediaQuery
                            .of(context)
                            .size
                            .height - MediaQuery
                            .of(context)
                            .padding
                            .top) * 0.06,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'IQD ${widget.product.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: (MediaQuery
                    .of(context)
                    .size
                    .height - MediaQuery
                    .of(context)
                    .padding
                    .top) * 0.20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery
                    .of(context)
                    .size
                    .height - MediaQuery
                    .of(context)
                    .padding
                    .top) * 0.07,
                child: Row(
                  children: [
                    SizedBox(
                      child: Text(' الحجم :  ${widget.product.size}',
                        style: const TextStyle(fontFamily: 'Tajawal', fontSize: 16),),
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(
                      child: Text(' الارتفاع :  ${widget.product.height}',
                        style: const TextStyle(fontFamily: 'Tajawal', fontSize: 16),),
                      width: MediaQuery.of(context).size.width * 0.3333333333,
                    ),
                    SizedBox(
                      child: Text(' العرض :  ${widget.product.width}',
                        style: const TextStyle(fontFamily: 'Tajawal', fontSize: 16),),
                      width: MediaQuery.of(context).size.width * 0.3333333333,
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: TextButton(
              //         child: const Icon(Icons.add, color: Colors.black87),
              //         onPressed: () {
              //           cart.incrementQty(widget.product);
              //         },
              //       ),
              //     ),
              //     Center(
              //         child: Text(
              //          widget.product.qty.toString(),
              //           style: const TextStyle(fontSize: 14,
              //               fontFamily: "Tajawal",
              //               fontWeight: FontWeight.bold),
              //         )),
              //     Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: TextButton(
              //           onPressed: () {
              //             setState(() {
              //                cart.decrementQty(widget.product);
              //             });
              //           },
              //           child: const Icon(Icons.remove, color: Colors.black),
              //         )
              //     ),
              //   ],
              // ),
            ]
          //  SizedBox(
          //   height: 70,
          //   width: 50,
          //   child: Quantity(),
          // ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        widget.product.name,
        maxLines: 1,
      ),
      actions: [
        IconButton(
          icon: const Icon(BffIcons.heartline, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Favourite_page()));
          },
        ),
        IconButton(
          icon: const Icon(BffIcons.handbag, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart_page()));
          },
        ),

      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_outlined, color: Colors.black,),
      ),
    );
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer<Cart>(builder: (context, cart, child)
    {
      return Consumer<Favourite>(builder: (context, fav, child) {
        bool isInCart = cart.isInCart(widget.product);
        bool isInFav = fav.isInFav(widget.product);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  buildItemView(),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 600),
                    firstChild: Container(
                      height: 50,
                      width: screenWidth,
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: const Text(
                        'تمت الاضافه الى السلة',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    secondChild: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: screenWidth * 0.9),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 55,
                              height: 44,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(const Color(0xffF8FB56)),
                                ),
                                onPressed: () {
                                  if(isInFav == false) {
                                    fav.add(widget.product);
                                  }

                                  if (isInFav == true) {
                                    fav.remove(fav.basketItems);
                                  }
                                },
                                child: isInFav == false? const Icon(
                                  BffIcons.heartline, color: Colors.black,) : const Icon(
                                  BffIcons.heartline, color: Colors.red,)
                              ),
                            ),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: 280,
                              height: 44,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(const Color(0xffF8FB56)),
                                  ),
                                  onPressed: () async {
                                    cart.addToCart(widget.product);
                                    setState(() {
                                      cart.saveData.write(cart.s, cart.basketItems.length);
                                      cart.saveData.listen((){
                                        print('box changed');
                                      });
                                    });
                                  },
                                  child: const Center(child: Text(
                                    'اضافه الى السله', style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20,
                                      color: Colors.black),))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    crossFadeState: isInCart
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  )
                ],
              ),
            ));
      });
    });
  }
}

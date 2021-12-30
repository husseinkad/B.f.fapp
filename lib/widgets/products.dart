import 'package:bff/models/loading_state.dart';
import 'package:bff/models/product.dart';
import 'package:bff/screens/detils_page.dart';
import 'package:bff/viewmodel/products_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';






class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  late ProductsViewModel _productsViewModel;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (_productsViewModel.productsResponse.item2 == null) {
        _productsViewModel.fetchProducts();
      }
    });
  }



  Color greyColor = const Color(0xFFECEAE8);
  Widget buildItemView(Product product) => InkWell(
    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_context) => DetailsPage(product))),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
  ),
        color: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                     Builder(
                       builder: (context) {
                        var  baseurl = 'https://bagdadfashionfactory.pythonanywhere.com/';
                         return CachedNetworkImage(
                            imageUrl: baseurl + product.images[0].image,
                            height: constraints.maxHeight * 0.70,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) {
                              debugPrint('error: $error');
                              return const Icon(Icons.error_outline);
                            },
                  );
                       }
                     ),
                  SizedBox(height: constraints.maxHeight *0.02,),
                  SizedBox(
                    height: constraints.maxHeight *0.10,
                    child: Center(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 15, fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight *0.03,),
                  SizedBox(
                    height: constraints.maxHeight *0.07,
                    child: Center(
                      child: Text(
                        'IQD ${product.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight *0.03,)
                ],
              );
            }
          ),
        ),
      ),
  );




  @override
  Widget build(BuildContext context) {


    _productsViewModel = Provider.of<ProductsViewModel>(context);

    Widget view = const Text('Idle!');

    if (_productsViewModel.loadingState == LoadingState.loading) {
      view = const CircularProgressIndicator();
    } else if (_productsViewModel.loadingState == LoadingState.finished) {
      if (_productsViewModel.productsResponse.item1 == null) {
        view = buildGridListView(_productsViewModel.productsResponse.item2 ?? []);
      } else {
        view = const Text('Error!');
      }
    }

    return Scaffold(body: Center(child: view));

  }
  Widget buildGridListView(List<Product> products) {
    return GridView.builder(
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 199, childAspectRatio: 0.65, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemCount: products.length,
        itemBuilder: (BuildContext ctx, index) {
          return buildItemView(products[index]);
        });
  }
}



// import 'package:bff/models/product.dart';
// import 'package:bff/screens/cart_page.dart';
// import 'package:bff/widgets/products.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Counterr extends ChangeNotifier {
//   int _counter = 1;
//   int get conter {
//     return _counter;
//   }
//   void increment() {
//     _counter++;
//     notifyListeners();
//   }
//
//   void discrement() {
//     _counter--;
//     notifyListeners();
//   }
//
//   late Product product;
// }
//
//
// class Quantity extends StatefulWidget {
//
//   @override
//   _QuantityState createState() => _QuantityState();
// }
//
// class _QuantityState extends State<Quantity> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Counterr>(
//         builder: (context, model, child)
//     {
//       return Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.add, color: Colors.black87),
//               backgroundColor: Colors.white,
//               onPressed: () {
//                 if(model._counter >= 1 || model._counter < model.product.qty){
//                   model.increment();
//                 }
//                 model.discrement();
//               },
//             ),
//           ),
//           Center(
//               child: Text(
//                 '${model._counter}',
//                 style: const TextStyle(fontSize: 14,
//                     fontFamily: "Tajawal",
//                     fontWeight: FontWeight.bold),
//               )),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//                 onPressed: () {
//                   setState(() {
//                     if(model._counter >= 1 || model._counter <= model.product.qty){
//                       model.discrement();
//                     }
//                     model.discrement();
//                   });
//                 },
//                 child: const Icon(Icons.remove, color: Colors.black),
//                 backgroundColor: Colors.white),
//           ),
//         ],
//       );
//     });
//   }
// }
//

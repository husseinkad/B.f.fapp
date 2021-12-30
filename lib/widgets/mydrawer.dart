import 'package:bff/screens/address.dart';
import 'package:bff/screens/address_page.dart';
import 'package:bff/screens/cart_page.dart';
import 'package:bff/screens/favourite_page.dart';
import 'package:bff/screens/login_page.dart';
import 'package:bff/viewmodel/user_database.dart';
import 'package:bff/widgets/myicons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);



  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  createSupportDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      String _url = 'https://instagram.com/bagdad.store.94?utm_medium=copy_link';
      void _launchURL() async {
        if (!await launch(_url)) throw 'حدث خطا ما $_url';
      }
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: AlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('للتواصل مع الدعم او طلب التنسيقات الخاصة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , fontFamily: 'Tajawal'),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: _launchURL,
                child: const Card(
                  child: ListTile(
                    title: Text('انستقرام', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold , fontFamily: 'Tajawal'),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                elevation: 5.0,
                  child: const Text('اغلاق', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold , fontFamily: 'Tajawal'),),
                  onPressed: () {
                  Navigator.of(context).pop();
                  }
                  ),
            ),
          ],
        ),
      );

    });

  }




   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(child: Image.asset('assets/bfflogo.png')),
        ),
         const Divider(),
         Material(
           child: Column(
               children: [
                 bulidMenuItem(text: 'السله', icon: BffIcons.handbag, onClicked: () => selectedItem(context, 0)),
                 bulidMenuItem(text: 'المفضلة', icon: Icons.favorite_border, onClicked: () => selectedItem(context, 1)),
                 bulidMenuItem(text: 'العنوان', icon: Icons.location_on_outlined, onClicked: () => selectedItem(context, 3)),
                 const Divider(),
                 bulidMenuItem(text: 'الدعم', icon: Icons.support_agent, onClicked: () => selectedItem(context, 2)),
                 bulidMenuItem(text: 'تسجيل الدخول', icon: Icons.login, onClicked: () => selectedItem(context, 4)),
               ],
           ),
        ),
      ],
    );
  }
  Widget bulidMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
}) {
    const color = Color(0xff000000);
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: const TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked ,

    );
}

void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (_context) => Cart_page()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (_context) =>  const Favourite_page()));
        break;
      case 2:
           createSupportDialog(context);
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (_context) =>  const Address()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (_context) => const Login()));
        break;
    }
}
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const TextStyle _textstyle =
TextStyle(fontFamily: "Tajawal", fontSize: 16);

Color myColor = const Color(0xffF8FB56);
final _textController = TextEditingController();

createAddressDialog(BuildContext context){
  final deviceSize = MediaQuery.of(context).size;
  return showDialog(context: context, builder: (context){
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: AlertDialog(
        title: Row(
          children: [
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
            const Center(child: Text('الرجاء ادخال المعلومات ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold , fontFamily: 'Tajawal'),)),
          ],
        ),
        actions: [

          SizedBox(
            height: deviceSize.height *1,
            width: deviceSize.width *1,
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    'الاسم',
                    style: _textstyle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'المدينة',
                    style: _textstyle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'المنطقة',
                    style: _textstyle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    controller: _textController,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'اقرب نقطة دالة',
                      style: _textstyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'رقم الهاتف',
                      style: _textstyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'واتساب',
                      style: _textstyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'تلكرام',
                      style: _textstyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.06,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'ملاحظات',
                      style: _textstyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: deviceSize.width*0.7,
                  height: deviceSize.height*0.09,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 190,
                  ),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text('التاكيد'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: myColor,
                    textColor: const Color(0xff000000),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  });
}
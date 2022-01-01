import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    const TextStyle _textstyle =
    TextStyle(fontFamily: "Tajawal", fontSize: 16);

    Color myColor = const Color(0xffF8FB56);
    final _textController = TextEditingController();
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: const [
      Padding(
        padding: EdgeInsets.only(right: 130, top: 5),
        child: Center(child: Text('الرجاء ادخال المعلومات ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold , fontFamily: 'Tajawal', color: Colors.black),)),
      )
      ],
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
      body: SingleChildScrollView(
        child: Column(
          children:  [

            SizedBox(height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.02,),
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
                    width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.5,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.06,
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
                      'العنوان الكامل',
                      style: _textstyle,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.5,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.06,
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
                      height: 25,),
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
                    width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.5,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.06,
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
                        'ملاحظات',
                        style: _textstyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.5,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.09,
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
                  Center(
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.3,
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
                  ),
          ],
        ),
      ),
    );
  }
}

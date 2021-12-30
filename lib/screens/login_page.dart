import 'package:bff/screens/signup_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

// ignore: constant_identifier_names
enum AuthMode { Login, SignUp }

final GlobalKey<FormState> _fromKey = GlobalKey();
AuthMode _authMode = AuthMode.Login;

final Map<String, String> _authData = {
  'username': '',
  'password': '',
};



var _isloding = false;

final _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  final TextStyle _textstyle =
  const TextStyle(fontFamily: "Tajawal", fontSize: 16);
  Color myColor = const Color(0xffF8FB56);



  void _switchAuthMode(){
    if(_authMode == AuthMode.Login){
      setState(() {
        _authMode = AuthMode.SignUp;
      });
      //............
    }else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      //............
    }
  }

  Future<void> _submit()async{
    if(!_fromKey.currentState!.validate()){
      return;
    }
    setState(() {
      _isloding = true;
    });
    try{

    }catch(error){
      //ee
    }
    setState(() {
      _isloding = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
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
        child: SizedBox(
          height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 1,
          width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.15,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Text(
                    'Bagdad fashion factory',
                    style: TextStyle(fontSize: 22, fontFamily: 'Sail'),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                child: Padding(
                  padding: const EdgeInsets.only(left: 190),
                  child: Text(
                    'اسم المستخدم',
                    style: _textstyle,
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.07,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'خطا في ادخال اسم المستخدم';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['username'] = val!;
                  },
                ),
              ),
              SizedBox(height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.03,),
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                child: Padding(
                  padding: const EdgeInsets.only(left: 216),
                  child: Text(
                    'كلمة المرور',
                    style: _textstyle,
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.07,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 5) {
                      return 'يجب ان لايقل الرمز عن 5 رموز او احرف او ارقام';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val!;
                  },
                ),
              ),
               SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.04,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 190,
                  ),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: _submit,
                    child: const Text('تسجيل الدخول'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: myColor,
                    textColor: const Color(0xff000000),
                  ),
                ),
              ), // your button beneath text

              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'ليس لديك حساب بعد ؟',
                      style: TextStyle(
                          fontSize: 16, fontFamily: "Tajawal", color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_context) => const SignUp()));
                        },
                        child: const Text(
                          'سجل الان',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

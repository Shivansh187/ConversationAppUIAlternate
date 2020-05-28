import 'package:com/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:com/utilities/loading.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(175),
          height: 1.0,
          color: Colors.white24.withOpacity(.5),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: false);
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.deepPurple[900],
            resizeToAvoidBottomPadding: false,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.asset("assets/images/image_01.png"),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                        child: Image.asset("assets/images/image_02.png",
                            color: Colors.white24))
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 80.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/logo.png",
                              width: ScreenUtil.getInstance().setWidth(140),
                              height: ScreenUtil.getInstance().setHeight(140),
                            ),
                            Text("Conversation",
                                style: TextStyle(
                                  fontFamily: "Poppins-Bold",
                                  fontSize: ScreenUtil.getInstance().setSp(55),
                                  letterSpacing: .6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[900],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(7.0, 7.0),
                                    blurRadius: 10.0),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Register",
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(45),
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .6)),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text("Username",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26))),
                                  TextFormField(
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an Email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    decoration: InputDecoration(
                                        hintText: "username",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0)),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text("PassWord",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26))),
                                  TextFormField(
                                    validator: (val) => val.length < 6
                                        ? 'Enter PassWord with 6+ characters'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0)),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text("Re-Enter PassWord",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26))),
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0)),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(10),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "OTP",
                                        style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Send OTP",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: "Poppins-Medium",
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(28)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "OTP",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0)),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: ScreenUtil.getInstance().setHeight(40)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: ScreenUtil.getInstance().setWidth(300),
                                height: ScreenUtil.getInstance().setHeight(80),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.blue[700],
                                      Colors.blue[900],
                                      Colors.deepPurple[900],
                                    ]),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.9),
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 10.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Center(
                                      child: Text("Go Back",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 17,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                width: ScreenUtil.getInstance().setWidth(330),
                                height: ScreenUtil.getInstance().setHeight(100),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.blue[700],
                                      Colors.blue[900],
                                      Colors.deepPurple[900],
                                    ]),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.9),
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 10.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .createUserWithEmailAndPassword(
                                                email, password);

                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Please Enter a Valid Email';
                                            loading = false;
                                          });
                                        } else {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text("Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 17,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

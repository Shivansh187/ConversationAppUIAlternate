import 'package:com/models/user_model.dart';
import 'package:com/screens/home_screen.dart';
import 'package:com/screens/register.dart';
import 'package:com/services/auth.dart';
import 'package:com/utilities/CustomIcons.dart';
import 'package:com/utilities/SocialIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:com/utilities/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.white)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              )
            : Container(),
      );

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
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: loading
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
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(55),
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
                                    Row(
                                      children: <Widget>[
                                        Text("Login",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil.getInstance()
                                                        .setSp(45),
                                                fontFamily: "Poppins-Bold",
                                                letterSpacing: .6)),
                                        SizedBox(
                                          width: 21,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
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
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
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
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: "Poppins-Medium",
                                                fontSize:
                                                    ScreenUtil.getInstance()
                                                        .setSp(28)),
                                          ),
                                        )
                                      ],
                                    )
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
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  GestureDetector(
                                    onTap: _radio,
                                    child: radioButton(_isSelected),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text("Remember me",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Poppins-Medium",
                                          color: Colors.white))
                                ],
                              ),
                              InkWell(
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(330),
                                  height:
                                      ScreenUtil.getInstance().setHeight(100),
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
                                              .signInWithEmailAndPassword(
                                                  email, password);

                                          if (result == null) {
                                            setState(
                                              () {
                                                loading = false;
                                                error = 'Could not Sign In';
                                              },
                                            );
                                          } else {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          }
                                        }
                                      },
                                      child: Center(
                                        child: Text("Sign In",
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
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(45),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              horizontalLine(),
                              Text("Social Login",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Poppins-Medium",
                                    color: Colors.white,
                                  )),
                              horizontalLine()
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SocialIcon(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                iconData: CustomIcons.facebook,
                                onPressed: () {},
                              ),
                              SocialIcon(
                                colors: [
                                  Color(0xFFff4f38),
                                  Color(0xFFff355d),
                                ],
                                iconData: CustomIcons.googlePlus,
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(35),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "New User? ",
                                style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text("SignUp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold")),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

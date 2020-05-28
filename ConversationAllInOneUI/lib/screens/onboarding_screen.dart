import 'package:com/screens/splash_screen.dart';
import 'package:com/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.deepPurple[900],
                Colors.deepPurple[800],
                Colors.indigo[800],
                Colors.indigo[900],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.jumpToPage(2);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding0.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Give Equal Importance\nTo Everyone',
                              style: kTitleStyle,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Different Tabs for Personal Use and Professional Use.\n\nMake new Tabs according to your Need',
                              style: kSubtitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding1.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Add New Contacts\nAnytime, Anywhere with Ease',
                              style: kTitleStyle,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Tap a Button to Create a New Contact or Send a Temporary Message\n\nAdd New Contacts without Accessing Phone Book',
                              style: kSubtitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding2.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Mute Entire Tab or Tabs\nAt Once',
                              style: kTitleStyle,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'Busy with your Work and Dont want to get Disturbed?\n\nHold the Tab or Tabs and Mute all the Chats within at Once.',
                              style: kSubtitleStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 70.0,
              width: double.infinity,
              color: Colors.deepPurple[900],
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
                child: Center(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}

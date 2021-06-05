import 'package:berlian_app/MainPage.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 640) {
          return MobileLogin();
        } else {
          return WebLogin();
        }
      },
    ));
  }
}

class WebLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Sampul.png"),
                fit: BoxFit.fitHeight)),
        child: Align(
          alignment: Alignment(0.7, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Masuk",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.blue[600],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLogin extends StatefulWidget {
  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Sampul.png"),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment(0, 0.7),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 35,
                color: Colors.blue[600],
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
              },
            ),
          ),
        ),
      ),
    );
  }

  Container textField(bool obs, int max, String labeltext) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          obscureText: obs,
          maxLength: max,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: labeltext),
        ),
      );
}

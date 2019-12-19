import 'package:flutter/material.dart';
import 'package:hello1/pages/hello_listView.dart';
import 'package:hello1/pages/hello_page1.dart';
import 'package:hello1/pages/hello_page3.dart';
import 'package:hello1/pages/hello_page2.dart';
import 'package:hello1/utils/nav.dart';
import 'package:hello1/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  Text _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }

  Image _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _button(context, String text, Function onPressed) {
    return BlueButton(text, onPressed: onPressed);
  }

  _buttons() {
    return Builder(
      builder: (_context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("List View",
                    onPressed: () =>
                        _onClickNavigator(_context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(_context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(_context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(_context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(_context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    print("Clicou no botão!");
    String s = await push(context, page);
    print(s);
  }

  _onClickToast() => _onClickToast;

  _onClickDialog(_context) {
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (_context) {
        return AlertDialog(
          title: Text("Flutter é muito legal"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(_context);
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(_context);
                print("OK");
              },
            ),
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Ola Flutter"),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          print("OK");
        },
      ),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changeValue(int value){
    setState(() {
      _people += value;

      if(_people < 0){
        _infoText = "Mundo Invertido?";
        _people = 0;
      } else if(_people > 20) {
        _infoText = "Lotado";
        _people = 20;
      } else {
        _infoText = "Pode Entar!";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(color: Colors.lightBlue, fontSize: 40.0),
                      ),
                      onPressed: () {
                        _changeValue(1);
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(color: Colors.lightBlue, fontSize: 40.0),
                      ),
                      onPressed: () {
                        _changeValue(-1);
                      },
                    )),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic),
            )
          ],
        )
      ],
    );
  }
}

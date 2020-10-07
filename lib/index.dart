import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<int> _myList = new List();
  TextEditingController _myController = new TextEditingController();
  String _result = "";
  String _inputList = "";
  String text;
  final _formKey = GlobalKey<FormState>();

  // ignore: missing_return
  int setSum() {
    for (int i = 0; i < _myList.length; i++) {
      if (i == 0)
        _inputList = "${_myList[i]}";
      else
        _inputList = _inputList + " , ${_myList[i]}";
    }

    int smallest = findFirstMissing(_myList, 0, _myList.length - 1);
    _result = "$smallest";
  }

  // ignore: missing_return
  int findFirstMissing(List<int> array, int begin, int end) {
    array.sort((a, b) => a.compareTo(b));

    for (int i = 0; i < array.length; i++) {
      if (i != array[i]) {
        return i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  title: Text(
                    "The array is",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: new Text(
                    "[" + _inputList + "]",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 25.0),
                child: new Text(
                  "Smallest missing integer is " + _result,
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 40.0),
                child: new TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an integer to add to array';
                    }
                    return null;
                  },
                  controller: _myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Input integer to add to array'),
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(left: 30, right: 30),
                child: ButtonTheme(
                  height: 40,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'ADD TO ARRAY',
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _myList.add(int.parse(text));
                            setSum();
                            _myController.clear();
                          });
                        } else {}
                      }),
                ),
              ),
            ],
          )),
    );
  }
}

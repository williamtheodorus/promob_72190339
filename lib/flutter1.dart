import 'package:flutter/material.dart';

class Flutter1 extends StatefulWidget {
  const Flutter1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Flutter1> createState() => _Flutter1();
}

class _Flutter1 extends State<Flutter1> {
  void pressSimpan(){
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Nama",
                hintText: "Masukan Nim",
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
            ),

            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
              )
              ),
            ),
            RaisedButton(
              onPressed: ()=> pressSimpan(),
              color: Colors.lightBlueAccent,
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
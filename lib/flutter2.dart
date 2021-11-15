import 'package:flutter/material.dart';
import 'package:promob_72190339/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Flutter2 extends StatefulWidget {
  const Flutter2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Flutter2> createState() => _Flutter2();
}

class _Flutter2 extends State<Flutter2> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: William Theodorus",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                  ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                }
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Submit'),
                onPressed: () {
                  if(_formKey.currentState!.validate()) {}
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Logout'),
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter Demo Home Page",)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
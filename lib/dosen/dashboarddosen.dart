import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget {
  const DashboardDosen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardDosen> createState() => _DashboardDosen();
}

class _DashboardDosen extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        child: GestureDetector(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Argo Wibowo"),
                  subtitle: Text("801 - argo@gmail.com"),
                  trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                        child: const Text('Update'), value: 'Edit'),
                      new PopupMenuItem<String>(
                        child: const Text('Delete'), value: 'Delete'),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
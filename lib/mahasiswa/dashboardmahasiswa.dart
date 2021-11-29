import 'package:flutter/material.dart';
import 'package:promob_72190339/model.dart';

class DashboardMahasiswa extends StatefulWidget {
  const DashboardMahasiswa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardMahasiswa> createState() => _DashboardMahasiswa();
}

class _DashboardMahasiswa extends State<DashboardMahasiswa> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> lMhs = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

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
                    title: Text("William Theodorus"),
                    subtitle: Text("301 - will@gmail.com"),
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
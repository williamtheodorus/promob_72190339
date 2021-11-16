import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {
  const DashboardMatakuliah({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardMatakuliah> createState() => _DashboardMatakuliah();
}

class _DashboardMatakuliah extends State<DashboardMatakuliah> {
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
                    leading: Icon(Icons.library_books),
                    title: Text("Pemrograman Mobile"),
                    subtitle: Text("3 SKS"),
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
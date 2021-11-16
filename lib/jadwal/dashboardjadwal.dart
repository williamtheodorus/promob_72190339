import 'package:flutter/material.dart';

class DashboardJadwal extends StatefulWidget {
  const DashboardJadwal({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardJadwal> createState() => _DashboardJadwal();
}

class _DashboardJadwal extends State<DashboardJadwal> {
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
                    leading: Icon(Icons.schedule),
                    title: Text("Pemrograman Mobile"),
                    subtitle: Text("Senin - 13.30 - 15.00"),
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
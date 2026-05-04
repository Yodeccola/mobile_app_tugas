import 'package:flutter/material.dart';
import 'dialog_page.dart';
import 'checkbox_page.dart';
import 'radio_page.dart';
import 'p1_page.dart';
import 'p2_page.dart';
import 'p3_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  Widget menuItem(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Menu")),
      body: ListView(
        children: [
          menuItem(context, "Pertemuan 1", Icons.looks_one, const P1Page()),
          menuItem(context, "Pertemuan 2", Icons.looks_two, const P2Page()),
          menuItem(context, "Pertemuan 3", Icons.looks_3, const P3Page()),
          menuItem(context, "Pertemuan 4", Icons.notifications, const DialogPage()),
          menuItem(context, "Pertemuan 5", Icons.list, const ListPage()),
          menuItem(context, "Pertemuan 6", Icons.check_box, const CheckboxPage()),
          menuItem(context, "Pertemuan 7", Icons.radio_button_checked, const RadioPage()),
        ],
      ),
    );
  }
}
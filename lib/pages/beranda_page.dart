import 'package:flutter/material.dart';
import 'dialog_page.dart';
import 'list_page.dart';
import 'checkbox_page.dart';
import 'profile_page.dart';
import 'radio_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Widget menuItem(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {"title": "Pertemuan 4", "icon": Icons.notifications, "page": const DialogPage()},
      {"title": "Pertemuan 5", "icon": Icons.list, "page": const ListPage()},
      {"title": "Pertemuan 6", "icon": Icons.check_box, "page": const CheckboxPage()},
      {"title": "Pertemuan 7", "icon": Icons.radio_button_checked, "page": const RadioPage()},
      {"title": "Profile", "icon": Icons.person, "page": const ProfilePage()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

            return GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2, // 👉 biar gak kegedean
              ),
              itemBuilder: (context, index) {
                return menuItem(
                  context,
                  items[index]["title"] as String,
                  items[index]["icon"] as IconData,
                  items[index]["page"] as Widget,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
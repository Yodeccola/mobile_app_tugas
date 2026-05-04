import 'package:flutter/material.dart';

class P1Page extends StatelessWidget {
  const P1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Pertemuan 1 - UI Dasar"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 HEADER
            const Text(
              "Belajar UI Flutter",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Ini adalah contoh penggunaan widget dasar seperti Text, Container, Row, dan Column.",
            ),

            const SizedBox(height: 20),

            // 🔹 CONTAINER BOX
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Ini adalah Container",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.thumb_up, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 CARD
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Ini adalah contoh Card widget"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
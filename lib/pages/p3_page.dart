import 'package:flutter/material.dart';
import 'p3_second_page.dart';

class P3Page extends StatelessWidget {
  const P3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Pertemuan 3 - Navigation"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text(
                  "Navigation Demo",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Klik tombol di bawah untuk pindah ke halaman lain menggunakan Navigator.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const P3SecondPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("Pindah Halaman"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
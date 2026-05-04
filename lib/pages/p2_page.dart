import 'package:flutter/material.dart';

class P2Page extends StatefulWidget {
  const P2Page({super.key});

  @override
  State<P2Page> createState() => _P2PageState();
}

class _P2PageState extends State<P2Page> {

  final TextEditingController namaController = TextEditingController();
  String hasil = "";

  void tampilkanNama() {
    setState(() {
      hasil = "Halo, ${namaController.text}!";
    });
  }

  void resetInput() {
    setState(() {
      namaController.clear();
      hasil = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Pertemuan 2 - Input & Button"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Input Data",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Masukkan Nama",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: tampilkanNama,
                    icon: const Icon(Icons.send),
                    label: const Text("Submit"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: resetInput,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (hasil.isNotEmpty)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    hasil,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
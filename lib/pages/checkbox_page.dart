import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {

  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();

  bool membaca = false;
  bool olahraga = false;
  bool musik = false;
  bool game = false;
  bool setuju = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Pendaftaran")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const Text("Nama"),
            TextField(controller: nama),

            const SizedBox(height: 10),

            const Text("Email"),
            TextField(controller: email),

            const SizedBox(height: 20),

            const Text("Hobi", style: TextStyle(fontWeight: FontWeight.bold)),

            CheckboxListTile(
              title: const Text("Membaca"),
              value: membaca,
              onChanged: (val) => setState(() => membaca = val!),
            ),
            CheckboxListTile(
              title: const Text("Olahraga"),
              value: olahraga,
              onChanged: (val) => setState(() => olahraga = val!),
            ),
            CheckboxListTile(
              title: const Text("Musik"),
              value: musik,
              onChanged: (val) => setState(() => musik = val!),
            ),
            CheckboxListTile(
              title: const Text("Game"),
              value: game,
              onChanged: (val) => setState(() => game = val!),
            ),

            const Divider(),

            CheckboxListTile(
              title: const Text("Saya menyetujui syarat"),
              value: setuju,
              onChanged: (val) => setState(() => setuju = val!),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: setuju ? () {} : null,
              child: const Text("DAFTAR"),
            ),
          ],
        ),
      ),
    );
  }
}
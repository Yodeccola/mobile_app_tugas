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

  void submitForm() {
    if (nama.text.isEmpty || email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama & Email wajib diisi")),
      );
      return;
    }

    List<String> hobi = [];
    if (membaca) hobi.add("Membaca");
    if (olahraga) hobi.add("Olahraga");
    if (musik) hobi.add("Musik");
    if (game) hobi.add("Game");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text("Pendaftaran Berhasil"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text("Nama: ${nama.text}")),
            ListTile(title: Text("Email: ${email.text}")),
            ListTile(
              title: Text(
                "Hobi: ${hobi.isEmpty ? '-' : hobi.join(", ")}",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data berhasil disimpan")),
              );

              // 🔄 Reset form
              nama.clear();
              email.clear();
              setState(() {
                membaca = false;
                olahraga = false;
                musik = false;
                game = false;
                setuju = false;
              });
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Pendaftaran")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            sectionTitle("Data Diri"),

            TextField(
              controller: nama,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            sectionTitle("Hobi"),

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
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: setuju ? submitForm : null,
              child: const Text("DAFTAR"),
            ),
          ],
        ),
      ),
    );
  }
}
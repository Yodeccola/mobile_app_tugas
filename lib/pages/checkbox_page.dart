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
        const SnackBar(
          content: Text("Nama & Email wajib diisi"),
        ),
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
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Pendaftaran Berhasil 🎉"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(nama.text),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(email.text),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(
                hobi.isEmpty ? "-" : hobi.join(", "),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Data berhasil disimpan"),
                ),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget hobbyTile(
    String title,
    bool value,
    Function(bool?) onChanged,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: CheckboxListTile(
        secondary: Icon(icon, color: Colors.teal),
        title: Text(title),
        value: value,
        activeColor: Colors.teal,
        onChanged: onChanged,
      ),
    );
  }

  Widget formCard(Widget child) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Form Checkbox"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // DATA DIRI
          formCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle("Data Diri", Icons.person),

                const SizedBox(height: 15),

                TextField(
                  controller: nama,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    prefixIcon: const Icon(Icons.badge),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // HOBI
          formCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                sectionTitle("Pilih Hobi", Icons.favorite),

                const SizedBox(height: 10),

                hobbyTile(
                  "Membaca",
                  membaca,
                  (val) => setState(() => membaca = val!),
                  Icons.menu_book,
                ),

                hobbyTile(
                  "Olahraga",
                  olahraga,
                  (val) => setState(() => olahraga = val!),
                  Icons.sports_soccer,
                ),

                hobbyTile(
                  "Musik",
                  musik,
                  (val) => setState(() => musik = val!),
                  Icons.music_note,
                ),

                hobbyTile(
                  "Game",
                  game,
                  (val) => setState(() => game = val!),
                  Icons.videogame_asset,
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // PERSETUJUAN
          formCard(
            CheckboxListTile(
              title: const Text(
                "Saya menyetujui syarat & ketentuan",
              ),
              value: setuju,
              activeColor: Colors.teal,
              onChanged: (val) {
                setState(() {
                  setuju = val!;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          // BUTTON
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: setuju ? submitForm : null,
            icon: const Icon(Icons.send),
            label: const Text(
              "DAFTAR SEKARANG",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {

  final TextEditingController nama = TextEditingController();
  final TextEditingController umur = TextEditingController();

  String? gender;
  String? pekerjaan;
  String? tipePekerjaan;

  final List<String> pekerjaanList = [
    "Admin", "Programmer", "Pengusaha", "Desainer", "Mahasiswa", "Hotel GRO"
  ];

  void resetForm() {
    setState(() {
      nama.clear();
      umur.clear();
      gender = null;
      pekerjaan = null;
      tipePekerjaan = null;
    });
  }

  void showResult() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Pendaftaran Berhasil!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text("Nama: ${nama.text}")),
            ListTile(title: Text("Umur: ${umur.text}")),
            ListTile(title: Text("Gender: $gender")),
            ListTile(title: Text("Pekerjaan: $pekerjaan")),
            ListTile(title: Text("Tipe: $tipePekerjaan")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Pendaftaran berhasil!"),
                ),
              );
            },
            child: const Text("OK"),
          )
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

  Widget pekerjaanChip(String label) {
    final isSelected = pekerjaan == label;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {
        setState(() {
          pekerjaan = label;
        });
      },
    );
  }

  Widget tipeRadio(String title, String subtitle, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: RadioListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        groupValue: tipePekerjaan,
        onChanged: (val) {
          setState(() {
            tipePekerjaan = val;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form dengan RadioButton"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            // DATA DIRI
            sectionTitle("Data Diri"),

            TextField(
              controller: nama,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: umur,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Umur",
                border: OutlineInputBorder(),
              ),
            ),

            // JENIS KELAMIN
            sectionTitle("Jenis Kelamin"),

            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text("Laki-laki"),
                    value: "Laki-laki",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() {
                        gender = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("Perempuan"),
                    value: "Perempuan",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() {
                        gender = val;
                      });
                    },
                  ),
                ),
              ],
            ),

            // PEKERJAAN
            sectionTitle("Pekerjaan"),

            Wrap(
              spacing: 8,
              children: pekerjaanList.map((e) => pekerjaanChip(e)).toList(),
            ),

            // TIPE PEKERJAAN
            sectionTitle("Tipe Pekerjaan"),

            tipeRadio("Full Time", "Bekerja 40 jam/minggu", "Full Time"),
            tipeRadio("Part Time", "Bekerja < 40 jam/minggu", "Part Time"),
            tipeRadio("Freelance", "Pekerja lepas", "Freelance"),
            tipeRadio("Kontrak", "Perjanjian waktu tertentu", "Kontrak"),

            const SizedBox(height: 20),

            // BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {
                      if (nama.text.isEmpty ||
                          umur.text.isEmpty ||
                          gender == null ||
                          pekerjaan == null ||
                          tipePekerjaan == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Lengkapi semua data!"),
                          ),
                        );
                      } else {
                        showResult();
                      }
                    },
                    child: const Text("Simpan Data"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: resetForm,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
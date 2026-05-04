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
                const SnackBar(content: Text("Pendaftaran berhasil!")),
              );
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  Widget pekerjaanChip(String label) {
    final isSelected = pekerjaan == label;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.teal.shade200,
      onSelected: (_) {
        setState(() {
          pekerjaan = label;
        });
      },
    );
  }

  Widget tipeRadio(String title, String subtitle, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: RadioListTile(
        secondary: Icon(icon, color: Colors.teal),
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

  Widget cardWrapper(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
        title: const Text("Form dengan RadioButton"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 🔹 DATA DIRI
          cardWrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Data Diri",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                TextField(
                  controller: nama,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: umur,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Umur",
                    prefixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 GENDER (PILL STYLE)
          cardWrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Jenis Kelamin",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Laki-laki"),
                        selected: gender == "Laki-laki",
                        selectedColor: Colors.teal,
                        onSelected: (_) {
                          setState(() => gender = "Laki-laki");
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Perempuan"),
                        selected: gender == "Perempuan",
                        selectedColor: Colors.pinkAccent,
                        onSelected: (_) {
                          setState(() => gender = "Perempuan");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 PEKERJAAN
          cardWrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pekerjaan",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  children: pekerjaanList
                      .map((e) => pekerjaanChip(e))
                      .toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 TIPE PEKERJAAN
          cardWrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tipe Pekerjaan",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                tipeRadio("Full Time", "Bekerja 40 jam/minggu", "Full Time", Icons.work),
                tipeRadio("Part Time", "Bekerja < 40 jam/minggu", "Part Time", Icons.access_time),
                tipeRadio("Freelance", "Pekerja lepas", "Freelance", Icons.laptop),
                tipeRadio("Kontrak", "Perjanjian waktu tertentu", "Kontrak", Icons.assignment),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 BUTTON
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (nama.text.isEmpty ||
                        umur.text.isEmpty ||
                        gender == null ||
                        pekerjaan == null ||
                        tipePekerjaan == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Lengkapi semua data!")),
                      );
                    } else {
                      showResult();
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Simpan Data"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: resetForm,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
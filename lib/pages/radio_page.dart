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
    "Admin",
    "Programmer",
    "Pengusaha",
    "Desainer",
    "Mahasiswa",
    "Hotel GRO"
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.teal),
            SizedBox(width: 10),
            Text("Pendaftaran Berhasil"),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(nama.text),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: Text("${umur.text} Tahun"),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text(gender ?? "-"),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text(pekerjaan ?? "-"),
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: Text(tipePekerjaan ?? "-"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Pendaftaran berhasil 🎉"),
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
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget formCard(Widget child) {
    return Card(
      elevation: 4,
      shadowColor: Colors.teal.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  Widget pekerjaanChip(String label, Color color) {
    final isSelected = pekerjaan == label;

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: color,
      backgroundColor: Colors.grey[200],
      onSelected: (_) {
        setState(() {
          pekerjaan = label;
        });
      },
    );
  }

  Widget tipeRadio(
    String title,
    String subtitle,
    String value,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: RadioListTile(
        secondary: Icon(icon, color: Colors.teal),
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        groupValue: tipePekerjaan,
        activeColor: Colors.teal,
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
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Form Radio Button"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // HEADER
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.cyan,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.assignment,
                    size: 40,
                    color: Colors.teal,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "Form Data Pekerjaan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Silakan isi data diri dengan lengkap",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

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
                    labelText: "Nama Lengkap",
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
                  controller: umur,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Umur",
                    prefixIcon: const Icon(Icons.cake),
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

          // GENDER
          formCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                sectionTitle(
                  "Jenis Kelamin",
                  Icons.people,
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Laki-laki"),
                        selected: gender == "Laki-laki",
                        selectedColor: Colors.blue,
                        labelStyle: TextStyle(
                          color: gender == "Laki-laki"
                              ? Colors.white
                              : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            gender = "Laki-laki";
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ChoiceChip(
                        label: const Text("Perempuan"),
                        selected: gender == "Perempuan",
                        selectedColor: Colors.pink,
                        labelStyle: TextStyle(
                          color: gender == "Perempuan"
                              ? Colors.white
                              : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            gender = "Perempuan";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // PEKERJAAN
          formCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                sectionTitle(
                  "Pekerjaan",
                  Icons.work,
                ),

                const SizedBox(height: 12),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    pekerjaanChip("Admin", Colors.teal),
                    pekerjaanChip("Programmer", Colors.indigo),
                    pekerjaanChip("Pengusaha", Colors.orange),
                    pekerjaanChip("Desainer", Colors.purple),
                    pekerjaanChip("Mahasiswa", Colors.green),
                    pekerjaanChip("Hotel GRO", Colors.pink),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // TIPE PEKERJAAN
          formCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                sectionTitle(
                  "Tipe Pekerjaan",
                  Icons.badge,
                ),

                const SizedBox(height: 10),

                tipeRadio(
                  "Full Time",
                  "Bekerja 40 jam/minggu",
                  "Full Time",
                  Icons.work,
                ),

                tipeRadio(
                  "Part Time",
                  "Bekerja < 40 jam/minggu",
                  "Part Time",
                  Icons.access_time,
                ),

                tipeRadio(
                  "Freelance",
                  "Pekerja lepas",
                  "Freelance",
                  Icons.laptop,
                ),

                tipeRadio(
                  "Kontrak",
                  "Perjanjian waktu tertentu",
                  "Kontrak",
                  Icons.assignment,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // BUTTON
          Row(
            children: [

              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
                  icon: const Icon(Icons.save),
                  label: const Text(
                    "Simpan Data",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: resetForm,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
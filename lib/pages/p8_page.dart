import 'package:flutter/material.dart';

class P8Page extends StatefulWidget {
  const P8Page({super.key});

  @override
  State<P8Page> createState() => _P8PageState();
}

class _P8PageState extends State<P8Page> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk mengambil data dari Autocomplete
  final TextEditingController _univController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();

  final List<String> listUniversitas = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
  ];

  final List<String> listJurusan = [
    'Sistem Informasi',
    'Akuntansi',
    'Psikologi',
    'Desain Komunikasi Visual',
  ];

  final List<String> listJenjang = ['SMA/Sederajat', 'D3', 'S1', 'S2', 'S3'];
  final List<String> listTahun = ['2020', '2021', '2022', '2023', '2024', '2025'];

  String? selectedJenjang;
  String? selectedTahun;

  // Fungsi untuk menampilkan Pop-up Dialog sukses
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Berhasil',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Data mahasiswa berhasil disimpan.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),
              _buildDialogRow('Universitas', _univController.text),
              _buildDialogRow('Jurusan', _jurusanController.text),
              _buildDialogRow('Jenjang', selectedJenjang ?? '-'),
              _buildDialogRow('Tahun Masuk', selectedTahun ?? '-'),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK', style: TextStyle(color: Colors.purple)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDialogRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, size: 16, color: Colors.purple[700]),
          Text('$label : ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  // Widget dekorasi custom untuk input field agar seragam
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form dengan AutoComplete dan Spinner",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Colors.purple[700],
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. AUTOCOMPLETE UNIVERSITAS
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return listUniversitas.where((String item) {
                    return item.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                  // Menyambungkan controller internal autocomplete ke controller utama kita
                  _univController.text = textEditingController.text;
                  textEditingController.addListener(() {
                    _univController.text = textEditingController.text;
                  });
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: _inputDecoration("Universitas *"),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 2. AUTOCOMPLETE JURUSAN
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return listJurusan.where((String item) {
                    return item.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                  _jurusanController.text = textEditingController.text;
                  textEditingController.addListener(() {
                    _jurusanController.text = textEditingController.text;
                  });
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: _inputDecoration("Jurusan *"),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 3. SPINNER JENJANG PENDIDIKAN
              DropdownButtonFormField<String>(
                value: selectedJenjang,
                decoration: _inputDecoration("Jenjang Pendidikan *"),
                items: listJenjang.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) => setState(() => selectedJenjang = value),
              ),
              const SizedBox(height: 16),

              // 4. SPINNER TAHUN MASUK
              DropdownButtonFormField<String>(
                value: selectedTahun,
                decoration: _inputDecoration("Tahun Masuk *"),
                items: listTahun.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) => setState(() => selectedTahun = value),
              ),
              const SizedBox(height: 24),

              // 5. TOMBOL SIMPAN DATA
              ElevatedButton.icon(
                onPressed: () {
                  if (_univController.text.isNotEmpty &&
                      _jurusanController.text.isNotEmpty &&
                      selectedJenjang != null &&
                      selectedTahun != null) {
                    _showSuccessDialog();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mohon isi semua data terlebih dahulu!')),
                    );
                  }
                },
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("Simpan Data", style: TextStyle(color: Colors.white, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

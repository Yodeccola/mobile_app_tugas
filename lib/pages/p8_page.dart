import 'package:flutter/material.dart';

class P8Page extends StatefulWidget {
  const P8Page({super.key});

  @override
  State<P8Page> createState() => _P8PageState();
}

class _P8PageState extends State<P8Page> {

  final List<String> universitas = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
  ];

  String? selectedJenjang;
  String? selectedTahun;

  final List<String> jenjang = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  final List<String> tahunMasuk = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 8"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// AUTOCOMPLETE
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {

                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }

                return universitas.where((String item) {
                  return item.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },

              onSelected: (String selection) {
                print(selection);
              },
            ),

            const SizedBox(height: 20),

            /// SPINNER / DROPDOWN
            DropdownButtonFormField<String>(
              value: selectedJenjang,
              hint: const Text("Pilih Jenjang"),

              items: jenjang.map((String item) {

                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );

              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedJenjang = value;
                });

              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedTahun,
              hint: const Text("Pilih Tahun Masuk"),

              items: tahunMasuk.map((String item) {

                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );

              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedTahun = value;
                });

              },
            ),

          ],
        ),
      ),
    );
  }
}
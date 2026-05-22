import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class P9Page extends StatefulWidget {
  const P9Page({super.key});

  @override
  State<P9Page> createState() => _P9PageState();
}

class _P9PageState extends State<P9Page> {
  final TextEditingController judulController =
      TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  DateTimeRange? selectedRange;

  DateTime? selectedDateTime;
  TimeOfDay? selectedDateTimeTime;

  bool isSubmitted = false;

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime.now(),

      lastDate: DateTime(2100),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff6C63FF),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,

      initialTime: TimeOfDay.now(),

      initialEntryMode: TimePickerEntryMode.dial,

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff6C63FF),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,

      firstDate: DateTime.now(),

      lastDate: DateTime(2100),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff6C63FF),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedRange = picked;
      });
    }
  }

  Future<void> pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime.now(),

      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,

        initialTime: TimeOfDay.now(),

        initialEntryMode: TimePickerEntryMode.dial,
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = pickedDate;
          selectedDateTimeTime = pickedTime;
        });
      }
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Pilih tanggal";
    return DateFormat('dd MMMM yyyy').format(date);
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return "Pilih waktu";

    final now = DateTime.now();

    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    return DateFormat('hh:mm a').format(dt);
  }

  Widget customCard({
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: child,
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Text(
        title,

        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff6C63FF),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget pickerTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),

        decoration: BoxDecoration(
          color: const Color(0xffF6F3FF),

          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: Colors.deepPurple.withOpacity(0.08),
          ),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff6C63FF),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void submitData() {
    if (judulController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null ||
        selectedRange == null ||
        selectedDateTime == null ||
        selectedDateTimeTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Semua data wajib diisi!",
          ),
        ),
      );

      return;
    }

    setState(() {
      isSubmitted = true;
    });

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),

              SizedBox(width: 10),

              Text("Berhasil!"),
            ],
          ),

          content: const Text(
            "Form berhasil disimpan!",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void resetForm() {
    setState(() {
      judulController.clear();

      selectedDate = null;
      selectedTime = null;

      selectedRange = null;

      selectedDateTime = null;
      selectedDateTimeTime = null;

      isSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0FF),

      appBar: AppBar(
        backgroundColor: const Color(0xff6C63FF),

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          "Date & Time Picker",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// INFORMASI ACARA
            customCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  sectionTitle("Informasi Acara"),

                  TextField(
                    controller: judulController,

                    decoration: InputDecoration(
                      hintText: "Contoh: Meeting Tim",

                      prefixIcon: const Icon(
                        Icons.title,
                      ),

                      filled: true,

                      fillColor:
                          const Color(0xffF6F3FF),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// PILIH TANGGAL
            customCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  sectionTitle("Pilih Tanggal"),

                  pickerTile(
                    icon: Icons.calendar_month,

                    text: formatDate(selectedDate),

                    onTap: pickDate,
                  ),
                ],
              ),
            ),

            /// PILIH WAKTU
            customCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  sectionTitle("Pilih Waktu"),

                  pickerTile(
                    icon: Icons.access_time,

                    text: formatTime(selectedTime),

                    onTap: pickTime,
                  ),
                ],
              ),
            ),

            /// RENTANG TANGGAL
            customCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  sectionTitle("Rentang Tanggal"),

                  pickerTile(
                    icon: Icons.date_range,

                    text: selectedRange == null
                        ? "Pilih rentang tanggal"
                        : "${formatDate(selectedRange!.start)} - ${formatDate(selectedRange!.end)}",

                    onTap: pickDateRange,
                  ),
                ],
              ),
            ),

            /// TANGGAL DAN WAKTU
            customCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  sectionTitle(
                    "Tanggal & Waktu Sekaligus",
                  ),

                  pickerTile(
                    icon: Icons.event,

                    text: selectedDateTime == null
                        ? "Pilih tanggal & waktu"
                        : "${formatDate(selectedDateTime)} , ${formatTime(selectedDateTimeTime)}",

                    onTap: pickDateTime,
                  ),
                ],
              ),
            ),

            /// BUTTON SIMPAN
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff6C63FF),

                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                onPressed: submitData,

                icon: const Icon(Icons.save),

                label: const Text(
                  "Simpan",
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// RESET
            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      const Color(0xff6C63FF),

                  side: const BorderSide(
                    color: Color(0xff6C63FF),
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                onPressed: resetForm,

                icon: const Icon(Icons.refresh),

                label: const Text(
                  "Reset Form",
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// PREVIEW DATA
            if (isSubmitted)
              customCard(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    sectionTitle("Preview Data"),

                    Text(
                      "Judul : ${judulController.text}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Tanggal : ${formatDate(selectedDate)}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Waktu : ${formatTime(selectedTime)}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Rentang : ${formatDate(selectedRange?.start)} - ${formatDate(selectedRange?.end)}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Tanggal & Waktu : ${formatDate(selectedDateTime)} , ${formatTime(selectedDateTimeTime)}",
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
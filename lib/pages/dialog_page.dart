import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  // 🔔 TOAST FUNCTION
  void showToast() {
  Fluttertoast.showToast(
    msg: "Login berhasil!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
  );
}

  // ⚠️ ALERT DIALOG FUNCTION
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah kamu yakin ingin melanjutkan?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // tutup dialog
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showToast(); // sekalian kasih feedback
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast & Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔔 BUTTON TOAST
            ElevatedButton(
              onPressed: showToast,
              child: const Text("Tampilkan Toast"),
            ),

            const SizedBox(height: 20),

            // ⚠️ BUTTON DIALOG
            ElevatedButton(
              onPressed: () => showAlert(context),
              child: const Text("Tampilkan Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
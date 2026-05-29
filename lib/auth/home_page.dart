import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xff3399FF),

        foregroundColor: Colors.white,

        title: const Text("Home"),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const LoginPage(),
                ),
              );
            },

            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),

          padding: const EdgeInsets.all(28),

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xff3399FF),
                Color(0xff66B2FF),
              ],
            ),

            borderRadius:
                BorderRadius.circular(28),

            boxShadow: [
              BoxShadow(
                color:
                    Colors.blue.withOpacity(0.25),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const CircleAvatar(
                radius: 42,

                backgroundColor: Colors.white,

                child: Icon(
                  Icons.person,
                  size: 45,
                  color: Color(0xff3399FF),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome, Admin3",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                email,

                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: Colors.orange,

                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: const Text(
                  "🔥 Email belum terverifikasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
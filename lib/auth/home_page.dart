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
      backgroundColor: const Color(0xffF8F5FA),

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
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            CircleAvatar(
              radius: 55,

              backgroundColor:
                  Colors.blue.withOpacity(0.20),

              child: const Icon(
                Icons.person,
                size: 55,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Welcome, Yola!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Email: $email",

              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: 240,

              padding:
                  const EdgeInsets.symmetric(
                vertical: 22,
                horizontal: 18,
              ),

              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,

                borderRadius:
                    BorderRadius.circular(18),
              ),

              child: Column(
                children: const [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),

                  SizedBox(height: 14),

                  Text(
                    "You have successfully logged in!",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 16,
                    ),
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
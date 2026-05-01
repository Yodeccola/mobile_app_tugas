import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          // 🔥 HEADER + PROFILE PIC (FIXED)
          Stack(
            clipBehavior: Clip.none, // ✅ penting biar gak ke-cut
            alignment: Alignment.center,
            children: [

              Image.asset(
                "assets/images/header.jpeg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: -50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4), // ✨ biar clean
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/profile_pic.jpeg"),
                  ),
                ),
              ),
            ],
          ),

          // 🔥 spacing tambahan biar gak ketutup
          const SizedBox(height: 70),

          // 🧾 NAMA
          const Center(
            child: Text(
              "Annisaa Gladiola Duryat (Yola)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 🆔 INFO
          const Center(
            child: Text("241011701233 | 04SIFE009"),
          ),

          const SizedBox(height: 20),

          // 📊 CARD INFO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [

                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text("jeonhawo@gmail.com"),
                    ),

                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text("081297555245"),
                    ),

                    ListTile(
                      leading: Icon(Icons.cake, color: Colors.blue),
                      title: Text("11 April 2003"),
                    ),

                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text(
                        "Goldberry Lane No. 7, The High Court, Insmire, Elfhame",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🧠 ABOUT
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "About Me",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Seorang mahasiswa yang lebih cepat paham lewat praktik daripada teori. Suka hal-hal visual, kreatif, dan detail—mulai dari menggambar sampai ngatur estetika hidup (dan aplikasi).",
            ),
          ),

          // 🎯 SKILLS
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Skills & Interests",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("Drawing")),
                Chip(label: Text("Makeup")),
                Chip(label: Text("Photo Editing")),
                Chip(label: Text("Cooking")),
                Chip(label: Text("Styling")),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
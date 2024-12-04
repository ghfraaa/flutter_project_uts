// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/galeri.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // animasi splash screen
      home: SplashScreen(),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label; // Parameter untuk teks label

  const SkillChip({
    super.key,
    required this.label, // Parameter label wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white, // Warna teks
          fontWeight: FontWeight.bold, // Teks tebal
        ),
      ),
      backgroundColor: const Color(0xFFFF69b4), // Warna latar belakang chip
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Padding chip
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            // google fonts
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 176, 203),
                    Color.fromARGB(255, 239, 177, 255)
                  ], // Warna gradasi
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Ghefira Novita Putri',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('ghfraputri23@gmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/logo.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/bg1.jpg'))),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.images,
                  ),
                  title: const Text('Galeri'),
                  onTap: () async {
                    // Ganti ini dengan navigasi ke halaman project.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPhotoPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                  ),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6282120791879?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  // font awesome icon
                  leading: const Icon(FontAwesomeIcons.instagram),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://www.instagram.com/ghfrvt/');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Apakah anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text(
                                  'Keluar',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  SystemNavigator.pop();
                                }),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Card(
              elevation: 8, // Menambahkan bayangan untuk efek 3D
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Membuat sudut membulat
              ),
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Agar Card menyesuaikan kontennya
                    children: [
                      // Animated logo
                      const AnimatedLogo(),
                      const SizedBox(height: 25),
                      // Nama dan posisi
                      Text(
                        'Ghefira Novita Putri',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Student',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 0),
                      // Deskripsi
                      Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                "A student at ITB STIKOM Ambon with a strong drive to learn new things. Currently focused on mastering Flutter development and dedicated to creating innovative solutions through various creative projects.",
                                speed: const Duration(milliseconds: 60),
                                textStyle: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ],
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Card di dalam Card
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.pink[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.school,
                                      color: Colors.pink,
                                      size: 40,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Semester",
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "5th",
                                      style: TextStyle(
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Card(
                              color: Colors.blue[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.code,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Project",
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "10+",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
// Skill tambahan
                      Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Membuat sudut melengkung
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              15.0), // Padding di dalam kartu
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Teks rata kiri
                            children: [
                              // Judul "Additional Skills"
                              Text(
                                "Additional Skills",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 20, // Ukuran teks
                                    fontWeight: FontWeight.bold, // Teks tebal
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Spasi antara judul dan daftar skill
                              // Daftar skill menggunakan Wrap untuk layout responsif
                              Wrap(
                                spacing: 5, // Spasi horizontal antar elemen
                                // runSpacing:
                                //     2, // Spasi vertikal jika elemen membungkus
                                children: const [
                                  SkillChip(label: "PHP"),
                                  SkillChip(label: "HTML"),
                                  SkillChip(label: "Flutter"),
                                  SkillChip(label: "Dart"),
                                  SkillChip(label: "Python"),
                                  SkillChip(label: "SQL/MySQL"),
                                  SkillChip(label: "C/C++"),
                                  SkillChip(label: "Git/GitHub"),
                                  SkillChip(label: "CSS"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// animated logo new class
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/logo.jpg',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}

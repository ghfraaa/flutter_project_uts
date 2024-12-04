import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPhotoPageState createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  List<File> _images = []; // List untuk menyimpan gambar-gambar yang dipilih

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images
            .add(File(pickedFile.path)); // Menambahkan gambar ke dalam daftar
      });
    }
  }

  // Fungsi untuk mengambil gambar menggunakan kamera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images
            .add(File(pickedFile.path)); // Menambahkan gambar ke dalam daftar
      });
    }
  }

  // Menampilkan daftar gambar dalam dua kolom
  Widget _buildImageGrid() {
    if (_images.isEmpty) {
      return const Center(
        child: Text(
          'Tidak ada gambar yang dipilih',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // Agar grid tidak bisa di-scroll terpisah
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dua kolom
          crossAxisSpacing: 10.0, // Spasi antar kolom
          mainAxisSpacing: 10.0, // Spasi antar baris
          childAspectRatio: 1, // Rasio lebar dan tinggi gambar
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              _images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Foto'),
        backgroundColor: const Color.fromARGB(255, 255, 176, 203),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Menampilkan grid gambar
            _buildImageGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Menambahkan Floating Action Button di pojok kanan bawah
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Menambahkan gambar baru dari galeri
          _pickImageFromGallery(); // Contoh tindakan, bisa disesuaikan
        },
        backgroundColor: const Color.fromARGB(255, 255, 176, 203),
        child: const Icon(Icons.add), // Ikon tambah
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddPhotoPage(),
  ));
}

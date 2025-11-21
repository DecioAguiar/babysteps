import 'dart:io';
import 'package:babysteps/home/tabs/edit_baby_info_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BabyInfoTab extends StatefulWidget {
  const BabyInfoTab({super.key});

  @override
  State<BabyInfoTab> createState() => _BabyInfoTabState();
}

class _BabyInfoTabState extends State<BabyInfoTab> {
  String _babyName = 'Bebê';
  String _babyDob = 'dd/mm/aaaa';
  String _birthWeight = '0';
  String _currentWeight = '0';
  String _birthHeight = '0';
  String _currentHeight = '0';
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadBabyInfo();
  }

  Future<void> _loadBabyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _babyName = prefs.getString('baby_name') ?? 'Bebê';
      _babyDob = prefs.getString('baby_dob') ?? 'dd/mm/aaaa';
      _birthWeight = prefs.getString('baby_birth_weight') ?? '0';
      _currentWeight = prefs.getString('baby_current_weight') ?? '0';
      _birthHeight = prefs.getString('baby_birth_height') ?? '0';
      _currentHeight = prefs.getString('baby_current_height') ?? '0';
      _imagePath = prefs.getString('baby_photo_path');
    });
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha a fonte da imagem'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeria'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Câmera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('baby_photo_path', pickedFile.path);
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider backgroundImage;
    if (_imagePath != null && _imagePath!.isNotEmpty) {
      backgroundImage = FileImage(File(_imagePath!));
    } else {
      backgroundImage = const AssetImage('assets/icons/asiaticBaby.jpg');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Bebê'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditBabyInfoPage(),
                ),
              );

              if (result == true) {
                _loadBabyInfo();
              }
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF3E5F5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _showImageSourceDialog,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: const Color(0xFFD5CCFF),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white70,
                          backgroundImage: backgroundImage,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  _babyName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E3666),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InfoBar(label: 'Data de Nascimento', value: _babyDob),
              InfoBar(label: 'Peso ao nascer', value: '$_birthWeight kg'),
              InfoBar(label: 'Peso atual', value: '$_currentWeight kg'),
              InfoBar(label: 'Altura ao nascer', value: '$_birthHeight cm'),
              InfoBar(label: 'Altura atual', value: '$_currentHeight cm'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBar extends StatelessWidget {
  final String label;
  final String value;

  const InfoBar({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFD5CCFF).withOpacity(0.35),
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF3E3666),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditBabyInfoPage extends StatefulWidget {
  const EditBabyInfoPage({super.key});

  @override
  State<EditBabyInfoPage> createState() => _EditBabyInfoPageState();
}

class _EditBabyInfoPageState extends State<EditBabyInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _birthWeightController = TextEditingController();
  final _currentWeightController = TextEditingController();
  final _birthHeightController = TextEditingController();
  final _currentHeightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadBabyInfo();
  }

  Future<void> _loadBabyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('baby_name') ?? '';
      _dobController.text = prefs.getString('baby_dob') ?? '';
      _birthWeightController.text = prefs.getString('baby_birth_weight') ?? '';
      _currentWeightController.text = prefs.getString('baby_current_weight') ?? '';
      _birthHeightController.text = prefs.getString('baby_birth_height') ?? '';
      _currentHeightController.text = prefs.getString('baby_current_height') ?? '';
    });
  }

  Future<void> _saveBabyInfo() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('baby_name', _nameController.text);
      await prefs.setString('baby_dob', _dobController.text);
      await prefs.setString('baby_birth_weight', _birthWeightController.text);
      await prefs.setString('baby_current_weight', _currentWeightController.text);
      await prefs.setString('baby_birth_height', _birthHeightController.text);
      await prefs.setString('baby_current_height', _currentHeightController.text);

      if (mounted) {
        Navigator.pop(context, true); // Return true to indicate success
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Informações do Bebê'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Bebê'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do bebê';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a data de nascimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _birthWeightController,
                decoration: const InputDecoration(labelText: 'Peso ao nascer (kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _currentWeightController,
                decoration: const InputDecoration(labelText: 'Peso atual (kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _birthHeightController,
                decoration: const InputDecoration(labelText: 'Altura ao nascer (cm)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _currentHeightController,
                decoration: const InputDecoration(labelText: 'Altura atual (cm)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveBabyInfo,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

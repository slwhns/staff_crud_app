import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffCreationPage extends StatefulWidget {
  final String? staffId;
  final Map<String, dynamic>? existingData;

  StaffCreationPage({this.staffId, this.existingData});

  @override
  _StaffCreationPageState createState() => _StaffCreationPageState();
}

class _StaffCreationPageState extends State<StaffCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingData != null) {
      _nameController.text = widget.existingData!['name'] ?? '';
      _idController.text = widget.existingData!['id'] ?? '';
      _ageController.text = widget.existingData!['age']?.toString() ?? '';
    }
  }

  void _submitForm() async {
  if (_formKey.currentState!.validate()) {
    try {
      final staffData = {
        'name': _nameController.text.trim(),
        'id': _idController.text.trim(),
        'age': int.tryParse(_ageController.text.trim()) ?? 0,
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (widget.staffId == null) {
        // Create new staff
        await FirebaseFirestore.instance.collection('staff').add(staffData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Staff created successfully")),
        );
      } else {
        // Update existing staff
        await FirebaseFirestore.instance
            .collection('staff')
            .doc(widget.staffId)
            .update(staffData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Staff updated successfully")),
        );
      }

      Navigator.pop(context);
    } catch (e) {
      print("Firestore Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.staffId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Staff" : "Add New Staff"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Staff Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Staff ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter ID' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter age' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  isEditing ? 'Update' : 'Submit',
                  style: TextStyle(color: Colors.white), // ✅ Set text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
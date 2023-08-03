import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateDonorScreen extends StatefulWidget {
  final String docId;
  final String name;
  final String phone;
  final String group;

  const UpdateDonorScreen({
    required this.docId,
    required this.name,
    required this.phone,
    required this.group,
  });

  factory UpdateDonorScreen.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UpdateDonorScreen(
      docId: snapshot.id,
      name: data['name'],
      phone: data['phone'].toString(),
      group: data['group'],
    );
  }

  @override
  _UpdateDonorScreenState createState() => _UpdateDonorScreenState();
}

class _UpdateDonorScreenState extends State<UpdateDonorScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedGroup;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> bloodgroup = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-',
  ];

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    selectedGroup = widget.group;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Donor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 15,
                controller: nameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                maxLength: 10,
                controller: phoneController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedGroup,
                items: bloodgroup
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: TextStyle(color: Colors.black)),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedGroup = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: "SELECT BLOOD GROUP",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a blood group';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateDonorData(widget.docId);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                child: Text("Update Donor"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateDonorData(String docId) async {
    try {
      final donorRef =
          FirebaseFirestore.instance.collection('donor').doc(docId);

      final updatedData = {
        'name': nameController.text,
        'phone': phoneController.text,
        'group': selectedGroup,
      };

      await donorRef.update(updatedData);

      Navigator.pop(context);
    } catch (error) {
      print("Error updating donor data: $error");
      // Handle the error appropriately
    }
  }
}

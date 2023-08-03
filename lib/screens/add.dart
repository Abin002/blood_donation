import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

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

class _AddUserState extends State<AddUser> {
  String? selectedGroup;

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController donorname = TextEditingController();
  TextEditingController donorphone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Donors",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              maxLength: 15,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ENTER YOUR NAME",
                labelStyle: TextStyle(color: Colors.black),
              ),
              controller: donorname,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLength: 10,
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ENTER YOUR PHONE NUMBER",
                labelStyle: TextStyle(color: Colors.black),
              ),
              controller: donorphone,
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              value: selectedGroup,
              items: bloodgroup
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child:
                          Text(e, style: const TextStyle(color: Colors.black))))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedGroup = val;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "SELECT BLOOD GROUP",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                print(_validateFields()); // Debugging line
                if (_validateFields()) {
                  addDonor();
                  Navigator.pop(context);
                } else {
                  _showEmptyFieldAlert();
                }
              },
              child: const Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    return donorname.text.isNotEmpty &&
        donorphone.text.isNotEmpty &&
        selectedGroup != null;
  }

  void _showEmptyFieldAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(179, 254, 29, 29),
          title: const Text("Alert"),
          content: const Text(
            "Please fill in all fields before saving.",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
        );
      },
    );
  }

  void addDonor() {
    final data = {
      'name': donorname.text,
      'phone': donorphone.text,
      'group': selectedGroup,
    };
    donor.add(data);
  }
}

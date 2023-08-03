import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/update.dart';

class DonorListTile extends StatelessWidget {
  final DocumentSnapshot donorsnap;

  const DonorListTile({required this.donorsnap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Add curved corners
      ),
      child: ListTile(
        title: Text(
          donorsnap['name'],
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          donorsnap['phone'].toString(),
          style: const TextStyle(color: Colors.black),
        ),
        leading: CircleAvatar(
          child: Text(donorsnap['group']),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateDonorScreen(
                      docId: donorsnap.id, // Pass the document ID
                      name: donorsnap['name'],
                      phone: donorsnap['phone'].toString(),
                      group: donorsnap['group'],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.blue),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () async {
                try {
                  await donorsnap.reference.delete();
                } catch (error) {
                  print("Error deleting donor data: $error");
                  // Handle the error appropriately
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

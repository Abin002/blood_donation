import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLOOD DONATION APP",
        ),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "AddUsers");
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot donorsnap = snapshot.data!.docs[index];
                return DonorListTile(donorsnap: donorsnap);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

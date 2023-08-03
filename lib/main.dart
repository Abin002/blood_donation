import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/screenhome.dart';
import 'screens/add.dart';
import 'screens/update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? keey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: Typography.whiteMountainView,
      ),
      home: const ScreenHome(),
      title: 'blood donation app',
      routes: {
        'homescreen': (context) => const ScreenHome(),
        'AddUsers': (context) => const AddUser(),
        'update': (context) => const UpdateDonorScreen(
              docId: 'initial_value', // Provide an initial value here if needed
              name: 'initial_value',
              phone: 'initial_value',
              group: 'initial_value',
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Screen' ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,

        ),


      ),
    );
  }
}

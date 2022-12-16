import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contactme extends StatelessWidget {
  const Contactme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact me'),
        backgroundColor: Color.fromARGB(255, 87, 87, 87),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Perkenalkan, nama saya Muchiss',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 27, 27, 27)),
            ),
          ],
        ),
      ),
    );
  }
}

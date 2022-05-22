import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(this.errorMessage, {Key? key}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(errorMessage)),
        ),
      ),
    );
  }
}

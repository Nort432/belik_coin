import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(this.errorMessage, {Key? key}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text(errorMessage),
      ),
    );
  }
}

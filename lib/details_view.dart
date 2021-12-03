import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imageList;

  const DetailsPage({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          imageList,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

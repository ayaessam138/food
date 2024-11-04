
import 'package:flutter/material.dart';


class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.black),
    );
  }
}
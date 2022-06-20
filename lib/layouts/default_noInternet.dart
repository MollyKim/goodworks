import 'package:flutter/material.dart';
import 'package:practice/layouts/default_layout.dart';

class DefaultNoInternetScreen extends StatelessWidget {
  const DefaultNoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(body: Center(child: Text("에러"),));
  }
}

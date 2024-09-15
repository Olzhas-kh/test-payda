import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Что-то пошло не так, повторите попытку позже!"),
    );
  }
}
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

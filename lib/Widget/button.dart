import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;

  const RoundedButton(
      {super.key,
      this.label,
      this.icon,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.11,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: 3,
              padding: EdgeInsets.all(1),
              shape: const CircleBorder()),
          child: icon != null
              ? Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              : Center(
                  child: Text(
                    label!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                  ),
                )),
    );
  }
}

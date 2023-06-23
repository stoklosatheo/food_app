import 'package:flutter/material.dart';
import 'package:food_app/models/utils.dart';

class Step extends StatelessWidget {
  const Step(this.position, this.text, {super.key});

  final String position;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: H1(
            position,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(text)
        // BoxDecoration(position, style: ,)
      ],
    );
  }
}

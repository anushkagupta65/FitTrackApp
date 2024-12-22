import 'package:flutter/material.dart';

class MultipleStats extends StatelessWidget {
  const MultipleStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconText(
              text: "Heart Pts: 38" ,
              icon: Icon(Icons.favorite_outline_sharp),
            ),
            SizedBox(
              width: 24,
            ),
            IconText(
              text: "Steps: 10500",
              icon: Icon(
                Icons.do_not_step_sharp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatText(
              stat: "1111",
              text: "Cal",
            ),
            SizedBox(
              width: 56,
            ),
            StatText(
              stat: "0.45",
              text: "km",
            ),
            SizedBox(
              width: 56,
            ),
            StatText(
              stat: "45",
              text: "Move Min",
            ),
          ],
        )
      ],
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(text),
      ],
    );
  }
}

class StatText extends StatelessWidget {
  const StatText({
    super.key,
    required this.stat,
    required this.text,
  });

  final String stat;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          stat,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        Text(text),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SettingOptionDropdown extends StatelessWidget {
  const SettingOptionDropdown({
    super.key,
    required this.headerText,
    required this.title,
    required this.onTap,
  });

  final String headerText;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 156,
      height: 56,
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color(0xFFE0E0E0),
      )),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(title,
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16)),
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_drop_down,
          size: 20,
        ),
      ),
    );
  }
}

class SettingSectionTile extends StatelessWidget {
  const SettingSectionTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .appBarTheme
            .titleTextStyle
            ?.copyWith(fontSize: 16),
      ),
    );
  }
}

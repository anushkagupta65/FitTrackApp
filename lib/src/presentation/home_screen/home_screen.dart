import 'package:fit_track_app/src/presentation/home_screen/widgets/multiple_stats.dart';
import 'package:fit_track_app/src/presentation/home_screen/widgets/radial_status_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadialStatusBar(),
          MultipleStats(),
        ],
      ),
    );
  }
}

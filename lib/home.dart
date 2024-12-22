import 'package:fit_track_app/src/presentation/home_screen/home_screen.dart';
import 'package:fit_track_app/src/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int currentPageIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        color: Theme.of(context).appBarTheme.backgroundColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          currentIndex: currentPageIndex,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(Icons.person_2_outlined),
            )
          ],
        ),
      ),
    );
  }
}

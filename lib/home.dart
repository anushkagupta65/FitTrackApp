import 'package:fit_track_app/src/presentation/home_screen/home_screen.dart';
import 'package:fit_track_app/src/presentation/journal_screen/journal_screen.dart';
import 'package:fit_track_app/src/presentation/profile_screen/profile_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomeScreen(),
          JournalScreen(),
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
              icon: Icon(FluentIcons.home_20_regular),
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentIcons.document_one_page_20_regular),
              label: "journal",
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(FluentIcons.person_20_regular),
            )
          ],
        ),
      ),
    );
  }
}

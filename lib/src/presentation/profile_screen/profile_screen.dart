import 'package:fit_track_app/src/presentation/profile_screen/widgets/settings_input_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
// ********************************************************* Activity Goals Section *********************************************************
            const SettingSectionTile(title: "Activity Goals"),
            const Divider(
              color: Color(0xFFE0E0E0),
              height: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SettingOptionDropdown(
                    headerText: "Steps",
                    onTap: () {},
                    title: "5,000",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SettingOptionDropdown(
                    headerText: "Heart Points",
                    onTap: () {},
                    title: "30",
                  ),
                ],
              ),
            ),
// ********************************************************* Bedtime Schedule Section *********************************************************
            const SettingSectionTile(title: "Bedtime Schedule"),
            const Divider(
              color: Color(0xFFE0E0E0),
              height: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SettingOptionDropdown(
                    headerText: "Get in Bed",
                    onTap: () {},
                    title: "23:00",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SettingOptionDropdown(
                    headerText: "Wake Up",
                    onTap: () {},
                    title: "07:00",
                  ),
                ],
              ),
            ),
// ********************************************************* About You Section *********************************************************
            const SettingSectionTile(title: "About You"),
            const Divider(
              color: Color(0xFFE0E0E0),
              height: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SettingOptionDropdown(
                        headerText: "Gender",
                        onTap: () {},
                        title: "Female",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SettingOptionDropdown(
                        headerText: "Birthday",
                        onTap: () {},
                        title: "30 Jan, 01",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SettingOptionDropdown(
                        headerText: "Weight",
                        onTap: () {},
                        title: "60 kg",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SettingOptionDropdown(
                        headerText: "Height",
                        onTap: () {},
                        title: "152 cm",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:fit_track_app/home.dart';
// import 'package:fit_track_app/src/presentation/home_screen/home_screen.dart';
// import 'package:fit_track_app/src/presentation/profile_screen/profile_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'FitTrack',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const Home(),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart'; // Import translator package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paginated API Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaginatedListScreen(),
    );
  }
}

class PaginatedListScreen extends StatefulWidget {
  const PaginatedListScreen({super.key});

  @override
  PaginatedListScreenState createState() => PaginatedListScreenState();
}

class PaginatedListScreenState extends State<PaginatedListScreen> {
  List<dynamic> items = [];
  int page = 1;
  bool isLoading = false;
  bool hasMoreData = true;
  final ScrollController scrollController = ScrollController();
  final translator = GoogleTranslator(); // Create a translator instance

  @override
  void initState() {
    super.initState();
    fetchData();

    // Detect scroll to bottom
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  /// Function to translate text using Google Translator
  Future<String> translateText(String text) async {
    try {
      final translation =
          await translator.translate(text, to: 'en'); // Translate to English
      return translation.text;
    } catch (e) {
      print("Translation Error: $e");
      return text; // Return original text if translation fails
    }
  }

  /// Fetch API Data and Translate Text
  Future<void> fetchData() async {
    if (isLoading || !hasMoreData) return;

    setState(() {
      isLoading = true;
    });

    final String apiUrl =
        "https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List newData = json.decode(response.body);

        // Translate each title and body before adding to items
        for (var item in newData) {
          String translatedTitle = await translateText(item['title']);
          String translatedBody = await translateText(item['body']);

          setState(() {
            items.add({
              "title": translatedTitle,
              "body": translatedBody,
            });
          });
        }

        setState(() {
          page++;
          hasMoreData = newData.isNotEmpty; // No more pages if empty
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paginated API List")),
      body: items.isEmpty && isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading initially
          : ListView.builder(
              controller: scrollController,
              itemCount: items.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return const Center(
                      child: CircularProgressIndicator()); // Loader at bottom
                }
                return ListTile(
                  title: Text(items[index]['title']),
                  subtitle: Text(items[index]['body']),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

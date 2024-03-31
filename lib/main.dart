import 'pages/chat_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    const apiKey = String.fromEnvironment('API_KEY');

    if (kDebugMode) {
      print(apiKey.isEmpty ? 'API Key not found' : 'API key found');
    }

    return MaterialApp(
      title: 'Default ChatGPT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 171, 222, 244),
        ),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}

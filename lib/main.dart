import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_app/business_list_screen.dart';
import 'package:mini_app/business_provider.dart';

void main() {
  runApp(const MiniApp());
}

class MiniApp extends StatelessWidget {
  const MiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BusinessProvider()..loadBusinesses(),
      child: MaterialApp(
        title: 'Mini App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
  home: const BusinessListScreen(),
      ),
    );
  }
}


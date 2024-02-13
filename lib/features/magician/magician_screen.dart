import 'package:flutter/material.dart';

class MagicianScreen extends StatefulWidget {
  const MagicianScreen({super.key});

  @override
  State<MagicianScreen> createState() => _MagicianScreenState();
}

class _MagicianScreenState extends State<MagicianScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마법사'),
      ),
      body: const Center(
        child: Text('마법사 화면'),
      ),
    );
  }
}

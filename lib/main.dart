import 'package:flutter/material.dart';
import 'data/sample_family_data.dart';
import 'widgets/family_tree_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Family Tree')),
        body: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(200),
          minScale: 0.5,
          maxScale: 2.5,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(24),
              child: FamilyTreeView(node: sampleFamilyTree),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/family_node.dart';

class FamilyNodeDetailPage extends StatelessWidget {
  final FamilyNode node;

  const FamilyNodeDetailPage({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(node.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(node.avatarPath),
            ),
            const SizedBox(height: 16),
            Text('Name: ${node.name}'),
            Text('Age: ${node.age}'),
            const SizedBox(height: 12),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(node.description),
          ],
        ),
      ),
    );
  }
}
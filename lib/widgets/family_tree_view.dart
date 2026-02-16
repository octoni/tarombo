import 'package:flutter/material.dart';
import '../models/family_node.dart';
import '../pages/family_node_detail_page.dart';
import 'tree_connector_painter.dart';

const double nodeWidth = 260;
const double nodeHeight = 52;
const double horizontalSpacing = 24;

class FamilyTreeView extends StatefulWidget {
  final FamilyNode node;

  const FamilyTreeView({super.key, required this.node});

  @override
  State<FamilyTreeView> createState() => _FamilyTreeViewState();
}

class _FamilyTreeViewState extends State<FamilyTreeView> {
  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final hasChildren = node.children.isNotEmpty;

    final connectorWidth =
        node.children.length * nodeWidth +
        (node.children.length - 1) * horizontalSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap:
              hasChildren
                  ? () => setState(() => node.isExpanded = !node.isExpanded)
                  : null,
          child: Container(
            width: nodeWidth,
            height: nodeHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade400),
            ),
            child: Row(
              children: [
                if (hasChildren)
                  Icon(
                    node.isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(node.avatarPath),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(node.name, overflow: TextOverflow.ellipsis),
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline, size: 18),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FamilyNodeDetailPage(node: node),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        if (node.isExpanded && hasChildren) ...[
          const SizedBox(height: 12),
          CustomPaint(
            size: Size(connectorWidth, 40),
            painter: TreeConnectorPainter(childCount: node.children.length),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                node.children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalSpacing / 2,
                    ),
                    child: FamilyTreeView(node: child),
                  );
                }).toList(),
          ),
        ],
      ],
    );
  }
}

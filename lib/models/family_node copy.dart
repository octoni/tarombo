class FamilyNode {
  final String name;
  final int age;
  final String description;
  final String avatarPath;

  final List<FamilyNode> children;
  bool isExpanded;

  FamilyNode({
    required this.name,
    required this.age,
    required this.description,
    required this.avatarPath,
    this.children = const [],
    this.isExpanded = false,
  });
}
import '../models/family_node.dart';

final FamilyNode sampleFamilyTree = FamilyNode(
  name: 'Great Grand Parent',
  age: 90,
  description: 'Founder of the family',
  avatarPath: 'assets/avatars/man1.png',
  children: [
    FamilyNode(
      name: 'Grand Parent A',
      age: 68,
      description: 'First child',
      avatarPath: 'assets/avatars/man1.png',
      children: [
        FamilyNode(
          name: 'Parent A1',
          age: 45,
          description: 'Eldest son',
          avatarPath: 'assets/avatars/man1.png',
          children: [
            FamilyNode(
              name: 'Son A1-1',
              age: 20,
              description: 'College student',
              avatarPath: 'assets/avatars/man1.png',
            ),
            FamilyNode(
              name: 'Son A1-2',
              age: 18,
              description: 'High school student',
              avatarPath: 'assets/avatars/man2.png',
            ),
          ],
        ),
      ],
    ),
    FamilyNode(
      name: 'Grand Parent B',
      age: 66,
      description: 'Second child',
      avatarPath: 'assets/avatars/man1.png',

      children: [
        FamilyNode(
          name: 'Parent B1',
          age: 45,
          description: 'Eldest son',
          avatarPath: 'assets/avatars/man1.png',
          children: [
            FamilyNode(
              name: 'Son B1-1',
              age: 20,
              description: 'College student',
              avatarPath: 'assets/avatars/man1.png',
            ),
            FamilyNode(
              name: 'Son B1-2',
              age: 18,
              description: 'High school student',
              avatarPath: 'assets/avatars/man2.png',
            ),
          ],
        ),
      ],
      
    ),
  ],
);
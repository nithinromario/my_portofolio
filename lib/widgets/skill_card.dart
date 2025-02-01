import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ProficiencyLevel {
  beginner,
  intermediate,
  advanced
}

class SkillCard extends StatelessWidget {
  final String skillName;
  final IconData icon;
  final ProficiencyLevel proficiency;

  const SkillCard({
    super.key,
    required this.skillName,
    required this.icon,
    required this.proficiency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              skillName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            _buildProficiencyIndicator(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProficiencyIndicator(BuildContext context) {
    int filledBars;
    switch (proficiency) {
      case ProficiencyLevel.beginner:
        filledBars = 1;
        break;
      case ProficiencyLevel.intermediate:
        filledBars = 2;
        break;
      case ProficiencyLevel.advanced:
        filledBars = 3;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 30,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index < filledBars 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
} 
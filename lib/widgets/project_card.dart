import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    this.githubLink,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: Card(
          elevation: isHovered ? 8 : 4,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    if (widget.githubLink != null)
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.github),
                        onPressed: () => _launchURL(widget.githubLink!),
                        tooltip: 'View on GitHub',
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.technologies.map((tech) => Chip(
                    label: Text(tech),
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    side: BorderSide.none,
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
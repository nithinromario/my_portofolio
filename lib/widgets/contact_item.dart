import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isHovered ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: TextStyle(
                  color: isHovered ? Colors.blue : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Verify URL launcher implementation
void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    print('Could not launch $url');
  }
} 
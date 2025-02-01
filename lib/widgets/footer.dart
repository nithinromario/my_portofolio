import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                icon: FontAwesomeIcons.github,
                onPressed: () => _launchURL('https://github.com/nithinromario'),
                tooltip: 'GitHub',
              ),
              const SizedBox(width: 20),
              SocialButton(
                icon: FontAwesomeIcons.envelope,
                onPressed: () => _launchURL('mailto:nithinromario456@gmail.com'),
                tooltip: 'Email',
              ),
              const SizedBox(width: 20),
              SocialButton(
                icon: FontAwesomeIcons.phone,
                onPressed: () => _launchURL('tel:+916380222658'),
                tooltip: 'Call',
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2024 Nithin A. All rights reserved.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          ScrollToTopButton(),
        ],
      ),
    );
  }
}

class SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: isHovered ? Colors.blue : Colors.white,
            size: 24,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}

class ScrollToTopButton extends StatefulWidget {
  const ScrollToTopButton({super.key});

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
        child: FloatingActionButton(
          mini: true,
          onPressed: () {
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: isHovered ? Colors.blue : Colors.blue.withOpacity(0.8),
          child: const Icon(Icons.arrow_upward, size: 20),
        ),
      ),
    );
  }
} 
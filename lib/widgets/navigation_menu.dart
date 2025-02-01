import 'package:flutter/material.dart';
import 'package:my_portofolio/services/scroll_service.dart';

class NavigationMenu extends StatelessWidget {
  final bool isDesktop;
  
  const NavigationMenu({
    super.key,
    this.isDesktop = true,
  });

  @override
  Widget build(BuildContext context) {
    return isDesktop ? const DesktopMenu() : const MobileMenu();
  }
}

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).cardColor.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NavItem(
            title: 'Home',
            onTap: () => _scrollToSection(context, 'home'),
          ),
          NavItem(
            title: 'Skills',
            onTap: () => _scrollToSection(context, 'skills'),
          ),
          NavItem(
            title: 'Experience',
            onTap: () => _scrollToSection(context, 'experience'),
          ),
          NavItem(
            title: 'Projects',
            onTap: () => _scrollToSection(context, 'projects'),
          ),
          NavItem(
            title: 'Education',
            onTap: () => _scrollToSection(context, 'education'),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(BuildContext context, String section) {
    ScrollService.scrollToSection(section);
  }
}

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isHovered ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: isHovered ? Colors.blue : Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
} 
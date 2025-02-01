import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portofolio/widgets/animated_widgets.dart';
import 'package:my_portofolio/widgets/contact_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portofolio/widgets/skill_card.dart';
import 'package:my_portofolio/widgets/education_card.dart';
import 'package:my_portofolio/widgets/footer.dart';
import 'package:my_portofolio/widgets/project_card.dart';
import 'package:my_portofolio/widgets/experience_card.dart';
import 'package:my_portofolio/widgets/navigation_menu.dart';
import 'package:my_portofolio/services/scroll_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(key: ScrollService.sectionKeys['home']),
            BioSection(key: ScrollService.sectionKeys['bio']),
            SkillsSection(key: ScrollService.sectionKeys['skills']),
            ExperienceSection(key: ScrollService.sectionKeys['experience']),
            ProjectsSection(key: ScrollService.sectionKeys['projects']),
            EducationSection(key: ScrollService.sectionKeys['education']),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SlideInText(
            text: 'Nithin A',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const SlideInText(
            text: 'Flutter Developer / App Developer',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactItem(
                icon: Icons.email,
                text: 'nithinromario456@gmail.com',
                onTap: () => _launchURL('mailto:nithinromario456@gmail.com'),
              ),
              const SizedBox(width: 20),
              ContactItem(
                icon: Icons.phone,
                text: '+91 6380222658',
                onTap: () => _launchURL('tel:+916380222658'),
              ),
              const SizedBox(width: 20),
              ContactItem(
                icon: Icons.code,
                text: 'GitHub',
                onTap: () => _launchURL('https://github.com/nithinromario'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class BioSection extends StatelessWidget {
  const BioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: FadeInWidget(
        child: Column(
          children: [
            Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'I am a passionate Flutter Developer and Full Stack Java Developer with a keen interest in creating innovative digital solutions. '
              'Currently pursuing my B.E. in Computer Science Engineering, I combine my academic knowledge with hands-on experience in mobile and web development.\n\n'
              'My expertise includes developing cross-platform applications using Flutter, building robust backend systems with Java Spring Boot, '
              'and working with various databases including MongoDB and Redis. I have a strong foundation in software architecture and clean code practices.\n\n'
              'I am particularly interested in creating user-centric applications that not only solve real-world problems but also provide an exceptional user experience.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              FadeInWidget(
                child: const SkillCard(
                  skillName: 'Flutter',
                  icon: FontAwesomeIcons.flutter,
                  proficiency: ProficiencyLevel.advanced,
                ),
              ),
              FadeInWidget(
                child: const SkillCard(
                  skillName: 'Dart',
                  icon: FontAwesomeIcons.code,
                  proficiency: ProficiencyLevel.advanced,
                ),
              ),
              FadeInWidget(
                child: const SkillCard(
                  skillName: 'JavaScript',
                  icon: FontAwesomeIcons.js,
                  proficiency: ProficiencyLevel.intermediate,
                ),
              ),
              FadeInWidget(
                child: const SkillCard(
                  skillName: 'Java',
                  icon: FontAwesomeIcons.java,
                  proficiency: ProficiencyLevel.advanced,
                ),
              ),
              FadeInWidget(
                child: const SkillCard(
                  skillName: 'SQL',
                  icon: FontAwesomeIcons.database,
                  proficiency: ProficiencyLevel.intermediate,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: FadeInWidget(
              child: const ExperienceCard(
                title: 'Full Stack Java Developer Intern',
                company: 'Shiash Info Solutions',
                duration: 'June 2024 - December 2024',
                responsibilities: [
                  'Developed and maintained RESTful APIs using Java Spring Boot for the School Management System',
                  'Implemented complex database architectures using MongoDB and Redis for efficient data management',
                  'Created responsive mobile applications using Flutter with clean architecture principles',
                  'Designed and implemented secure authentication systems using JWT and role-based access control',
                  'Collaborated with cross-functional teams using Git for version control and Agile methodologies',
                ],
                isLeft: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: FadeInWidget(
              child: const EducationCard(
                degree: 'B.E. in Computer Science Engineering',
                university: "Stella Mary's College of Engineering",
                duration: '2020 - 2024',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: FadeInWidget(
              child: const EducationCard(
                degree: 'Higher Secondary Education',
                university: 'Child Jesus Matric HR SEC School',
                duration: '2019 - 2020',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              FadeInWidget(
                child: const ProjectCard(
                  title: 'School Management System API',
                  description: 'A comprehensive backend API for managing educational institutions:\n\n'
                      '• Implemented secure user authentication using JWT tokens\n'
                      '• Created RESTful endpoints for student enrollment, attendance, and grade management\n'
                      '• Designed database schema in MongoDB for efficient data storage\n'
                      '• Integrated Redis caching to improve API response times\n'
                      '• Implemented role-based access control for administrators, teachers, and students',
                  technologies: [
                    'Java',
                    'Spring Boot',
                    'MongoDB',
                    'Redis',
                    'JWT',
                    'REST API'
                  ],
                  githubLink: 'https://github.com/nithinromario/SchoolManagementAPI',
                ),
              ),
              FadeInWidget(
                child: const ProjectCard(
                  title: 'Real-Time Location Sharing App',
                  description: 'A Flutter-based mobile application for location sharing:\n\n'
                      '• Developed real-time location tracking using Firebase and Google Maps API\n'
                      '• Implemented user authentication with email and Google Sign-In\n'
                      '• Created features for creating and joining location sharing groups\n'
                      '• Added location history tracking and route visualization\n'
                      '• Implemented push notifications for location updates and alerts',
                  technologies: [
                    'Flutter',
                    'Firebase',
                    'Google Maps API',
                    'Dart',
                    'Firebase Auth',
                    'Cloud Firestore'
                  ],
                  githubLink: 'https://github.com/nithinromario/LocationSharingApp',
                ),
              ),
              FadeInWidget(
                child: const ProjectCard(
                  title: 'Portfolio Website',
                  description: 'A modern, responsive portfolio website built with Flutter Web:\n\n'
                      '• Designed and implemented a responsive layout for all screen sizes\n'
                      '• Created smooth animations and transitions for enhanced user experience\n'
                      '• Implemented dark theme with custom color schemes\n'
                      '• Added section navigation with smooth scrolling\n'
                      '• Optimized performance and loading times for web deployment',
                  technologies: [
                    'Flutter Web',
                    'Dart',
                    'HTML',
                    'CSS',
                    'JavaScript',
                    'Responsive Design'
                  ],
                  githubLink: 'https://github.com/nithinromario/portfolio',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                child: Text('NA'),
              ),
              SizedBox(height: 10),
              Text('Nithin A'),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => _scrollToSection(context, 'home'),
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('Skills'),
          onTap: () => _scrollToSection(context, 'skills'),
        ),
        ListTile(
          leading: const Icon(Icons.work),
          title: const Text('Experience'),
          onTap: () => _scrollToSection(context, 'experience'),
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('Projects'),
          onTap: () => _scrollToSection(context, 'projects'),
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Education'),
          onTap: () => _scrollToSection(context, 'education'),
        ),
      ],
    );
  }

  void _scrollToSection(BuildContext context, String section) {
    Navigator.pop(context);
    // Implementation will be added when we set up scroll controllers
  }
} 
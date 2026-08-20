import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Top App Bar
      appBar: AppBar(
        title: const Text(
          'Contact & Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      // 2. Main Body - Scrollable List
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header Section
          const Text(
            'How can we help you?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Explore our support services and help topics below.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),

          // --- Service 1: Help Center ---
          _buildServiceCard(
            context: context,
            icon: Icons.help_outline,
            iconColor: Colors.blue,
            title: 'Help Center',
            description: 'Get instant answers to frequently asked questions.',
          ),
          const SizedBox(height: 12),

          // --- Service 2: Contact Us ---
          _buildServiceCard(
            context: context,
            icon: Icons.mail_outline,
            iconColor: Colors.pink,
            title: 'Contact Us',
            description: 'Send an email or message directly to our support team.',
          ),
          const SizedBox(height: 12),

          // --- Service 3: Send Feedback ---
          _buildServiceCard(
            context: context,
            icon: Icons.feedback_outlined,
            iconColor: Colors.purple,
            title: 'Send Feedback',
            description: 'Share your suggestions to help us improve the app.',
          ),
          const SizedBox(height: 12),

          // --- Service 4: Report a Problem ---
          _buildServiceCard(
            context: context,
            icon: Icons.report_problem_outlined,
            iconColor: Colors.red,
            title: 'Report a Problem',
            description: 'Let us know if you encounter any bugs or errors.',
          ),
          const SizedBox(height: 12),

          // --- Service 5: Privacy Policy ---
          _buildServiceCard(
            context: context,
            icon: Icons.lock_outline,
            iconColor: Colors.indigo,
            title: 'Privacy Policy',
            description: 'Learn how we protect and manage your personal data.',
          ),
          const SizedBox(height: 12),

          // --- Service 6: Terms of Service ---
          _buildServiceCard(
            context: context,
            icon: Icons.article_outlined,
            iconColor: Colors.teal,
            title: 'Terms of Service',
            description: 'Read the rules and terms for using this platform.',
          ),
        ],
      ),
    );
  }

  // --- Helper Method to Create a Service Card ---
  // Each card contains: 1. Icon, 2. Title, 3. Description, 4. Button/Arrow
  Widget _buildServiceCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            // 1. Icon inside a colored box
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 14),

            // 2. Title & Short Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // 3. Arrow Button (Interactive UI feedback)
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onPressed: () {
                // Show simple feedback popup on tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title tapped!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

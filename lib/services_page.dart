import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final Color iconColor;
  final String name;
  final String description;

  const ServiceItem({
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.description,
  });
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  static const List<ServiceItem> services = [
    ServiceItem(
      icon: Icons.support_agent_outlined,
      iconColor: Color(0xFF0095F6),
      name: 'Help Center',
      description: 'Get answers to common questions and support topics.',
    ),
    ServiceItem(
      icon: Icons.mail_outline,
      iconColor: Color(0xFFE1306C),
      name: 'Contact Us',
      description: 'Reach out to our team for assistance or inquiries.',
    ),
    ServiceItem(
      icon: Icons.feedback_outlined,
      iconColor: Color(0xFF833AB4),
      name: 'Send Feedback',
      description: 'Share your ideas to help us improve the app experience.',
    ),
    ServiceItem(
      icon: Icons.report_outlined,
      iconColor: Color(0xFFFD1D1D),
      name: 'Report a Problem',
      description: 'Let us know if something is not working as expected.',
    ),
    ServiceItem(
      icon: Icons.privacy_tip_outlined,
      iconColor: Color(0xFF5851DB),
      name: 'Privacy Policy',
      description: 'Learn how we collect, use, and protect your data.',
    ),
    ServiceItem(
      icon: Icons.description_outlined,
      iconColor: Color(0xFF262626),
      name: 'Terms of Service',
      description: 'Review the rules and guidelines for using this app.',
    ),
  ];

  void _onServiceTap(BuildContext context, ServiceItem service) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You tapped: ${service.name}'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.5,
                centerTitle: true,
                title: const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.3,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'How can we help?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Explore support options and app information.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: services.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return _ServiceCard(
                          service: service,
                          onTap: () => _onServiceTap(context, service),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.service,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFAFAFA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: service.iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  service.icon,
                  color: service.iconColor,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

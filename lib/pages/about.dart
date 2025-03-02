import 'package:flutter/material.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/sidebar.dart';

class About extends StatelessWidget {
  About({super.key});

  final List<Map<String, dynamic>> SystemItems = [
    {
      'icon': Icons.calendar_month,
      'title': "Leave Management",
      'text':
          "Streamlined leave application process with automated tracking and approvals",
    },
    {
      'icon': Icons.military_tech,
      'title': "OD Management",
      'text':
          "Efficient handling of On-Duty requests for academic and professional activities",
    },
    {
      'icon': Icons.person,
      'title': "Defaulter Management",
      'text': "Systematic tracking of attendance and disciplinary records",
    },
    {
      'icon': Icons.fact_check,
      'title': "Real-time Processing",
      'text': "Instant updates on request status and approvals",
    },
    {
      'icon': Icons.notifications_none,
      'title': "Smart Notifications",
      'text': "Automated alerts for status changes and pending actions",
    },
    {
      'icon': Icons.analytics,
      'title': "Analytics & Reports",
      'text': "Comprehensive reports and insights for better decision-making",
    }
  ];

  final List<Map<String, dynamic>> GridItems = [
    {
      'icon': Icons.analytics,
      'title': "Analytics Dashboard",
      'text': "Real-time insights into academic performance",
    },
    {
      'icon': Icons.notifications_none,
      'title': "Smart Notifications",
      'text': "Stay updated with instant smart alert notifications",
    },
    {
      'icon': Icons.calendar_month,
      'title': "Leave Management",
      'text': "Streamlined absence tracking",
    },
    {
      'icon': Icons.person,
      'title': "Attendance System",
      'text': "Automated attendance monitoring",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 35),
          Container(
            width: double.infinity,
            child: Text(
              'Comprehensive Management System',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'Experience a unified platform that integrates various academic processes into one seamless system.',
              style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          Column(
            children: SystemItems.map((item) {
              final IconData icon = item['icon'] ?? Icons.error;
              final String title = item['title']?.toString() ?? 'No title';
              final String text = item['text']?.toString() ?? 'No description';

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 219, 237, 250),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: Colors.blue,
                          size: 36,
                        ),
                        SizedBox(height: 12),
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          text,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Text(
              'Additional Features',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'Explore more capabilities designed to enhance your academic experience.',
              style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  for (int i = 0; i < GridItems.length; i += 2)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildGridCard(GridItems[i]),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: i + 1 < GridItems.length
                                ? _buildGridCard(GridItems[i + 1])
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          Container(
            width: double.infinity,
            child: Text(
              'Transform Your Academic Experience',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'Our integrated platform revolutionizes academic management with cutting-edge features designed specifically for VCET ecosystem. Experience seamless coordination between students, faculty, and administration.',
              style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 4,
                    color: const Color.fromARGB(255, 219, 237, 250),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.military_tech,
                            color: Colors.blue,
                            size: 36,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Excellence',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Promoting academic achievement',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 4,
                    color: const Color.fromRGBO(186, 255, 201, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.fact_check,
                            color: Colors.green,
                            size: 36,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Efficiency',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Streamlined processes',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridCard(Map<String, dynamic> item) {
    final IconData icon = item['icon'] ?? Icons.error;
    final String title = item['title']?.toString() ?? 'No title';
    final String text = item['text']?.toString() ?? 'No description';

    return IntrinsicHeight(
      child: Card(
        elevation: 4,
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 36,
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

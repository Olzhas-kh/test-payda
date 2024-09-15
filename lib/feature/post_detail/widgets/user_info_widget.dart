import 'package:flutter/material.dart';
import 'package:test_payda/core/extensions/num_extension.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String company;
  final String email;
  final String phone;
  
  const UserInfoWidget({
    super.key,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: isDarkMode ? Colors.indigo.shade700 : Colors.indigo.shade200,
                child: const Icon(Icons.person, color: Colors.white, size: 24),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.indigo.shade400 : Colors.indigo.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          16.height,
          Row(
            children: [
              const Icon(Icons.email, size: 16, color: Colors.indigo),
              8.width,
              Text(
                email,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              const Icon(Icons.phone, size: 16, color: Colors.indigo),
              8.width,
              Text(
                phone,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

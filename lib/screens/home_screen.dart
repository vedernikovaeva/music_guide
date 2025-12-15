import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade50,
              Colors.blue.shade50,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Icon(
                Icons.music_note,
                size: 100,
                color: Colors.purple,
              ),
              const SizedBox(height: 20),
              const Text(
                'Довідник меломана',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ваша особиста музична колекція',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 20,
                  childAspectRatio: 3,
                  children: [
                    _buildMenuCard(
                      context,
                      icon: Icons.people,
                      title: 'Виконавці',
                      subtitle: 'База груп і виконавців',
                      color: Colors.purple,
                      onTap: () => Navigator.pushNamed(context, '/artists'),
                    ),
                    _buildMenuCard(
                      context,
                      icon: Icons.music_note,
                      title: 'Пісні',
                      subtitle: 'База пісень',
                      color: Colors.blue,
                      onTap: () => Navigator.pushNamed(context, '/songs'),
                    ),
                    _buildMenuCard(
                      context,
                      icon: Icons.album,
                      title: 'Альбоми',
                      subtitle: 'База дисків з піснями',
                      color: Colors.green,
                      onTap: () => Navigator.pushNamed(context, '/albums'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
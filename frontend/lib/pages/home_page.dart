import 'package:flutter/material.dart';
import 'package:wildguard/constants/app_assets.dart';
import 'package:wildguard/constants/app_colors.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/pages/insights_page.dart';
import 'package:wildguard/pages/predict_page.dart';
import 'package:wildguard/pages/retrain_page.dart';
import 'package:wildguard/widgets/bottom_nav_bar.dart';
import 'package:wildguard/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const PredictPage(),
    const RetrainPage(),
    const InsightsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WildGuard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'WildGuard',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 African Leadership University',
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              AppAssets.logo,
              height: 150,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Protect Wildlife with AI',
            style: headlineLarge.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 15),
          Text(
            'WildGuard helps identify endangered species to support conservation efforts worldwide.',
            style: bodyLarge,
          ),
          const SizedBox(height: 30),
          _buildFeatureCard(
            context,
            icon: Icons.camera_alt,
            title: 'Instant Classification',
            description:
                'Upload an animal photo to check its endangered status',
            color: AppColors.primaryLight,
          ),
          const SizedBox(height: 15),
          _buildFeatureCard(
            context,
            icon: Icons.school,
            title: 'Improve the Model',
            description: 'Contribute by uploading labeled data for retraining',
            color: AppColors.accent,
          ),
          const SizedBox(height: 15),
          _buildFeatureCard(
            context,
            icon: Icons.insights,
            title: 'Model Insights',
            description: 'View performance metrics and visualizations',
            color: AppColors.warning,
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'GET STARTED',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

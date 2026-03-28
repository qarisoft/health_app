import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/home/ui/pages/p.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthStatsWidget extends ConsumerStatefulWidget {
  const HealthStatsWidget({super.key});

  @override
  ConsumerState<HealthStatsWidget> createState() => _HealthStatsWidgetState();
}

class _HealthStatsWidgetState extends ConsumerState<HealthStatsWidget> {
  List<Map<String, dynamic>> recentActivities = [
    {'time': '08:30 AM', 'activity': 'Morning Run', 'duration': '30 min'},
    {'time': '12:00 PM', 'activity': 'Lunch Workout', 'duration': '20 min'},
    {'time': '06:00 PM', 'activity': 'Evening Walk', 'duration': '45 min'},
    {'time': '10:00 PM', 'activity': 'Meditation', 'duration': '15 min'},
  ];

  @override
  Widget build(BuildContext context) {
    final healthData = ref.watch(healthDataProvider);
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Steps
          _buildStatItem(
            icon: Icons.directions_walk,
            title: 'Steps',
            value: '${healthData['steps']}',
            target: 10000,
            color: Color(0xFF4A6FFF),
            unit: 'steps',
          ),
          SizedBox(height: 16),

          // Heart Rate
          _buildStatItem(
            icon: Icons.favorite,
            title: 'Heart Rate',
            value: '${healthData['heartRate']}',
            target: 80,
            color: Color(0xFFFF6B6B),
            unit: 'bpm',
          ),
          SizedBox(height: 16),

          // Sleep
          _buildStatItem(
            icon: Icons.nightlight_round,
            title: 'Sleep',
            value: '${healthData['sleep']}',
            target: 8,
            color: Color(0xFF9B51E0),
            unit: 'hours',
          ),
          SizedBox(height: 16),

          // Water
          _buildStatItem(
            icon: Icons.local_drink,
            title: 'Water',
            value: '${healthData['water']}',
            target: 2.5,
            color: Color(0xFF2D9CDB),
            unit: 'L',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String title,
    required String value,
    required double target,
    required Color color,
    required String unit,
  }) {
    double progress = double.parse(value) / target;
    if (progress > 1) progress = 1;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8A)),
              ),
              SizedBox(height: 4),
              Text(
                '$value $unit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),
        ),
        CircularPercentIndicator(
          radius: 25,
          lineWidth: 4,
          percent: progress,
          center: Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.1),
        ),
      ],
    );
  }
}

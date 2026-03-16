import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends ConsumerState<MyHomePage> {
  List<Map<String, dynamic>> recentActivities = [
    {'time': '08:30 AM', 'activity': 'Morning Run', 'duration': '30 min'},
    {'time': '12:00 PM', 'activity': 'Lunch Workout', 'duration': '20 min'},
    {'time': '06:00 PM', 'activity': 'Evening Walk', 'duration': '45 min'},
    {'time': '10:00 PM', 'activity': 'Meditation', 'duration': '15 min'},
  ];
  Map<String, dynamic> healthData = {
    'steps': 8423,
    'calories': 420,
    'heartRate': 72,
    'sleep': 7.2,
    'water': 1.8,
    'weight': 68.5,
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              _buildAppBar(),

              // Greeting and Date
              _buildGreeting(),

              // Health Stats Cards
              _buildHealthStats(),

              // Recent Activities
              _buildRecentActivities(),

              // Health Tips
              _buildHealthTips(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  // Helper functions
  IconData _getActivityIcon(String activity) {
    switch (activity) {
      case 'Morning Run':
        return Icons.directions_run;
      case 'Lunch Workout':
        return Icons.fitness_center;
      case 'Evening Walk':
        return Icons.directions_walk;
      case 'Meditation':
        return Icons.self_improvement;
      default:
        return Icons.sports;
    }
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

  Widget _buildRecentActivities() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF4A6FFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...recentActivities.map((activity) => _buildActivityItem(activity)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF4A6FFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getActivityIcon(activity['activity']),
              color: Color(0xFF4A6FFF),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['activity'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  activity['time'],
                  style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8A)),
                ),
              ],
            ),
          ),
          Text(
            activity['duration'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4A6FFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 22,
            // backgroundImage: NetworkImage(
            //     'https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80'),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Color(0xFF4A4A4A),
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning, Alex!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${DateTime.now().day} ${_getMonthName(DateTime.now().month)} ${DateTime.now().year}',
            style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8A)),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStats() {
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

  Widget _buildHealthTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Tips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4A6FFF), Color.fromARGB(255, 28, 15, 40)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay Hydrated',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Drink at least 8 glasses of water daily to maintain optimal body function',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.local_drink, color: Colors.white, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

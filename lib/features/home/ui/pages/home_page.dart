import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/functions.dart';
import 'package:intl/intl.dart';

// Adjust these imports to match your actual file structure
import '../../data/providers/dashboard_summary.dart'; // Adjust path to where your @riverpod provider is
import '../../data/responses/dashboard_summary.dart'; // Adjust path to your models

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Watch your generated riverpod provider
    final dashboardAsyncValue = ref.watch(patientDashboardSummaryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light clinical background
      body: SafeArea(
        child: dashboardAsyncValue.when(
          data: (pageResponse) {
            // Unwrap the actual data from your BaseResponse wrapper
            final summaryData = pageResponse.data;

            if (summaryData == null) {
              return _buildEmptyState();
            }
            // xlog(summaryData.toJson());

            return _buildDashboardContent(summaryData);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(context.tr.failedToLoadDashboard),
                TextButton(
                  onPressed: () =>
                      ref.invalidate(patientDashboardSummaryProvider),
                  child: Text(context.tr.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardContent(DashboardSummaryResponse data) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(patientDashboardSummaryProvider),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(data.profileStatus),
            _buildGreeting(),

            // Show Profile Warning if not initialized
            if (data.profileStatus?.isInitialized == false)
              _buildProfileWarningTip(),

            if (data.statistics != null) _buildStatisticsGrid(data.statistics!),

            if (data.latestDiagnosis != null)
              _buildLatestDiagnosis(data.latestDiagnosis!),

            if (data.latestPrescription != null)
              _buildLatestPrescription(data.latestPrescription!),
          ],
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildEmptyState() {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(patientDashboardSummaryProvider),
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Center(
            child: Text(
              context.tr.noDashboardData,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(ProfileStatus? profile) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF4A6FFF),
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              // Show blood type if profile is initialized
              if (profile?.isInitialized == true)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${context.tr.bloodType}: ${_getBloodType(profile!.bloodType)}',
                        style: TextStyle(

                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(
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
            context.tr.loginTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now()),
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF8A8A8A),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatisticsGrid(DashboardStatics stats) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr.overview,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.tr.visits,
                  stats.totalVisits.toString(),
                  Icons.medical_services,
                  const Color(0xFF4A6FFF),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context.tr.doctors,
                  stats.uniqueDoctors.toString(),
                  Icons.people_outline,
                  const Color(0xFF9B51E0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.tr.prescriptions,
                  stats.totalPrescriptions.toString(),
                  Icons.medication,
                  const Color(0xFF2D9CDB),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context.tr.pending,
                  stats.pendingPrescriptions.toString(),
                  Icons.pending_actions,
                  stats.pendingPrescriptions > 0
                      ? const Color(0xFFFF6B6B)
                      : Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8A8A8A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestDiagnosis(LatestDiagnosis diagnosis) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with a "See History" action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr.latestDiagnosis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to full diagnosis history
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  context.tr.seeHistory,
                  style: const TextStyle(
                    color: Color(0xFF4A6FFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Enhanced Interactive Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // TODO: Navigate to specific diagnosis details
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stylized Medical Icon
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9B51E0).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.medical_information_outlined,
                          color: Color(0xFF9B51E0),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Content Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Date Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                formatDate(diagnosis.date),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Diagnosis Title
                            Text(
                              diagnosis.diagnosis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Doctor Info
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 16,
                                  color: Colors.grey.shade500,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'Dr. ${diagnosis.doctorName}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Trailing Navigation Arrow
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, left: 8.0),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.grey.shade400,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestPrescription(LatestPrescription prescription) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr.activePrescriptions,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4A6FFF), Color(0xFF3354C4)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4A6FFF).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.medication, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${prescription.medicationCount} Medications',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Prescribed by Dr. ${prescription.doctorName}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // Assuming status 0 = pending, 1 = dispensed, etc. Adjust as needed.
                if (prescription.status == 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      context.tr.pending,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileWarningTip() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.orange.shade200),
        ),
        child: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.orange.shade700,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Incomplete Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7A5900), // Darker orange for readability
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Please complete your medical profile for better assistance during emergencies.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8B6B00),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper mapping
  String _getBloodType(int typeCode) {
    switch (typeCode) {
      case 1:
        return 'A+';
      case 2:
        return 'A-';
      case 3:
        return 'B+';
      case 4:
        return 'B-';
      case 5:
        return 'AB+';
      case 6:
        return 'AB-';
      case 7:
        return 'O+';
      case 8:
        return 'O-';
      default:
        return 'N/A';
    }
  }
}

import 'dart:async'; // Added for Timer

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/features/auth/domain/models/auth_state.dart';
import 'package:health_app/features/home/ui/pages/medical_records_page.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/shared/functions.dart';
import 'package:health_app/shared/widgets/app_bar_leading.dart';
import 'package:intl/intl.dart';

// Adjust these imports to match your actual file structure
import '../../data/providers/dashboard_summary.dart';
import '../../data/responses/dashboard_summary.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  // --- Animation Controllers ---
  late ScrollController _carouselScrollController;
  Timer? _carouselTimer;

  // Card dimensions for calculation
  final double _cardWidth = 280.0;
  final double _cardSpacing = 16.0;

  // Sample data for the top horizontal scroll
  final List<Map<String, String>> promoCards = [
    {
      'title': 'Consult a Specialist',
      'subtitle': 'Book online consultations',
      'image': 'assets/images/panar1.jpg',
    },
    {
      'title': 'Emergency Care',
      'subtitle': '24/7 Support & Ambulance',
      'image': 'assets/images/panar2.jpg',
    },
    {
      'title': 'Health Checkups',
      'subtitle': 'Comprehensive body screening',
      'image': 'assets/images/panar3.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _carouselScrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _carouselTimer
        ?.cancel(); // Important: clean up timer to prevent memory leaks
    _carouselScrollController.dispose();
    super.dispose();
  }

  // Logic to auto-move the carousel every 3.5 seconds
  void _startAutoScroll() {
    _carouselTimer = Timer.periodic(const Duration(milliseconds: 3500), (
      timer,
    ) {
      if (_carouselScrollController.hasClients) {
        double maxScroll = _carouselScrollController.position.maxScrollExtent;
        double currentScroll = _carouselScrollController.position.pixels;
        double scrollDelta = _cardWidth + _cardSpacing;

        double nextScroll = currentScroll + scrollDelta;

        // If we reach or exceed the end, jump smoothly back to the start
        if (nextScroll > maxScroll + (_cardWidth / 2)) {
          nextScroll = 0;
        }

        _carouselScrollController.animateTo(
          nextScroll,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref
        .watch(authRecordStateProvider)
        .whenOrNull(auth: (a) => a)
        ?.userId;
    final dashboardAsyncValue = ref.watch(
      patientDashboardSummaryProvider(userId: userId ?? 0),
    );

    return SizedBox(
      // backgroundColor: const Color(0xFFF8F9FA),
      child: dashboardAsyncValue.when(
        data: (pageResponse) {
          final summaryData = pageResponse.data;

          if (summaryData == null) {
            return _buildEmptyState();
          }

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

            // Horizontal Image Scroll
            _buildHorizontalPromoScroll(),

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

  Widget _buildHorizontalPromoScroll() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        controller: _carouselScrollController,
        // Attached the controller here
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: promoCards.length,
        separatorBuilder: (context, index) => SizedBox(width: _cardSpacing),
        itemBuilder: (context, index) {
          final card = promoCards[index];
          return Container(
            width: _cardWidth,
            // Use the variable to ensure calculation accuracy
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(card['image']!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Dark gradient overlay for text readability
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
                // Text Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        card['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        card['subtitle']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                // Interactive Ripple Effect
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        // TODO: Add navigation logic based on card clicked
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

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
            // spacing: 4,
            children: [
              AppBarReturnButton(),
              SizedBox(width: 4),
              const CircleAvatar(
                radius: 24,
                // backgroundColor: Color(0xFF4A6FFF),
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
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
          const SizedBox(height: 24),
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
                  context.tr.totalPrescriptions,
                  // Use context.tr.prescriptions if available
                  stats.totalPrescriptions.toString(),
                  Icons.medication,
                  const Color(0xFF2D9CDB),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context.tr.prescriptions,
                  // Use context.tr.pending if available
                  stats.pendingPrescriptions.toString(),
                  Icons.pending_actions,
                  stats.pendingPrescriptions > 0
                      ? const Color(0xFFFF6B6B)
                      : Colors.green,
                  hint: context.tr.pendingPrescriptions,
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
    Color color, {
    String? hint = '',
  }) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 16),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A8A8A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (hint != null)
                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
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
                onPressed: () {},
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
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                formatDate2(diagnosis.date, locale: 'ar'),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              diagnosis.diagnosis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                            const SizedBox(height: 6),
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
            context.tr.activePrescriptions ?? 'Active Prescription',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
            child: GestureDetector(
              onTap: () {
                // final res = await appRepo.getPatientMedicalRecords();
                // xlog(res);
                // res.whenOrNull(
                //   success: (s) {
                //     xlog(s);
                //   },
                // );
                context.to(PatientMedicalRecordsPage());
                xlog('sssssssssssssssss');
              },
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
                      child: const Text(
                        'Pending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileWarningTip() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 8),
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
                      color: Color(0xFF7A5900),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Please complete your medical profile for better assistance during emergencies.',
                    style: TextStyle(fontSize: 13, color: Color(0xFF8B6B00)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBloodType(int typeCode) {
    return typeCode.bloodTypeString();
  }
}

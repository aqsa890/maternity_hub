import 'package:flutter/material.dart';

class DoctorConsultationScreen extends StatefulWidget {
  const DoctorConsultationScreen({super.key});

  @override
  _DoctorConsultationScreenState createState() =>
      _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState extends State<DoctorConsultationScreen> {
  String _selectedShift = 'Morning';

  final Map<String, List<Map<String, String>>> doctors = {
    'Morning': [
      {
        'name': 'Dr. John Doe',
        'qualification': 'MBBS, MD',
        'specialty': 'gynecologist '
      },
      {
        'name': 'Dr. Jane Smith',
        'qualification': 'MBBS, MSc',
        'specialty': 'gynecologist '
      },
    ],
    'Evening': [
      {
        'name': 'Dr. Alex Brown',
        'qualification': 'MBBS, PhD',
        'specialty': 'gynecologist '
      },
      {
        'name': 'Dr. Emily White',
        'qualification': 'MBBS, MS',
        'specialty': 'gynecologist '
      },
    ],
    'Night': [
      {
        'name': 'Dr. Michael Clark',
        'qualification': 'MBBS, DNB',
        'specialty': 'gynecologist '
      },
      {
        'name': 'Dr. Laura Black',
        'qualification': 'MBBS, MD',
        'specialty': 'gynecologist '
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 40),
            _buildShiftDropdown(),
            const SizedBox(height: 40),
            _buildDoctorList(_selectedShift),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF6B5DE6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Consultation',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Heading2',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select a doctor for your consultation',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: 'Heading2',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF6B5DE6),
                  width: 1,
                )),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: DropdownButton<String>(
              value: _selectedShift,
              dropdownColor: Colors.blue[100],
              style: const TextStyle(color: Colors.black, fontSize: 16),
              items: const [
                DropdownMenuItem(value: 'Morning', child: Text('Morning')),
                DropdownMenuItem(value: 'Evening', child: Text('Evening')),
                DropdownMenuItem(value: 'Night', child: Text('Night')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedShift = value!;
                });
              },
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorList(String shift) {
    List<Map<String, String>> shiftDoctors = doctors[shift] ?? [];
    if (shiftDoctors.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'No doctors available for this shift',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: shiftDoctors
              .map((doctor) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: DoctorCard(
                      name: doctor['name']!,
                      qualification: doctor['qualification']!,
                      specialty: doctor['specialty']!,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String qualification;
  final String specialty;

  const DoctorCard({
    required this.name,
    required this.qualification,
    required this.specialty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 240,
        width: 180,
        decoration: BoxDecoration(
          color: const Color(0xFF6B5DE6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                qualification,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                specialty,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

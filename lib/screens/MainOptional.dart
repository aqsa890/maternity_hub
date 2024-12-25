import 'package:flutter/material.dart';
import 'package:meternity_hub/screens/AuthScreen.dart';
import 'package:meternity_hub/screens/chatscreens/consultation.dart';
import 'package:meternity_hub/screens/precaution_screens/options.dart';
import 'package:meternity_hub/screens/schedulescreens/scheduleOPT.dart';
import 'package:meternity_hub/screens/sos_screens/calling_Screen.dart';

class Mainoptional extends StatefulWidget {
  const Mainoptional({super.key});

  @override
  State<Mainoptional> createState() => _MainoptionalState();
}

class _MainoptionalState extends State<Mainoptional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
            )),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Authscreen()));
              },
              child: Icon(Icons.logout, color: Colors.black)),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Image(
              height: 200,
              width: 150,
              image: AssetImage(
                'images/main_logo2.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              'Maternity  HUB',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                fontFamily: 'Heading2',
                color: Color(0xff5a189a),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DoctorConsultationScreen()));
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B5DE6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_services,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B5DE6),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scheduleopt()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'My Schedule',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HealthcareHome()));
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B5DE6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu_book,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Guideline',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CallScreen()));
            },
            child: Container(
              height: 65,
              width: 280,
              decoration: BoxDecoration(
                color: const Color(0xFF6B5DE6).withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_hospital,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Emergency SOS',
                    style: TextStyle(
                      fontFamily: 'Poto',
                      fontSize: 18,
                      color: Colors.white,
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
}

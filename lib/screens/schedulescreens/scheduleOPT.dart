import 'package:flutter/material.dart';
import 'package:meternity_hub/screens/MainOptional.dart';
import 'package:meternity_hub/screens/schedulescreens/add_appointment.dart';

class Scheduleopt extends StatelessWidget {
  const Scheduleopt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mainoptional()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Image(
                  height: 200,
                  width: 150,
                  image: const AssetImage('images/main_logo2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Text(
                'Maternity HUB',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Heading2',
                  color: Color(0xff5a189a),
                ),
              ),
            ),
            Container(
              width: 290,
              child: const Divider(
                color: Colors.black,
                thickness: 0.7,
              ),
            ),
            const SizedBox(height: 40),

            // Add Appointment Container
            buildOptionContainer(
              icon: Icons.calendar_today,
              label: 'Add Appointment',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAppointment(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Reset Container with Notification
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 75,
                width: 310,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF6B5DE6),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.lock_reset,
                      color: Color(0xFF6B5DE6),
                      size: 30,
                    ),
                    Text(
                      'Reset',
                      style: TextStyle(
                        color: Color(0xFF6B5DE6),
                        fontSize: 23,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionContainer({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: 310,
        decoration: BoxDecoration(
          color: const Color(0xFF6B5DE6),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

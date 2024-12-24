import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meternity_hub/database.service/database_logic.dart';
import 'package:meternity_hub/notification/notification_service.dart';
import 'package:meternity_hub/screens/schedulescreens/scheduleOPT.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  List<Map<String, dynamic>> _appointments = [];
  String _selectedStatus = 'Upcoming'; // Tracks the selected tab status
  final DatabaseService _dbService =
      DatabaseService(); // Database service instance

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  // Load appointments from Firebase
  void _loadAppointments() async {
    List<Map<String, dynamic>> appointments =
        await _dbService.getAppointments();
    setState(() {
      _appointments = appointments;
    });
  }

  // Add new appointment
  void _addAppointment() async {
    TextEditingController doctorNameController = TextEditingController();

    // Show dialog to enter doctor name
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Enter Doctor Name',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: TextField(
            controller: doctorNameController,
            decoration: const InputDecoration(
              hintText: 'Doctor Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                if (doctorNameController.text.isNotEmpty) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );

    if (doctorNameController.text.isEmpty) return;

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) return;

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime == null) return;

    DateTime appointmentDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    // Create appointment object
    Map<String, dynamic> newAppointment = {
      'doctorName': doctorNameController.text.isNotEmpty
          ? doctorNameController.text
          : "No Name Provided", // Prevent null values
      'date': DateFormat('dd MMM yyyy').format(selectedDate),
      'time': selectedTime.format(context),
      'status': 'Upcoming', // Default status
    };

    // Add to Firebase database
    String appointmentKey = await _dbService.addAppointment(newAppointment);

    // Reload appointments from Firebase
    _loadAppointments();

    // Schedule the notification for the appointment
    await LocalNotifications.scheduleNotification(
      title: 'Appointment with Dr. ${doctorNameController.text}',
      body: 'CheckUp reminder.',
      payload: 'Appointment Notification',
      scheduledTime: appointmentDateTime,
      appointmentId: int.parse(appointmentKey), // Use the key as the ID
    );
  }

  // Delete appointment
  void _deleteAppointment(int index) async {
    String appointmentKey = _appointments[index]['key'];

    // Delete from Firebase
    await _dbService.deleteAppointment(appointmentKey);

    // Reload appointments from Firebase
    _loadAppointments();

    // Cancel notification when an appointment is deleted
    LocalNotifications.cancelNotification(appointmentId: index);
  }

  // Filter appointments based on the selected status
  List<Map<String, dynamic>> get filteredAppointments {
    return _appointments.where((appointment) {
      return appointment['status'] == _selectedStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      appBar: AppBar(
        elevation: 4,
        backgroundColor: const Color(0xFF6B5DE6), // Purple color
        title: const Text(
          'My Appointments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Scheduleopt()));
            }),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab (only "Upcoming" now)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab('Upcoming', _selectedStatus == 'Upcoming'),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Appointments List
          Expanded(
            child: filteredAppointments.isEmpty
                ? Center(
                    child: Text(
                      'No Appointments Yet!',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = filteredAppointments[index];

                      // Handle null values in appointment data
                      String doctorName =
                          appointment['doctorName'] ?? 'No Name';
                      String date = appointment['date'] ?? 'Unknown Date';
                      String time = appointment['time'] ?? 'Unknown Time';

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF6B5DE6),
                              child:
                                  const Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(
                              doctorName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              '$date at $time',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: PopupMenuButton<String>(
                              itemBuilder: (context) => [
                                PopupMenuItem<String>(
                                  onTap: () {
                                    _deleteAppointment(index);
                                  },
                                  value: 'Delete',
                                  child: Text('Delete',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAppointment, // Function to add appointment
        backgroundColor: const Color(0xFF6B5DE6),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Function to build tab (only for "Upcoming" now)
  Widget _buildTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStatus = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6B5DE6) : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

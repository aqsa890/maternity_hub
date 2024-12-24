import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  // Method to add a new appointment and return the key
  Future<String> addAppointment(Map<String, dynamic> appointmentData) async {
    // Get a reference to the appointments collection
    DatabaseReference appointmentsRef = _db.ref().child('appointments');

    // Create a new appointment entry with a unique key
    DatabaseReference newAppointmentRef = appointmentsRef.push();

    // Set the data for the new appointment
    await newAppointmentRef.set(appointmentData);

    // Return the unique key of the new appointment
    return newAppointmentRef.key!; // This is the 'appointmentKey'
  }

  // Get all appointments from the database
  Future<List<Map<String, dynamic>>> getAppointments() async {
    DatabaseReference appointmentsRef = _db.ref('appointments');
    DataSnapshot snapshot = await appointmentsRef.get();
    if (snapshot.exists) {
      Map<String, dynamic> data = Map.from(snapshot.value as Map);
      return data.values
          .map((appointment) => Map<String, dynamic>.from(appointment))
          .toList();
    } else {
      return [];
    }
  }

  // Update appointment in the database
  Future<void> updateAppointment(
      String key, Map<String, dynamic> updatedAppointment) async {
    DatabaseReference appointmentRef = _db.ref('appointments/$key');
    await appointmentRef.update(updatedAppointment);
  }

  // Delete appointment from the database
  Future<void> deleteAppointment(String key) async {
    DatabaseReference appointmentRef = _db.ref('appointments/$key');
    await appointmentRef.remove();
  }
}

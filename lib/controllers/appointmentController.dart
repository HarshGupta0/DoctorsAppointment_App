import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  final appointmentDayController = TextEditingController();
  final appointmentTimeController = TextEditingController();
  final appointmentNumberController = TextEditingController();
  final appointmentNameController = TextEditingController();
  final appointmentMessageController = TextEditingController();

  // Observable to hold the list of appointments
  var appointments = <DocumentSnapshot>[].obs;

  // Function to book an appointment
  Future<void> bookAppointment(String docId, String docName, context) async {
    try {
      isLoading(true);
      final userId = FirebaseAuth.instance.currentUser?.uid; // Get current user ID
      if (userId != null) {
        await FirebaseFirestore.instance.collection('appointments').add({
          'appointmentWithDocName': docName,
          'appointmentDay': appointmentDayController.text,
          'appointmentTime': appointmentTimeController.text,
          'appointmentNumber': appointmentNumberController.text,
          'appointmentName': appointmentNameController.text,
          'appointmentMessage': appointmentMessageController.text,
          'userId': userId, // Store the user's ID with the appointment
        });
        Get.snackbar('Success', 'Appointment booked successfully');
        clearFields();
        // Optionally refresh appointments after booking
        await refreshAppointments();
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not book appointment');
    } finally {
      isLoading(false);
    }
  }

  // Fetch appointments for the logged-in user
  Future<void> getAppointments() async {
    final userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user's ID
    if (userId != null) {
      try {
        isLoading(true);
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('appointments')
            .where('userId', isEqualTo: userId) // Filter by user ID
            .get();
        appointments.assignAll(querySnapshot.docs); // Update the appointments list
      } catch (e) {
        Get.snackbar('Error', 'Could not retrieve appointments');
      } finally {
        isLoading(false);
      }
    } else {
      throw Exception('User not logged in');
    }
  }

  // Refresh appointments (if needed)
  Future<void> refreshAppointments() async {
    await getAppointments(); // Call getAppointments to refresh the list
  }

  void clearFields() {
    appointmentDayController.clear();
    appointmentTimeController.clear();
    appointmentNumberController.clear();
    appointmentNameController.clear();
    appointmentMessageController.clear();
  }
}

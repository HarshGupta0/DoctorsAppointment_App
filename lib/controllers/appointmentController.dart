import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var appointmentDayController = TextEditingController();
  var appointmentTimeController = TextEditingController();
  var appointmentNumberController = TextEditingController();
  var appointmentNameController = TextEditingController();
  var appointmentMessageController = TextEditingController();

  // Book an appointment
  Future<void> bookAppointment(String docId, String docName, context) async {
    isLoading(true);
    try {
      var store = await FirebaseFirestore.instance.collection("Appointments").doc();
      await store.set({
        'appointmentBy': FirebaseAuth.instance.currentUser?.uid,
        'appointmentDay': appointmentDayController.text,
        'appointmentTime': appointmentTimeController.text,
        'appointmentName': appointmentNameController.text,
        'appointmentNumber': appointmentNumberController.text,
        'appointmentMessage': appointmentMessageController.text,
        'appointmentWith': docId,
        'appointmentWithDocName': docName,
      });
      VxToast.show(context, msg: "Appointment is booked");
    } catch (e) {
      VxToast.show(context, msg: "Error: $e");
    } finally {
      isLoading(false);
      Get.back();
    }
  }

  // Get appointments
  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments() {
    return FirebaseFirestore.instance.collection("Appointments").get();
  }

  // Refresh appointments
  Future<void> refreshAppointments() async {
    await getAppointments();
  }
}

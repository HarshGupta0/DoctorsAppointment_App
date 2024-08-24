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

  bookAppointment(String docId , context) async {
    isLoading(true);

    var store = await FirebaseFirestore.instance.collection("Appointments").doc();
    await store.set({
      'appointmentBy':FirebaseAuth.instance.currentUser?.uid,
      'appointmentDay':appointmentDayController.text,
      'appointmentTime':appointmentTimeController.text,
      'appointmentName':appointmentNumberController.text,
      'appointmentNumber':appointmentNameController.text,
      'appointmentMessage':appointmentMessageController.text,
      'appointmentWith':docId,
    });
    isLoading(false);
    VxToast.show(context, msg:"Appointment is booked");
    Get.back();
  }

   Future<QuerySnapshot<Map<String,dynamic>>> getAppointments(){
    return FirebaseFirestore.instance.collection("Appointments").get();
  }
}

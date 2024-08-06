import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeConytroller extends GetxController{
  var isLoading = false.obs;


  getDoctorList() async {
 var doctor =await FirebaseFirestore.instance.collection("doctors").snapshots();
 return doctor;
  }

}
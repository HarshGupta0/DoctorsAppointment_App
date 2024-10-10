import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isLoading = false.obs;
  var username = "".obs;
  var email = "".obs;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    getUserData(); // Fetch user data when the controller is initialized
  }

  Future<void> getUserData() async {
    isLoading(true);
    try {
      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser!.uid)
            .get();

        if (user.exists) {
          var userData = user.data();
          username.value = userData?['fullname'] ?? "";
          email.value = currentUser!.email ?? "";
        } else {
          username.value = "User not found";
          email.value = "not Found";
        }
      } else {
        username.value = "User not logged in";
        email.value = "";
      }
    } catch (e) {
      username.value = "Error fetching user data";
      email.value = "";
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

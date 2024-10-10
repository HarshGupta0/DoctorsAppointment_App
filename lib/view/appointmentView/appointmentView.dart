import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/controllers/appointmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "View Appointments",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: controller.getAppointments(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: (){
                      //Get.to(appointmentdetailView);
                    },
                    leading: CircleAvatar(),
                    title: Text("Doctor  Name"),
                    subtitle: Text("${data[index]['appointmentTime']} - ${data[index]['appointmentDay']}"),
                  );
                }),
              );
            }
          }),
    );
  }
}

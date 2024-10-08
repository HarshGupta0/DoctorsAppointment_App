import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/controllers/appointmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewBookedAppointmentDetails/viewBookedAppointmentDetails.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    // Fetch appointments when the widget is built
    controller.getAppointments();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "View Appointments",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        // Check if loading
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.appointments.isEmpty) {
          return Center(child: Text("No appointments found."));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.refreshAppointments();
              },
              child: ListView.builder(
                itemCount: controller.appointments.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = controller.appointments[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.to(
                          AppointmentDetailsPage(appointmentDetail: data),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      title: Text(
                        data['appointmentWithDocName'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${data['appointmentDay']}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${data['appointmentTime']}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                data['appointmentNumber'] ?? "N/A",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      }),
    );
  }
}

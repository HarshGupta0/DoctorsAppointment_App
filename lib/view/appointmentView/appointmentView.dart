import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/appointmentController.dart';
class AppointmentsScreen extends StatelessWidget {
  var controller = Get.put(AppointmentController());
  final List<Appointment> appointments = [
    Appointment(
      doctorName: "Dr. John Doe",
      appointmentTime: "10:00 AM",
      avatarUrl: "https://example.com/avatar1.png",
    ),
    Appointment(
      doctorName: "Dr. Jane Smith",
      appointmentTime: "11:30 AM",
      avatarUrl: "https://example.com/avatar2.png",
    ),
    Appointment(
      doctorName: "Dr. Emily White",
      appointmentTime: "2:00 PM",
      avatarUrl: "https://example.com/avatar3.png",
    ),
    Appointment(
      doctorName: "Dr. Michael Brown",
      appointmentTime: "3:45 PM",
      avatarUrl: "https://example.com/avatar4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          'Appointments',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return AppointmentTile(appointment: appointments[index]);
        },
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;

  const AppointmentTile({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.blue.shade50,
          leading: CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(appointment.avatarUrl),
          ),
          title: Text(
            appointment.doctorName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          subtitle: Text(
            appointment.appointmentTime,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class Appointment {
  final String doctorName;
  final String appointmentTime;
  final String avatarUrl;

  Appointment({
    required this.doctorName,
    required this.appointmentTime,
    required this.avatarUrl,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final DocumentSnapshot appointmentDetail;

  AppointmentDetailsPage({super.key, required this.appointmentDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDoctorDetailTile(
                Icons.person,
                'Doctor Name',
                appointmentDetail['appointmentWithDocName'] ?? 'N/A',
              ),
              _buildDoctorDetailTile(
                Icons.calendar_today,
                'Day',
                appointmentDetail['appointmentDay'] ?? 'N/A',
              ),
              _buildDoctorDetailTile(
                Icons.message,
                'Message',
                appointmentDetail['appointmentMessage'] ?? 'No message',
              ),
              _buildDoctorDetailTile(
                Icons.person_outline,
                'Patient Name',
                appointmentDetail['appointmentName'] ?? 'N/A',
              ),
              _buildDoctorDetailTile(
                Icons.phone,
                'Phone Number',
                appointmentDetail['appointmentNumber'] ?? 'N/A',
              ),
              _buildDoctorDetailTile(
                Icons.access_time,
                'Timing',
                appointmentDetail['appointmentTime'] ?? 'N/A',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorDetailTile(IconData icon, String title, String value) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue.shade600,
              size: 28,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(color: Colors.grey[700]),
                    overflow: TextOverflow.visible,
                    maxLines: null, // Allows for full message visibility
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

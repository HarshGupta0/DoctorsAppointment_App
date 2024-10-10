import 'package:doctors_appointment/constants/DoctorInfo.dart';
import 'package:doctors_appointment/controllers/appointmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentScreen extends StatefulWidget {
  final String docId;
  final String docName;

  const BookAppointmentScreen({Key? key, required this.docId, required this.docName}) : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? selectedDay;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        title: Text(widget.docName),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 3,
            color: Colors.blue.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDropdown(
                    label: 'Select appointment day',
                    hint: 'Select day',
                    value: selectedDay,
                    items: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value;
                        controller.appointmentDayController.text = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 22),
                  _buildDropdown(
                    label: 'Select appointment time',
                    hint: 'Select time',
                    value: selectedTime,
                    items: [
                      '9:00 AM-10:00 AM',
                      '11:00 AM-12:00 PM',
                      '1:00 PM-2:00 PM',
                      '3:00 PM-4:00 PM',
                      '6:00 PM-7:00 PM',
                      '8:00 PM-10:00 PM',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedTime = value;
                        controller.appointmentTimeController.text = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 22),
                  _buildTextField(
                    Textcontoller: controller.appointmentNumberController,
                    label: 'Mobile Number:',
                    hint: 'Enter your mobile number',
                    icon: Icons.phone,
                  ),
                  SizedBox(height: 22),
                  _buildTextField(
                    Textcontoller: controller.appointmentNameController,
                    label: 'Full Name:',
                    hint: 'Enter your name',
                    icon: Icons.person,
                  ),
                  SizedBox(height: 22),
                  _buildTextField(
                    Textcontoller: controller.appointmentMessageController,
                    label: 'Message:',
                    hint: 'Enter your message',
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ElevatedButton(
          onPressed: () {
            // Ensure selectedDay and selectedTime are not null before proceeding
            if (selectedDay != null &&
                selectedTime != null &&
                controller.appointmentNumberController.text.isNotEmpty &&
                controller.appointmentNameController.text.isNotEmpty) {
              // Pass the selected day and time along with other details to the controller
              controller.bookAppointment(
                widget.docId,
                widget.docName,
                context,
              );
              print(controller.appointmentMessageController);
            } else {
              // Handle the case where day or time is not selected
              Get.snackbar(
                'Missing Information',
                'Please Enter all The Fields.',
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          child: Text(
            'Book an appointment',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade200,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(hint),
            value: value,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    int maxLines = 1,
    required TextEditingController? Textcontoller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            maxLines: maxLines,
            controller: Textcontoller,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: icon != null ? Icon(icon) : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}

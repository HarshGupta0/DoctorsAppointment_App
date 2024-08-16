import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../bookAppointment/bookAppointment.dart';

class DoctorProfileScreen extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileScreen({super.key, required this.doc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text(doc['DocName']),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.lightBlue.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/images/d1.png'), // Replace with the actual path of the doctor image
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                doc['DocName'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              doc['DocCategory'],
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            VxRating(
                              selectionColor: Colors.orange,
                              onRatingUpdate: (value) {},
                              maxRating: 5,
                              count: 5,
                              stepInt: true,
                              value: double.parse(doc["DocRating"].toString()),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 90.sp,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all reviews',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14.sp),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  doc['DocPhone']);
                            },
                            icon: const Icon(Icons.phone),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocPhone']),
                      SizedBox(height: 16),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocAbout']),
                      SizedBox(height: 16),
                      Text(
                        'Doctors Education',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocDegree']),
                      SizedBox(height: 16),
                      Text(
                        'Doctors Expereince',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocExp']),
                      SizedBox(height: 16),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocAddress']),
                      SizedBox(height: 16),
                      const Text(
                        'Working Time',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocTiming']),
                      SizedBox(height: 16),
                      const Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(doc['DocService']),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(BookAppointmentScreen(docId:doc['DocId'] ,docName: doc['DocName'],));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade200,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: const Text(
            'Book an appointment',
            style: TextStyle(
                color: CupertinoColors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

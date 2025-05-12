import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/controllers/home_controller.dart';
import 'package:doctors_appointment/controllers/settingsController.dart';
import 'package:doctors_appointment/view/doctor_profile_screen/doctorProfile.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/common_bottom.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constants/lottie_asstes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    var controller = Get.put(HomeController());
    var Scontroller = Get.put(SettingsController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Welcome, ${Scontroller.username.split(' ').first.toUpperCase()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp,color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade200,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r)),
                ),
                padding: EdgeInsets.only(bottom: 20.h, left: 5.w, right: 5.w),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: AppStrings.searchHere,
                          isPassword: false,
                          textEditingController: search,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w, bottom: 20.h),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 40.sp,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 120.sp,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: lottie.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          height: 120.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade200.withOpacity(.7),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                color:
                                Colors.grey, // Specify the shadow color
                                spreadRadius: 3, // Set the spread radius
                                blurRadius: 4, // Set the blur radius
                                offset: Offset(0, 3), // Set the offset
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: LottieBuilder.asset(
                                  lottie[index],
                                ),
                              ),
                              Center(
                                child: Text(
                                  lottieName[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text('Popular Doctors',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.lightBlue.shade200)),
                    ),
                  ),
                ],
              ),
              Container(
                height: 250.sp,
                child: FutureBuilder<QuerySnapshot>(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else{
                        var data = snapshot.data?.docs;
                        print(data!.length);

                        return ListView.builder(
                            physics:const BouncingScrollPhysics(),
                            itemCount:data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(DoctorProfileScreen(doc: data[index],));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  width: 170.w,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade200
                                        .withOpacity(.7),
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                        Colors.grey, // Specify the shadow color
                                        spreadRadius: 3, // Set the spread radius
                                        blurRadius: 4, // Set the blur radius
                                        offset: Offset(0, 3), // Set the offset
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(10.r),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: LottieBuilder.asset(
                                          Doclottie[index],
                                        ),
                                      ),
                                      DottedLine(
                                        dashLength: 2.w,
                                        dashGapLength: 2.w,
                                        lineThickness: 2.w,
                                        dashColor: Colors.black,
                                        // dashGapColor: Colors.red,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                          children: [
                                            AboutDr(data[index]['DocName'], data[index]['DocExp']),
                                            AboutDrInfo(
                                              data[index]['DocDegree'],
                                              data[index]['DocCategory'],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("View All",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.lightBlue.shade200)),
                      style: ButtonStyle(
                        minimumSize:
                        MaterialStateProperty.all(Size(80.w, 30.h)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text('View Tests',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.lightBlue.shade200)),
                    ),
                  ),
                ],
              ),
              Container(
                height: 130.h,
                child: ListView.builder(
                    itemCount: lottie.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                           showPathologyBottomSheet(context);
                        },
                        child: Container(
                          height: 120.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade200.withOpacity(.7),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                child: LottieBuilder.asset(
                                  testlottie[index],
                                ),
                              ),
                              Center(
                                child: Text(
                                  lottieName[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget AboutDr(String name, String exp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(
            "Name :- ${name}",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis, // Specify the overflow behavior
            maxLines: 1, // Set the maximum number of lines
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "Exp:-${exp}",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget AboutDrInfo(String degree, String sp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Degree :- ${degree}",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
        SizedBox(
          width: 5.w,
        ),
        Text("Sp :- ${sp}",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

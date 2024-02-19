import 'package:doctors_appointment/constants/DoctorInfo.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../constants/lottie_asstes.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            centerTitle: true,
            elevation: 0,
            backgroundColor:Colors.lightBlue.shade200,
          ),
          backgroundColor: Colors.grey.shade100,
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6.sp,
              crossAxisSpacing: 6.sp,
              mainAxisExtent: 220.sp,
            ),
            padding: EdgeInsets.all(10),
            itemCount:lottie.length,
            physics:const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context,index){
              return Container(
                // height: 120.h,
                // width: 75.w,
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
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Flexible(
                      child: LottieBuilder.asset(
                        lottie[index],
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
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                lottieName[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                ),
                              ),
                              Text("Availbility"),
                              Text(
                                  Availbility[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              );
            },
          ),
        ),
    );
  }
}

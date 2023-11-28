import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/lottie_asstes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Welcome User",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade200.withBrightness,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200.withBrightness,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
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
                height: 20.h,
              ),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: lottie.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          height: 120.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade200.withBrightness
                                  .withOpacity(.7),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(10),
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
                                  style: TextStyle(
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
              10.h.heightBox,
              SizedBox(
                height: 150.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 200,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        color: Colors.red,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

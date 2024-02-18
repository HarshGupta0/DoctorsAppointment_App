import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/lottie_asstes.dart';
class HomeView extends StatelessWidget {
  HomeView({super.key});

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
                height: 15.h,
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
                                child:Text(
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
              SizedBox(
                height: 200,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: lottie.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width:170.w,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade200.withBrightness
                                  .withOpacity(.7),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Flexible(
                                child: LottieBuilder.asset(
                                  lottie[index],
                                ),
                              ),
                              DottedLine(
                                dashLength: 2,
                                dashGapLength: 2,
                                lineThickness: 2,
                                dashColor: Colors.black,
                                // dashGapColor: Colors.red,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    AboutDr(docName[index].toString(),docExp[index].toString()),
                                    AboutDrInfo(docDegree[index].toString(),docSp[index].toString()),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget AboutDr( String name , String Exp){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text( "Name :- ${name}",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)),
        SizedBox(width: 5.w,),
        Text( "Exp :- ${Exp}",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)),
      ],
    ) ;

  }
  Widget AboutDrInfo( String Degree , String sp){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text( "Degree :- ${Degree}",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)),
        SizedBox(width: 5.w,),
        Text( "Sp :- ${sp}",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)),
      ],
    ) ;

  }

  List<String> docName =[
    "Dr.Harsh Gupta",
    "Dr.Navodita Gupta",
    "Dr.Tony Stark",
    "Dr.Bruce Banner",
    "Dr.Strange",
    "Dr.America"

  ];
  List<String> docSp =[
    "Heart",
    "Kidney",
    "Liver",
    "Lungs",
    "Nose ",
    "Eye",
  ];
  List<String> docDegree =[
    "MS/MD , M.CH",
    "MBBS , MS",
    "PHD , MS/MCH"
        "MBBS,MCH",
    "PHD , MBBS",
    "MS/MS",
  ];
  List<String> docExp =[
    "10 years",
    "13 years",
    "11 years",
    "15 years",
    "12 years",
    "10 years",
  ];
}

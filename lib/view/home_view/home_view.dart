import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
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
          title: Text("Welcome User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          backgroundColor:
          Colors.lightBlue.shade200.withBrightness,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.lightBlue.shade200.withBrightness,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(child:
                      CustomTextField(
                        hintText: AppStrings.searchHere,
                        isPassword: false,
                        textEditingController: search,
                      ),),
                      Container(
                        margin: EdgeInsets.only(right: 20,bottom: 20),
                        child: IconButton(onPressed: (){}, icon:Icon(Icons.search,size: 40,color: Colors.white,)),)
                    ],
                  ),
                ),
              ),
              SizedBox(height:20,),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: lottie.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,index){
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      height: 120,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade200.withBrightness.withOpacity(.7),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: LottieBuilder.asset(
                              lottie[index],
                            ),
                          ),
                          Center(child: Text(lottieName[index],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),)
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
}

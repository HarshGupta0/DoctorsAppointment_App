import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        ispassword: false,
                      ),),
                      Container(
                        margin: EdgeInsets.only(right: 20,bottom: 20),
                        child: IconButton(onPressed: (){}, icon:Icon(Icons.search,size: 40,color: Colors.white,)),)
                    ],
                  ),
                ),
              ),
              SizedBox(height:20,),
              Container(
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,index){
                  return Container(
                       height: 45,
                    width: 45,
                    color: Colors.orangeAccent,
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

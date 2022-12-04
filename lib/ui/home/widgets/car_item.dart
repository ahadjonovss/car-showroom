import 'package:car_showroom/data/models/cars_short_model.dart';
import 'package:flutter/material.dart';

import '../../../components/constants/AppImages.dart';
import '../../../components/constants/fonts.dart';

class CarItemWidget extends StatelessWidget {
  CarsShortDataModel car;
   CarItemWidget({required this.car,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(13),
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6B7181),
              Color(0xFF000000),
            ]
        ),
        borderRadius: BorderRadius.circular(18),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text("⭐️ 4.5",style: TextStyle(color: Colors.white),),
          SizedBox(height: 28,),
          Image.asset("assets/images/1.png",width: 180,),
          Row(
            children: [
              Image.asset(AppImages.brand,width: 20,),
              SizedBox(width: 4,),
              Text("Porsche",style: font()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.brand,width: 20,color: Colors.transparent,),
                  SizedBox(width: 4,),
                  Text("\$ 9.999",style: font()),

                ],
              ),
              Container(
                height: 20,
                width: 24,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF6B7181),
                        Color(0xFF374957).withOpacity(0.2),
                      ]
                  ),
                  borderRadius: BorderRadius.circular(4),

                ),
                child: const  Center(
                  child: Icon(Icons.navigate_next_outlined,color: Colors.white,size: 20,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

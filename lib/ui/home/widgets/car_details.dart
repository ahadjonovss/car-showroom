import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:car_showroom/components/constants/AppImages.dart';
import 'package:car_showroom/components/constants/fonts.dart';

import '../../../data/models/car_model.dart';
class CarDetails extends StatelessWidget {
  Car car;
   CarDetails({required this.car,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black,
                Colors.transparent
              ]),
              image: DecorationImage(
                  image: AssetImage(AppImages.car_bg),
                  fit: BoxFit.cover
              )
          ),
        ),
        const SizedBox(height: 30,),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color(0xFF202024),
                borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28,),
                Row(
                  children: [
                    Image.network(car.logo,width: 32,),
                    SizedBox(width: 12,),
                    Text(car.carModel,style: font(20),)
                  ],
                ),
                const SizedBox(height: 28,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${car.averagePrice}",style: font(20),),
                    Row(
                      children: [
                        Text("⭐️ 4.5",style: font(20),),
                        SizedBox(width: 12,),
                        Text("(500 reviews)",style: font(12,Colors.grey),)

                      ],
                    )
                  ],
                ),
                const SizedBox(height: 28,),
                Text("Details",style: font(26),),
                const SizedBox(height: 28,),
                Text(maxLines: 9,car.description,style: font(16),),
                const SizedBox(height: 28,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.height*0.08,
                        decoration: BoxDecoration(
                          gradient:  LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF6B7181),
                                const Color(0xFF374957).withOpacity(0.2),
                              ]
                          ),
                          borderRadius: BorderRadius.circular(16),

                        ),
                        child: const  Center(
                          child: Icon(Icons.car_repair_outlined,color: Colors.white54,size: 40,),
                        ),
                      ),
                      onTap: (){
                        AnimatedSnackBar(
                            builder: ((context) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 40,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "This service permenantly unviable!",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            }),
                            duration: const Duration(seconds: 4),
                            snackBarStrategy: const ColumnSnackBarStrategy())
                            .show(context);
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.height*0.25,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF393B40)),
                          gradient:  LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF6B7181),
                                const Color(0xFF374957).withOpacity(0.2),
                              ]
                          ),
                          borderRadius: BorderRadius.circular(16),

                        ),
                        child:   Center(
                          child: Text("Add to Cart",style: font(20,Colors.white,"Abhaya Libre"),),
                        ),
                      ),
                      onTap: (){
                        AnimatedSnackBar(
                            builder: ((context) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 40,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "This service permenantly unviable!",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            }),
                            duration: const Duration(seconds: 4),
                            snackBarStrategy: const ColumnSnackBarStrategy())
                            .show(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}

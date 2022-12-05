import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:car_showroom/components/constants/fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../data/models/car_model.dart';
class CarDetails extends StatefulWidget {
  Car car;
   CarDetails({required this.car,Key? key}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
   int currentPage=0;

   PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
              child: PageView.builder(
                itemCount: widget.car.carPics.length,
                controller: ctrl,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.car.carPics[index],
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 20,
                          left: 20,
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                          height: 24,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: const  LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xFF6B7181),
                                    const Color(0xFF374957),
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(4),

                          ),
                          child: const  Center(
                              child: Icon(Icons.navigate_before_outlined,color: Colors.white,size: 20,),
                          ),
                        ),
                            ),
                        )
                      ],
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },),
            ),
            SizedBox(
              height: 30,
              child: Center(
                child: PageViewDotIndicator(
                  currentItem: currentPage,
                  count: widget.car.carPics.length,
                  unselectedColor: const Color(0xFF374957),
                  selectedColor: Colors.white,
                  size: const Size(12, 12),
                  unselectedSize: const Size(8, 8),
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  fadeEdges: true,
                ),
              ),
            ),
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
                        Image.network(widget.car.logo,width: 32,),
                        const SizedBox(width: 12,),
                        Text(widget.car.carModel,style: font(20),)
                      ],
                    ),
                    const SizedBox(height: 28,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ ${widget.car.averagePrice}",style: font(20),),
                        Row(
                          children: [
                            Text("⭐️ 4.5",style: font(20),),
                            const SizedBox(width: 12,),
                            Text("(500 reviews)",style: font(12,Colors.grey),)

                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 28,),
                    Text("Details",style: font(26),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.23,
                        child: Text(maxLines: 9,widget.car.description,style: font(16),)),
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
        ),
      ),
    );
  }
}

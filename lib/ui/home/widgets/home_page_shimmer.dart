import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarItemShimmer extends StatelessWidget {
  const CarItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: const Color(0xFF374957),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,
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
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2.3/3,
                  ),
                  itemBuilder: (context,index)=>  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: const Color(0xFF374957),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(13),
                      height: MediaQuery.of(context).size.height*0.21,
                      width: MediaQuery.of(context).size.width*0.47,
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
                    ),
                  )),
            ),
          ),

        ],
      ),
    );
  }
}

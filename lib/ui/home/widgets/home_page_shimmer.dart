import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarItemShimmer extends StatelessWidget {
  const CarItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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
    );
  }
}

import 'package:car_showroom/components/constants/AppImages.dart';
import 'package:car_showroom/components/constants/fonts.dart';
import 'package:car_showroom/data/models/cars_short_model.dart';
import 'package:car_showroom/ui/home/widgets/car_details.dart';
import 'package:car_showroom/view_models/carsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../data/models/car_model.dart';

class DetailesPage extends StatefulWidget {
  Datum car;
  DetailesPage({required this.car,Key? key}) : super(key: key);

  @override
  State<DetailesPage> createState() => _DetailesPageState();
}

class _DetailesPageState extends State<DetailesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CarsViewModel>().getCarById(widget.car.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer<CarsViewModel>(
          builder: (context, carsviewmodel, child) {
            return carsviewmodel.isLoading?
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child:Center(
                    child: Lottie.asset("assets/lotties/waiting.json"),
                  )
                ):
                carsviewmodel.car==null?
                    const Text("Hech narsa yo'q"):
                    CarDetails(car: carsviewmodel.car!);

          },
        ),
      ),
    );
  }
}

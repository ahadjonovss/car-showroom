import 'package:car_showroom/data/models/cars_short_model.dart';
import 'package:car_showroom/ui/home/widgets/car_details.dart';
import 'package:car_showroom/view_models/carsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class DetailesPage extends StatefulWidget {
  Datum car;
  DetailesPage({required this.car,Key? key}) : super(key: key);

  @override
  State<DetailesPage> createState() => _DetailesPageState();
}

class _DetailesPageState extends State<DetailesPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CarsViewModel(),
      builder: (context, child) {
        context.read<CarsViewModel>().getCarById(widget.car.id);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Consumer<CarsViewModel>(
              builder: (context, carsViewModel, child) {
                return carsViewModel.isLoading?
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child:Center(
                      child: Lottie.asset("assets/lotties/waiting.json"),
                    )
                ):
                carsViewModel.car==null?
                const SafeArea(child:  Text("Hech narsa yo'q",style: TextStyle(color: Colors.white),)):
                CarDetails(car: carsViewModel.car!);

              },
            ),
          ),
        );

      },
    );
  }
}

import 'package:car_showroom/components/constants/AppImages.dart';
import 'package:car_showroom/view_models/carsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState(){
    context.read<CarsViewModel>().getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.car),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ), //image
            Consumer<CarsViewModel>(
                builder: (context, carsviewmodel, child) {
                  return Container(
                    child: carsviewmodel.isLoading?
                    CircularProgressIndicator():
                    carsviewmodel.cars==null?
                    Text("Hech nima yo'q",style: TextStyle(color: Colors.white),):
                    Text("Ma'lumotlar keldi",style: TextStyle(color: Colors.white),)
                  );


                },)
          ],
        ),
      ),
    );
  }
}

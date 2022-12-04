import 'package:car_showroom/components/constants/AppImages.dart';
import 'package:car_showroom/components/constants/fonts.dart';
import 'package:car_showroom/ui/home/widgets/car_item.dart';
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
                    const CircularProgressIndicator():
                    carsviewmodel.cars==null?
                    const Text("Hech nima yo'q",style: TextStyle(color: Colors.white),):
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: GridView.builder(
                          itemCount: carsviewmodel.cars!.data.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 2.3/3,
                            ),
                            itemBuilder: (context, index) =>  CarItemWidget(car: carsviewmodel.cars!.data[index]),),
                      ),
                    )
                  );


                },)
          ],
        ),
      ),
    );
  }
}

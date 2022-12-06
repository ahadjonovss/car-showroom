import 'package:car_showroom/components/constants/AppImages.dart';
import 'package:car_showroom/ui/home/widgets/car_item.dart';
import 'package:car_showroom/ui/home/widgets/home_page_shimmer.dart';
import 'package:car_showroom/view_models/carsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>CarsViewModel(),
      builder: (context, child) {
        var carsviewmodel=context.watch<CarsViewModel>();
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
                Container(
                    child: carsviewmodel.isLoading?
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
                            itemBuilder: (context,index)=> const CarItemShimmer()),
                      ),
                    ):
                    carsviewmodel.cars==null?
                    const Text("Hech nima yo'q",style: TextStyle(color: Colors.white),):
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

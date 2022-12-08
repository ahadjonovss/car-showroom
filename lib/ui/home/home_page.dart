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
                Container(
                    child: carsviewmodel.isLoading?
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const CarItemShimmer()):
                    carsviewmodel.cars==null?
                    const Text("Hech nima yo'q",style: TextStyle(color: Colors.white),):
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: Colors.black,
                            expandedHeight: 300.0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Image.asset(AppImages.car),
                            ),
                            title: Text("Cars"),
                            centerTitle: true,
                            pinned: true,
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(12),

                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                childCount: carsviewmodel.cars!.data.length,
                                    (context, index) => CarItemWidget(car: carsviewmodel.cars!.data[index]),
                              ),
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 10,
                                  maxCrossAxisExtent: MediaQuery.of(context).size.height*0.21,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 2.3/3

                              ),),
                          )
                        ],

                      ),
                    ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

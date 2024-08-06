import 'package:amazon_clone_final/features/home/services/home_services.dart';
import 'package:amazon_clone_final/features/product_details/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices=HomeServices();
  void initState() {
    super.initState();
    fetchDealOfDay();
  }
  fetchDealOfDay() async {
    product=await homeServices.fetchDealOfDay(context: context);
    setState(() {

    });
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(context,ProductDetailScreen.routeName,arguments:product );
  }
  @override
  Widget build(BuildContext context) {
    return product==null ?
    const Loader()
    : product!.name.isEmpty
      ? const SizedBox()
      :GestureDetector(
        onTap: navigateToDetailScreen,
        child: Column(
        children: [
          Container(
            alignment:Alignment.topLeft,
            padding:const EdgeInsets.only(left:10,top:5),
            child:const Text('Deal of the Day',style: TextStyle(
              fontSize: 20,
            ),
            ),
          ),
          Image.network(
            product!.images[0],
            height: 235,
            fit:BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left:15,top: 5,right:40),
            alignment: Alignment.topLeft,
            child: Text(
              '\$${product?.price}',
            style:
            const TextStyle( fontSize: 18),),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left:15,top: 5,right:40),
            child: Text(
              'Aryansh',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.
              map(
                    (e) => Image.network(
                      e,
                fit:BoxFit.contain,
                width:100,
                height:100,),
              ).toList()
            ),
          ),
          Container(
            padding:const EdgeInsets.only(left:15,top:15,bottom:15),
            alignment: Alignment.topLeft,
            child: Text('See ALL Deals',style: TextStyle(
              color:Colors.cyan,
            ),
            ),
          ),
        ],
            ),
      );
  }
}

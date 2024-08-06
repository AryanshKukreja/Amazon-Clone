import "package:amazon_clone_final/common/widgets/loader.dart";
import "package:amazon_clone_final/features/account/services/account_services.dart";
import "package:amazon_clone_final/features/account/widgets/single_product.dart";
import "package:amazon_clone_final/features/order_details/screens/order_details.dart";
import "package:flutter/material.dart";

import "../../../constants/global_variables.dart";
import "../../../models/order.dart";

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices=AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
    setState(() {

    });
  }

  void fetchOrders() async {
    orders=await accountServices.fetchMyOrders(context: context);
  }
  Widget build(BuildContext context) {
    return orders==null ?const Loader(): Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        // Display Orders
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailScreen.routeName,
                        arguments:orders![index], );
                  },
                  child: SingleProduct(
                    image: orders![index].products[0].images[0],
                  ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import "package:amazon_clone_final/constants/utils.dart";
import "package:amazon_clone_final/features/address/services/address_services.dart";
import "package:amazon_clone_final/models/user.dart";
import "package:amazon_clone_final/providers/user_provider.dart";
import "package:flutter/material.dart";
import "package:pay/pay.dart";
import "package:provider/provider.dart";

import "../../../common/widgets/custom_textfield.dart";
import "../../../constants/global_variables.dart";

class AddressScreen extends StatefulWidget {
  final String totalAmount;
  static const String routeName ='/address';
  const AddressScreen({ required this.totalAmount,super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  final TextEditingController flatBuildingController=TextEditingController();
  final TextEditingController areaController=TextEditingController();
  final TextEditingController pincodeController=TextEditingController();
  final TextEditingController cityController=TextEditingController();
  final _addressFormKey=GlobalKey<FormState>();
  String addressToBeUsed ="";

  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices=AddressServices();
  
  void initState() {
    super.initState();
    paymentItems.add(
        PaymentItem(
            amount: widget.totalAmount,
            label: 'Total Amount',status:PaymentItemStatus.final_price));
  }
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    cityController.dispose();
    areaController.dispose();
    pincodeController.dispose();
  }

  void onGooglePayResult(res) {
    if(Provider.of<UserProvider>(context,listen:false).user.address.isEmpty) {
      addressServices.saveUserAddress(context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(context: context, address: addressToBeUsed, totalSum: double.parse(widget.totalAmount),);
  }
  void payPressed(String addressFromProvider) {
    addressToBeUsed="";
    bool isForm =
        flatBuildingController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        cityController.text.isNotEmpty;
    if(isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed = '${flatBuildingController.text}, '
            '${areaController.text}, '
            '${cityController.text} - '
            '${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values');
      }
    }else if(addressFromProvider.isNotEmpty) {
      addressToBeUsed=addressFromProvider;
    } else {
      showSnackBar(context, 'Error');
    }
    print(addressToBeUsed);
    dynamic res='';
    onGooglePayResult(res);
    }

  Widget build(BuildContext context) {
    var address= context.watch<UserProvider>().user.address;
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
    child: AppBar(
    flexibleSpace: Container(
    decoration: const BoxDecoration(
    gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if(address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color:Colors.black12,
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(address,style:const TextStyle(
                          fontSize: 18,
                        )),
                      )
                    ),
                    const SizedBox(height:20),
                    const Text('OR',style:const TextStyle(
                      fontSize: 18,
                    ),
                    ),
                    const SizedBox(height:20),

                  ],
                ),
              Form(
            key: _addressFormKey,
            child: Column(
              children: [
                CustomTextfield(
                  controller: flatBuildingController,
                  hintText: 'Flat,House No,Building',
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: areaController,
                  hintText: 'Area,Street',
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: pincodeController,
                  hintText: 'Pincode',
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: cityController,
                  hintText: 'Town/City',
                ),
              ],
            ),
          ),
          GooglePayButton(
            onPressed:() =>payPressed(address) ,
            paymentConfigurationAsset: 'gpay.json',
            onPaymentResult: onGooglePayResult,
            paymentItems: paymentItems,
            height:50,
            type: GooglePayButtonType.buy,
            margin: const EdgeInsets.only(top:15),
            loadingIndicator: const Center(child:CircularProgressIndicator()),
          ),
          ],
          ),

        ),
      ),
    );
  }
}

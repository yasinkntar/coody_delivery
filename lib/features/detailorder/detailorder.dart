import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody_delivery/core/utils/colors.dart';
import 'package:coody_delivery/core/utils/size_config.dart';
import 'package:coody_delivery/core/utils/style.dart';
import 'package:coody_delivery/core/widget/appbars.dart';
import 'package:coody_delivery/features/detailorder/widget/carduser.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView(
      {super.key,
      this.userdata,
      required this.addressc,
      required this.invoicedata});
  final DocumentSnapshot<Map<String, dynamic>>? userdata;
  final DocumentReference addressc;
  final QueryDocumentSnapshot<Map<String, dynamic>> invoicedata;
  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBars(
          context: context,
          isback: true,
          titte: Text(
            'Order ID #455254',
            style: getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          actioniamage: 'assets/payment.png',
          ontapAction: () => {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Delivery of the order',
                            style: getbodyStyle(fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                              'Confirm delivery of the \n order to a customer'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Orders')
                                      .doc(widget.invoicedata.id)
                                      .set({
                                    'status': 3,
                                  }, SetOptions(merge: true));
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'OK',
                                  style: getbodyStyle(),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: getbodyStyle(),
                                ))
                          ],
                        ))
              }),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/map.jpg'), fit: BoxFit.fill)),
      )),
      bottomSheet: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.5,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule, color: AppColors.colorprimer),
                    const Gap(2),
                    Text(
                      '45 Min',
                      style: getbodyStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorprimer),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(5),
            const Divider(),
            CardUsers(
              AddressID: '',
              userid: widget.userdata!.id,
            ),
            const Gap(5),
            const Divider(),
            const Gap(5),
            StreamBuilder(
                stream: widget.addressc.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Row(
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        color: AppColors.colorprimer,
                      ),
                      const Gap(10),
                      SizedBox(
                        width: SizeConfig.screenWidth - 80,
                        child: Text(
                          snapshot.data?['Address'],
                          maxLines: 3,
                          style: getbodyStyle(
                              fontSize: 13, color: const Color(0xff6B6E82)),
                        ),
                      ),
                    ],
                  );
                }),
            const Gap(5),
            const Divider(),
            const Gap(5),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.inventory_2,
                  size: 20,
                  color: Color(0xffA5A7B9),
                ),
                title: Text(
                  '${List.from(widget.invoicedata["Items"]).length} items',
                  style: getbodyStyle(),
                ),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Color(0xffA5A7B9),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.inventory_2,
                  size: 20,
                  color: Color(0xffA5A7B9),
                ),
                title: Text(
                  'Total Invoice ${double.parse(widget.invoicedata["Net"].toString()).toStringAsFixed(2)} EG',
                  style: getbodyStyle(),
                ),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Color(0xffA5A7B9),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

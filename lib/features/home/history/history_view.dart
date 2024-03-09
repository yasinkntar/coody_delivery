import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody_delivery/features/home/widget/item_order.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('status', whereIn: [3, 4])
            .where('DeliveryID',
                isEqualTo: FirebaseFirestore.instance
                    .collection("Delivery")
                    .doc('57vfiMzKOOpM1vxlPPBh'))
            .snapshots(),
        builder: (context, snapshot) {
 
          return Scaffold(
              body: ListView.builder(
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index) => ItemOrder(
              buttontext: 'Details Order',
              ontap: () {
                //   pushTo(context,  OrderDetailView());
              },
              outline: () {},
              outlinetext: 'Canel Order',
              uid: '',
              data: snapshot.data?.docs[index],
            ),
          ));
        });
  }
}

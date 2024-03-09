import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody_delivery/core/functions/routing.dart';
import 'package:coody_delivery/features/detailorder/detailorder.dart';
import 'package:coody_delivery/features/home/widget/item_order.dart';
import 'package:flutter/material.dart';

class OnGoingView extends StatefulWidget {
  const OnGoingView({super.key});

  @override
  State<OnGoingView> createState() => _OnGoingViewState();
}

class _OnGoingViewState extends State<OnGoingView> {
  var data = {
    'Status': 0,
    'Customer': {
      'uid': 'sssssssss',
      'Name': 'Yasin Kntar',
      'Phone': '+201066258503',
      'urel':
          'https://lh3.googleusercontent.com/a/ACg8ocIQ6iuCde3KaiM0S8CKd2IwpUNNN4Krp0k76nTuxO_pUw5r8u633juLhachsHvCEXfLxY8K-t1GLxBW1Yd6YwMCJ1g=s288-c-no'
    },
    'OrderID': 258564,
    'Net': 450,
    'Items': [],
    'Date': '2023-45-45'
  };
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('status', whereIn: [2])
            .where('DeliveryID',
                isEqualTo: FirebaseFirestore.instance
                    .collection("Delivery")
                    .doc('57vfiMzKOOpM1vxlPPBh'))
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data?.docs.first;
          print(data);
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

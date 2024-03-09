import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody_delivery/core/functions/routing.dart';
import 'package:coody_delivery/core/widget/button_widget.dart';
import 'package:coody_delivery/features/detailorder/detailorder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:coody_delivery/core/utils/colors.dart';
import 'package:coody_delivery/core/utils/style.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemOrder extends StatefulWidget {
  const ItemOrder(
      {super.key,
      required this.data,
      required this.uid,
      required this.ontap,
      required this.buttontext,
      required this.outlinetext,
      required this.outline});
  // ignore: prefer_typing_uninitialized_variables
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;
  final String uid;
  final Function outline;
  final Function ontap;
  final String outlinetext;
  final String buttontext;
  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  String getstate(int index) {
    switch (index) {
      case 0:
        return 'Acceptance';
      case 1:
        return 'In preparation';
      case 2:
        return 'Delivery';
      case 3:
        return 'Completed';
      case 4:
        return 'Order Denied';
      case 5:
        return 'Cancel';
      default:
        return 'Eerror';
    }
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.grey.shade600;
      case 1:
        return Colors.black;
      case 2:
        return AppColors.colorprimer;
      case 3:
        return Colors.green;
      case 4:
      case 5:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.data?["userID"])
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          DocumentReference addressc = widget.data?["Addressc"];
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#503251',
                      style: getbodyStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      getstate(int.parse(widget.data!['status'].toString())),
                      style: getbodyStyle(
                          color: getColor(
                              int.parse(widget.data!['status'].toString())),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${double.parse(widget.data!["Net"].toString()).toStringAsFixed(2)} EG',
                      style: getbodyStyle(
                          color: AppColors.buttoncolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Gap(5),
                const Divider(),
                const Gap(10),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage(snapshot.data!.data()?["image"])),
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Gap(6),
                        Row(
                          children: [
                            Text(
                              snapshot.data!.data()?["name"],
                              style: getbodyStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Gap(10),
                        StreamBuilder(
                            stream: addressc.snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return SizedBox(
                                width: 200,
                                height: 60,
                                child: Text(
                                  snapshot.data?['Address'],
                                  maxLines: 3,
                                  style: getbodyStyle(
                                      fontSize: 13,
                                      color: const Color(0xff6B6E82)),
                                ),
                              );
                            }),
                      ],
                    )
                  ],
                ),
                const Gap(5),
                const Divider(),
                const Gap(5),
                Row(
                  children: [
                    Expanded(
                        child: Buton(
                      hidget: 50,
                      text: widget.buttontext,
                      ontap: () {
                        pushTo(
                            context,
                            OrderDetailView(
                              userdata: snapshot.data,
                              addressc: addressc,
                              invoicedata: widget.data!,
                            ));
                      },
                    )),
                    const Gap(10),
                    int.parse(widget.data!['status'].toString()) != 3
                        ? Expanded(
                            child: InkWell(
                            onTap: () {
                              widget.outline.call();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffff7622),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(widget.outlinetext,
                                    textAlign: TextAlign.center,
                                    style: getbodyStyle(
                                        fontSize: 14,
                                        color: const Color(0xffff7622),
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ))
                        : const SizedBox()
                  ],
                )
              ],
            ),
          );
        });
  }
}

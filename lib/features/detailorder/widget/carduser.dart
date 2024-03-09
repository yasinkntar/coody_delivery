import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody_delivery/core/utils/colors.dart';
import 'package:coody_delivery/core/utils/size_config.dart';
import 'package:coody_delivery/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardUsers extends StatefulWidget {
  const CardUsers({super.key, required this.AddressID, required this.userid});
  final String userid;
  final String AddressID;
  @override
  State<CardUsers> createState() => _CardUsersState();
}

class _CardUsersState extends State<CardUsers> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.userid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return SizedBox(
              width: SizeConfig.screenWidth,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(snapshot.data!["image"])),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: SizeConfig.screenWidth - 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Color(0xffA5A7B9),
                                ),
                                const Gap(5),
                                Text(
                                  snapshot.data!["name"],
                                  style:
                                      getbodyStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 18,
                                  color: Color(0xffA5A7B9),
                                ),
                                const Gap(5),
                                Text(
                                  snapshot.data!["phone"],
                                  style: getbodyStyle(
                                      color: const Color(0xffA5A7B9),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => {},
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colorprimer),
                            child: const Icon(
                              Icons.call,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}

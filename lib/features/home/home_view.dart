import 'package:coody_delivery/core/utils/colors.dart';
import 'package:coody_delivery/core/utils/size_config.dart';
import 'package:coody_delivery/core/utils/style.dart';
import 'package:coody_delivery/features/home/history/history_view.dart';
import 'package:coody_delivery/features/home/ongoing/ongoing_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String name = '';

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Orders',
              style: getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            bottom: TabBar(
              dividerColor: const Color(0xffCED7DF),
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.colorprimer,
              indicatorColor: AppColors.colorprimer,
              labelStyle:
                  getbodyStyle(fontSize: 14, fontWeight: FontWeight.bold),
              unselectedLabelStyle: getbodyStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffA5A7B9)),
              automaticIndicatorColorAdjustment: true,
              tabs: const [
                Tab(
                  text: 'Ongoing',
                ),
                Tab(text: "History"),
              ],
            ),
            actions: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.colorprimer,
                backgroundImage: (imagePath != null)
                    ? FileImage(File(imagePath!)) as ImageProvider
                    : const AssetImage('assets/user.png'),
              ),
              const Gap(10)
            ],
          ),
          body: const TabBarView(
            children: [OnGoingView(), HistoryView()],
          ),
        ));
  }
}

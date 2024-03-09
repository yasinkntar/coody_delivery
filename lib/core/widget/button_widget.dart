
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buton extends StatefulWidget {
  Buton({super.key, required this.text, this.ontap, this.hidget = 62});
  String text;
  Function()? ontap;
  double hidget;
  @override
  State<Buton> createState() => _ButonState();
}

class _ButonState extends State<Buton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: double.infinity,
        height: widget.hidget,
        decoration: BoxDecoration(
          color: const Color(0xffff7622),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardCustom extends StatelessWidget {
  final String title;
  final String total;
  const CardCustom({
    super.key,
    required this.title,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(15),
              Text(title, style: const TextStyle(fontSize: 15)),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(total,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }
}

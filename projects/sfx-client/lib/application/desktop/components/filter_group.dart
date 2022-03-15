import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterGroupWidget extends StatefulWidget {
  const FilterGroupWidget({Key? key}) : super(key: key);

  @override
  State<FilterGroupWidget> createState() => _FilterGroupWidget();
}

class _FilterGroupWidget extends State<FilterGroupWidget> {
  int selectedIndex = 0;
  int hoveredIndex = 0;
  final Color selectedColor = const Color.fromRGBO(238, 243, 254, 100);
  final Color defaultColor = Colors.white;
  final Color iconColor = const Color.fromRGBO(153, 153, 153, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: MouseRegion(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                selectedIndex == 0 || hoveredIndex == 0
                                    ? selectedColor
                                    : defaultColor)),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: [
                              SvgPicture.asset(
                                "images/svg/wallet.svg",
                                color: iconColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("所有")
                            ]))),
                    onHover: (value) {
                      setState(() {
                        hoveredIndex = 0;
                      });
                    },
                    onExit: (value) {
                      setState(() {
                        hoveredIndex = selectedIndex;
                      });
                    })),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: MouseRegion(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                selectedIndex == 1 || hoveredIndex == 1
                                    ? selectedColor
                                    : defaultColor)),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: [
                              SvgPicture.asset(
                                "images/svg/bill.svg",
                                color: iconColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("今天")
                            ]))),
                    onHover: (value) {
                      setState(() {
                        hoveredIndex = 1;
                      });
                    },
                    onExit: (value) {
                      setState(() {
                        hoveredIndex = selectedIndex;
                      });
                    })),
          ),
        ]));
  }
}

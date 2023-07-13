import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../Data/DataFile.dart';
import '../../ViewCarDetails/ViewCarDetails.dart';

class BottomTabBarEconomy extends StatefulWidget {
  const BottomTabBarEconomy({super.key});

  @override
  State<BottomTabBarEconomy> createState() => _BottomTabBarEconomyState();
}

class _BottomTabBarEconomyState extends State<BottomTabBarEconomy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(14, 226, 243, 244),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: ScrollSnapList(
          itemCount: economyCars.length,
          itemSize: 240,
          onItemFocus: (index) {},
          dynamicItemSize: true,
          dynamicItemOpacity: 0.3,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }
}

Widget _itemBuilder(BuildContext context, int index) {
  return InkWell(
    onTap: (() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) =>
              ViewCarDetails(listName: economyCars, index: index)),
        ),
      );
    }),
    child: Container(
      width: 245,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 55,
            left: 22,
            child: SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  economyCars[index]['path'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${economyCars[index]['name']}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "₹ ${economyCars[index]['price']}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

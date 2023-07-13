import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../Data/DataFile.dart';
import '../../ViewCarDetails/ViewCarDetails.dart';

class BottomTabBarAll extends StatefulWidget {
  const BottomTabBarAll({super.key});

  @override
  State<BottomTabBarAll> createState() => _BottomTabBarAllState();
}

class _BottomTabBarAllState extends State<BottomTabBarAll> {
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
          itemCount: allCars.length,
          itemSize: 240,
          shrinkWrap: true,
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
              ViewCarDetails(listName: allCars, index: index)),
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
                  allCars[index]['path'],
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
                color: Color.fromARGB(255, 244, 220, 5),
              ),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 35, color: Colors.white),
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
                  "${allCars[index]['name']}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "₹ ${allCars[index]['price']}",
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

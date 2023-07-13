import 'package:flutter/material.dart';

class ViewCarDetails extends StatefulWidget {
  final List listName;
  final int index;
  const ViewCarDetails(
      {super.key, required this.listName, required this.index});

  @override
  State<ViewCarDetails> createState() => _ViewCarDetailsState(listName, index);
}

class _ViewCarDetailsState extends State<ViewCarDetails> {
  final List listname;
  final int index;
  bool changeIcon = false;
  _ViewCarDetailsState(this.listname, this.index);
  void _changeFavouriteIcon() {
    setState(() {
      if (changeIcon == false) {
        changeIcon = true;
      } else {
        changeIcon = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: BackButton(),
            trailing: Icon(Icons.shopping_cart),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 262,
            width: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                listname[index]['path'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${listname[index]['category']}",
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${listname[index]['name']}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            trailing: Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 192, 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: IconButton(
                  icon: changeIcon
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                  onPressed: _changeFavouriteIcon,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                listname[index]['description'],
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 17),
            child: const Text(
              "Specs",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              SizedBox(
                  height: 177,
                  width: double.maxFinite,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: (listname[index]['category'] == "Economy")
                        ? _economy(index)
                        : ((listname[index]['category'] == "Luxury")
                            ? _luxury(index)
                            : ((listname[index]['category'] == "SUV")
                                ? _suv(index)
                                : _sports(index))),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 213, 192, 2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Buy: ₹ ${listname[index]['price']}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _economy(index) {
  return SingleChildScrollView(
    child: Wrap(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "ARAI Mileage   24.7 kmpl",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Engine Displacement  (cc)1498"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Seating Capacity    5"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Anti Lock Braking System"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Automatic Climate Control"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Alloy Wheels"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Power Windows Front"),
        ),
      ],
    ),
  );
}

Widget _luxury(index) {
  return SingleChildScrollView(
    child: Wrap(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "ARAI Mileage   9.8 kmpl",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Engine Displacement(cc)   6749"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Seating Capacity    5"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Anti Lock Braking System"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Max Torque(nm@rpm)  900Nm@1700rpm"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Alloy Wheels"),
        ),
      ],
    ),
  );
}

Widget _suv(index) {
  return Wrap(
    children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "No. of cylinder   4",
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Engine Displacement(cc)   2198"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Seating Capacity   5,7"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Anti Lock Braking System"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Max Torque(nm@rpm) 450Nm@1750-2800rpm"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Alloy Wheels"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Power Windows Front"),
      ),
    ],
  );
}

Widget _sports(index) {
  return Wrap(
    children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "562 - 602 Horsepower",
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("High-end interior"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Seating Capacity    2"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Authoritative acceleration"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("AWD, RWD"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Alloy Wheels"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Power Windows Front"),
      ),
    ],
  );
}

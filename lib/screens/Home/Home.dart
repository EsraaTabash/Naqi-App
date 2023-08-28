import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:naqi/screens/drawer/Delegators.dart';

import '../../widget/order.dart';
import '../drawer/AboutUs.dart';
import '../drawer/Notifications.dart';
import '../drawer/Products.dart';
import '../drawer/Settings.dart';
import '../drawer/profile.dart';
import '../gate/login.dart';
import '../tabBarPages/Assigned.dart';
import '../tabBarPages/Cancelled.dart';
import '../tabBarPages/Completed.dart';

class Home extends StatefulWidget {
  final bool isAgent;

  Home({required this.isAgent});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentPageIndex = 0;
  List<String> titles = ["Profile", "Notification", "About Us", "Language"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: widget.isAgent ? 4 : 3, // Adjust the tab count
      vsync: this,
    );
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          currentPageIndex = tabController.index;
        });
      }
    });
  }

  void logout() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  bool isSearchVisible = false;
  TextEditingController searchController = TextEditingController();

  void toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
      if (!isSearchVisible) {
        searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.isAgent ? 4 : 3, // Adjust the tab count
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Notifications(); // Navigate to the Notifications screen
                    }));
                  },
                  icon: Icon(Icons.notifications_rounded),
                ),
                Positioned(
                  // Adjust the position of the container (badge) here
                  top: 10,
                  right: 8,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        "5",
                        // Replace this with the actual count of notifications
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: IconButton(
                  onPressed: toggleSearchVisibility,
                  icon: Icon(Icons.search_rounded)),
            ),
            if (widget.isAgent)
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products()));
                },
                icon: SvgPicture.asset('icons/pro.svg', width: 24, height: 24), // Adjust width and height as needed
              ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade600,
                  Colors.blue.shade400,
                  Colors.blue.shade200
                ],
              ),
            ),
          ),
          title: isSearchVisible
              ? Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "cairo"),
                          cursorColor: Colors.white, // Customize cursor color
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                color: Colors.white70, fontFamily: "cairo"),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: toggleSearchVisibility,
                        padding: EdgeInsets.only(left: 40),
                        icon: Icon(Icons.cancel, color: Colors.white),
                      ),
                    ],
                  ),
                )
              : Text("Orders", style: TextStyle(fontFamily: "cairo")),
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            tabs: [
              if (widget.isAgent)
                Tab(
                  child: Text(
                    'New',
                    style: TextStyle(fontSize: 13), // Adjust the font size here
                  ),
                ),
              Tab(
                child: Text(
                  'Assigned',
                  style: TextStyle(fontSize: 13), // Adjust the font size here
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 13), // Adjust the font size here
                ),
              ),
              Tab(
                child: Text(
                  'Cancelled',
                  style: TextStyle(fontSize: 13), // Adjust the font size here
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade400,
                      Colors.blue.shade200
                    ],
                  ),
                ),
                accountName:
                    Text("Esraa Tabash", style: TextStyle(fontFamily: "cairo")),
                accountEmail: Text("+970 592431806",
                    style: TextStyle(fontFamily: "cairo", height: 1)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
              ),
              ListTile(
                title: Text("Profile", style: TextStyle(fontFamily: "cairo")),
                leading:
                    SvgPicture.asset('icons/userp.svg', width: 30, height: 30),
                onTap: () {
                  Navigator.of(context).pop(); // Close the Drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
              ),
              ListTile(
                title:
                    Text("Notification", style: TextStyle(fontFamily: "cairo")),
                leading: SvgPicture.asset('icons/alert.svg',
                    width: 30, height: 30, fit: BoxFit.contain),
                onTap: () {
                  Navigator.of(context).pop(); // Close the Drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Notifications();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(fontFamily: "cairo"),
                ),
                leading: SvgPicture.asset('icons/userss.svg',
                    width: 30, height: 30, fit: BoxFit.contain),
                onTap: () {
                  Navigator.of(context).pop(); // Close the Drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
              ),
              ListTile(
                title: Text("Settings", style: TextStyle(fontFamily: "cairo")),
                leading: SvgPicture.asset('icons/settings.svg',
                    width: 30, height: 30, fit: BoxFit.fitHeight),
                onTap: () {
                  Navigator.of(context).pop(); // Close the Drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Settings();
                  }));
                  setState(() {});
                },
              ),
              if(widget.isAgent)ListTile(
                title: Text("Delegators", style: TextStyle(fontFamily: "cairo")),
                leading: SvgPicture.asset('icons/del.svg',
                    width: 30, height: 30, fit: BoxFit.fitHeight),
                onTap: () {
                  Navigator.of(context).pop(); // Close the Drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Delegators();
                  }));
                  setState(() {});
                },
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider()), // Add a divider
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: AnimatedButton(
                  text: "Logout",
                  buttonTextStyle:
                      TextStyle(fontFamily: "cairo", color: Colors.black87),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.bottomSlide,
                      showCloseIcon: true,
                      title: "Logout",
                      btnCancelColor: Colors.red.shade600,
                      desc: "Are you sure you want to logout?",
                      btnOkOnPress: () {
                        logout();
                      },
                      btnCancelOnPress: () {},
                    ).show();
                  },
                ),
              )
            ],
          ),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return TabBarView(
              controller: tabController,
              children: [
                if (widget.isAgent) New(isAgent: widget.isAgent),
                // Add this tab content for the agent
                Assigned(isAgent: widget.isAgent),
                Completed(isAgent: widget.isAgent),
                Cancelled(isAgent: widget.isAgent),
              ],
            );
          },
        ),
      ),
    );
  }
}
//
// class Notifications extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Notifications")),
//       body: Center(
//         child: Text("Notifications Screen"),
//       ),
//     );
//   }
// }
//
// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: Center(
//         child: Text("Profile Screen"),
//       ),
//     );
//   }
// }
//
// class AboutUs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("About Us")),
//       body: Center(
//         child: Text("About Us Screen"),
//       ),
//     );
//   }
// }
//
// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Settings")),
//       body: Center(
//         child: Text("Settings Screen"),
//       ),
//     );
//   }
// }
//
// class Assigned extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Assigned Tab"),
//     );
//   }
// }
//
// class Completed extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Completed Tab"),
//     );
//   }
// }
//
// class Cancelled extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Cancelled Tab"),
//     );
//   }
// }

class New extends StatefulWidget {
  final bool isAgent; // Add this parameter

  const New({Key? key, required this.isAgent}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  bool sortByBottles = false; // Whether to sort by number of bottles
  bool sortByDate = false; // Whether to sort by date
  late List<Order> allOrders;
  late List<Widget> orderWidgets;

  List<Order> sortedOrders() {
    List<Order> orders = [...allOrders];

    if (sortByBottles) {
      orders.sort((a, b) => b.quantity.compareTo(a.quantity));
    }

    if (sortByDate) {
      orders.sort((a, b) {
        return b.deliveryDateTime.compareTo(a.deliveryDateTime);
      });
    }

    return orders;
  }

  void initState() {
    allOrders = [
      Order(
        313511,
        "suliman ali",
        "At Morning",
        "New",
        false,
        total: '123.45 SAR',
        clientNumber: '0592431802',
        addressType: 'Home',
        paymentType: 'Credit Card',
        deliveryDateTime: DateTime(2023, 5, 17),
        quantity: 60,
        price: 1,
        productName: "200mlBottle x 60pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313512,
        "ahmad othman",
        "At Morning",
        "New",
        false,
        total: '456.78 SAR',
        clientNumber: '0592431844',
        addressType: 'Office',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 5, 18),
        quantity: 20,
        price: 2,
        productName: "330mlBottle x 20pcs",
        img: 'Group1',
        isAgent: widget.isAgent,
      ),
      // Add more orders here...
    ];

    orderWidgets = sortedOrders().map((order) {
      return Order(
        order.orderNumber,
        order.clientName,
        order.periodDate,
        order.type,
        order.isAssignedInWay,
        total: order.total,
        clientNumber: order.clientNumber,
        addressType: order.addressType,
        paymentType: order.paymentType,
        deliveryDateTime: order.deliveryDateTime,
        productName: order.productName,
        quantity: order.quantity,
        price: order.price,
        img: order.img,
        isAgent: order.isAgent,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue.shade50,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: sortByBottles ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      sortByBottles = !sortByBottles;
                      orderWidgets = sortedOrders().map((order) {
                        return Order(
                          order.orderNumber,
                          order.clientName,
                          order.periodDate,
                          order.type,
                          order.isAssignedInWay,
                          total: order.total,
                          clientNumber: order.clientNumber,
                          addressType: order.addressType,
                          paymentType: order.paymentType,
                          deliveryDateTime: order.deliveryDateTime,
                          productName: order.productName,
                          quantity: order.quantity,
                          price: order.price,
                          img: order.img,
                          isAgent: order.isAgent,
                        );
                      }).toList();
                    });
                  },
                  icon: Icon(
                    sortByBottles ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Sort by Bottles",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: sortByDate ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      sortByDate = !sortByDate;
                      orderWidgets = sortedOrders().map((order) {
                        return Order(
                          order.orderNumber,
                          order.clientName,
                          order.periodDate,
                          order.type,
                          order.isAssignedInWay,
                          total: order.total,
                          clientNumber: order.clientNumber,
                          addressType: order.addressType,
                          paymentType: order.paymentType,
                          deliveryDateTime: order.deliveryDateTime,
                          productName: order.productName,
                          quantity: order.quantity,
                          price: order.price,
                          img: order.img,
                          isAgent: order.isAgent,
                        );
                      }).toList();
                    });
                  },
                  icon: Icon(
                    sortByDate ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Sort by Date",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            // Display orderWidgets list
            for (int i = 0; i < orderWidgets.length; i++)
              Container(
                margin: EdgeInsets.only(
                    top: i == 0 ? 15 : 20, right: 20, left: 20, bottom: 0),
                // Add margin only for non-first cards
                child: orderWidgets[i],
              ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
//
// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Handle login logic
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => Home(isAgent: true)), // Pass isAgent as needed
//             );
//           },
//           child: Text("Login"),
//         ),
//       ),
//     );
//   }
// }
//

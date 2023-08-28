import 'package:flutter/material.dart';
import '../../widget/order.dart';

class Cancelled extends StatefulWidget {
  final bool isAgent; // Add this parameter
  const Cancelled({Key? key, required this.isAgent}) : super(key: key);

  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
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
        313517,
        "ali mohammed",
        "At Morning",
        "Cancelled",
        false,
        total: '123.45 SAR',
        clientNumber: '0592431802',
        addressType: 'Home',
        paymentType: 'Credit Card',
        deliveryDateTime: DateTime(2023, 7, 9),
        reason: "reason 1",
        quantity: 50,
        price: 1,
        productName: "200mlBottle x 50pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313518,
        "laila alahmade",
        "At Morning",
        "Cancelled",
        false,
        total: '456.78 SAR',
        clientNumber: '0592431844',
        addressType: 'Office',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 7, 10),
        reason: "reason 2",
        quantity: 50,
        price: 3,
        productName: "600mlBottle x 50pcs",
        img: 'Group3',
        isAgent: widget.isAgent,
      ),

      Order(
        313519,
        "qasem rami",
        "At Evening",
        "Cancelled",
        false,
        total: '716.50 SAR',
        clientNumber: '0599864230',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023,7,11),
        reason: "reason 3",
        quantity: 50,
        price: 3,
        productName: "600mlBottle x 50pcs",
        img: 'Group3',
        isAgent: widget.isAgent,

      ),
      Order(
        313520,
        "majed nabil",
        "At Evening",
        "Cancelled",
        false,
        total: '214.00 SAR',
        clientNumber: '0592111444',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023,7,12),
        reason: "reason 4",
        quantity: 50,
        price: 2,
        productName: "330mlBottle x 50pcs",
        img: 'Group1',
        isAgent: widget.isAgent,

      ),
      Order(
        313521,
        "abeer mostafa",
        "At Evening",
        "Cancelled",
        false,
        total: '100.00 SAR',
        clientNumber: '0593003333',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023,7,13),
        reason: "reason 5",
        quantity: 50,
        price: 3,
        productName: "600mlBottle x 50pcs",
        img: 'Group3',
        isAgent: widget.isAgent,

      ),
      Order(
        313522,
        "rewaa tamer",
        "At Evening",
        "Cancelled",
        false,
        total: '222.00 SAR',
        clientNumber: '0592111435',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023,7,14),
        reason: "reason 6",
        quantity: 50,
        price: 3,
        productName: "600mlBottle x 50pcs",
        img: 'Group3',
        isAgent: widget.isAgent,
      ),
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
        reason: order.reason, // Add reason parameter
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
                          reason: order.reason,
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
                          reason: order.reason,
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

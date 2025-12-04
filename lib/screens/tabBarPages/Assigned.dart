import 'dart:math';
import 'package:flutter/material.dart';
import 'package:naqi/widget/order.dart';

class Assigned extends StatefulWidget {
  final bool isAgent;

  const Assigned({super.key, required this.isAgent});

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
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
        // print("Comparing ${a.deliveryDateTime} with ${b.deliveryDateTime}");
        // print(b.deliveryDateTime.compareTo(a.deliveryDateTime));
        return b.deliveryDateTime.compareTo(a.deliveryDateTime);
      });
    }

    return orders;
  }

  @override
  void initState() {
    allOrders = [
      Order(
        313523,
        "ahmad othman",
        "At Morning",
        "Assigned",
        true,
        total: '456.78 SAR',
        clientNumber: '0592431844',
        addressType: 'Office',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 5, 22),
        quantity: 20,
        price: 2,
        productName: "330mlBottle x 20pcs",
        img: 'Group1',
        isAgent: widget.isAgent,
      ),
      Order(
        313524,
        "oday al-qasem",
        "At Evening",
        "Assigned",
        true,
        total: '716.50 SAR',
        clientNumber: '0599864230',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 5, 23),
        quantity: 150,
        price: 1,
        productName: "200mlBottle x 150pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313525,
        "suliman ali",
        "At Morning",
        "Assigned",
        false,
        total: '123.45 SAR',
        clientNumber: '0592431802',
        addressType: 'Home',
        paymentType: 'Credit Card',
        deliveryDateTime: DateTime(2023, 5, 24),
        quantity: 60,
        price: 1,
        productName: "200mlBottle x 60pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313526,
        "yomna khaled",
        "At Evening",
        "Assigned",
        false,
        total: '100.00 SAR',
        clientNumber: '0593003333',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 5, 29),
        quantity: 10,
        price: 3,
        productName: "600mlBottle x 10pcs",
        img: 'Group3',
        isAgent: widget.isAgent,
      ),
      Order(
        313527,
        "alaa waled",
        "At Evening",
        "Assigned",
        true,
        total: '214.00 SAR',
        clientNumber: '0592111444',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 6, 1),
        quantity: 150,
        price: 1,
        productName: "200mlBottle x 150pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313528,
        "oday al-qasem",
        "At Evening",
        "Assigned",
        true,
        total: '716.50 SAR',
        clientNumber: '0599864230',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 6, 2),
        quantity: 150,
        price: 1,
        productName: "200mlBottle x 150pcs",
        img: 'Group2',
        isAgent: widget.isAgent,
      ),
      Order(
        313530,
        "esraa waled",
        "At Evening",
        "Assigned",
        false,
        total: '222.00 SAR',
        clientNumber: '0592111435',
        addressType: 'home',
        paymentType: 'Cash',
        deliveryDateTime: DateTime(2023, 6, 19),
        quantity: 50,
        price: 3,
        productName: "600mlBottle x 50pcs",
        img: 'Group3',
        isAgent: widget.isAgent,
      ),
    ];

    orderWidgets =
        sortedOrders().map((order) {
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sortByBottles ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      sortByBottles = !sortByBottles;
                      orderWidgets =
                          sortedOrders().map((order) {
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
                    backgroundColor: sortByDate ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      sortByDate = !sortByDate;
                      orderWidgets =
                          sortedOrders().map((order) {
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
            if (widget.isAgent) ...[
              for (int i = 0; i < orderWidgets.length; i++)
                Container(
                  margin: EdgeInsets.only(
                    top: i == 0 ? 15 : 20,
                    right: 20,
                    left: 20,
                    bottom: 0,
                  ),
                  // Add margin only for non-first cards
                  child: orderWidgets[i],
                ),
              SizedBox(height: 50),
            ],
            if (!widget.isAgent) ...[
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left: 20,
                  bottom: 0,
                ),
                // Add margin only for non-first cards
                child: Order(
                  313525,
                  "suliman ali",
                  "At Morning",
                  "Assigned",
                  false,
                  total: '123.45 SAR',
                  clientNumber: '0592431802',
                  addressType: 'Home',
                  paymentType: 'Credit Card',
                  deliveryDateTime: DateTime(2023, 5, 24),
                  quantity: 60,
                  price: 1,
                  productName: "200mlBottle x 60pcs",
                  img: 'Group2',
                  isAgent: widget.isAgent,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  right: 20,
                  left: 20,
                  bottom: 0,
                ),
                // Add margin only for non-first cards
                child: Order(
                  313526,
                  "yomna khaled",
                  "At Evening",
                  "Assigned",
                  false,
                  total: '100.00 SAR',
                  clientNumber: '0593003333',
                  addressType: 'home',
                  paymentType: 'Cash',
                  deliveryDateTime: DateTime(2023, 5, 29),
                  quantity: 10,
                  price: 3,
                  productName: "600mlBottle x 10pcs",
                  img: 'Group3',
                  isAgent: widget.isAgent,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  right: 20,
                  left: 20,
                  bottom: 0,
                ),
                // Add margin only for non-first cards
                child: Order(
                  313530,
                  "esraa waled",
                  "At Evening",
                  "Assigned",
                  false,
                  total: '222.00 SAR',
                  clientNumber: '0592111435',
                  addressType: 'home',
                  paymentType: 'Cash',
                  deliveryDateTime: DateTime(2023, 6, 19),
                  quantity: 50,
                  price: 3,
                  productName: "600mlBottle x 50pcs",
                  img: 'Group3',
                  isAgent: widget.isAgent,
                ),
              ),
            ],
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

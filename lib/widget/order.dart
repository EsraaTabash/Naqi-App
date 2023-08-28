import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

import 'orderDetails.dart';

class Order extends StatelessWidget {
  final double _borderRadius = 20;
  final bool isAssignedInWay;
  final bool isAgent; // Add this parameter
  final String formattedDeliveryDate; // Add this field

  int orderNumber;
  String clientName;
  String periodDate;
  String type;
  String reason;
  String total;
  String clientNumber;
  String addressType;
  String paymentType;
  DateTime deliveryDateTime;

  String productName;
  int quantity;
  double price;
  String img;

  Order(
      this.orderNumber,
      this.clientName,
      this.periodDate,
      this.type,
      this.isAssignedInWay,
      {
        this.reason = '',
        required this.isAgent, // Add this line
      this.total = '',
      this.clientNumber = '',
      this.addressType = '',
      this.paymentType = '',
      required DateTime deliveryDateTime,
      this.productName = '',
      this.quantity = 0,
      this.price = 0.0,
      this.img = ''})  : deliveryDateTime = deliveryDateTime,
        formattedDeliveryDate = DateFormat('yyyy-MM-dd').format(deliveryDateTime);

  @override
  Widget build(BuildContext context) {
    List<String> delegators = ["Delegator 1", "Delegator 2", "Delegator 3"];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetails(
              orderNumber: orderNumber,
              clientName: clientName,
              total: total,
              clientNumber: clientNumber,
              addressType: addressType,
              paymentType: paymentType,
              deliveryDate: deliveryDateTime,
              reason: reason,
              price: price,
              productName: productName,
              quantity: quantity,
              img: img,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 2,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Order Number: $orderNumber',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "cairo",
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Client Name: $clientName',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Period Date: $periodDate',
                        style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    if (type == "New")
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    _showAssignDialog(context, delegators),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 60),
                                    child: Text(
                                      'Assign',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blueGrey.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (type == "Assigned" && isAssignedInWay && isAgent)
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(30,0, 10, 0),
                                  child:
                                  Row(
                                    children: [

                                      Text(
                                        'On The Way',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlueAccent.shade400,
                                        ),
                                      ),
                                      Image.asset(
                                        "images/de.gif",
                                        width:40,
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.shade50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (type == "Assigned" && ((!isAssignedInWay && isAgent)))
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                _showDelayOrLateDialog(context, "Delay"),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: Text(
                                  'Delay',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "cairo",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () =>
                                _showAssignDialog(context, delegators),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: Text(
                                  'Assign',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "cairo",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (type == "Assigned" && !isAgent)
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    _showDelayOrLateDialog(context, "Delay"),
                                // Show Delay dialog
                                child: Container(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 26),
                                    child: Text(
                                      'Delay',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () =>
                                    _showDelayOrLateDialog(context, "Late"),
                                // Show Late dialog
                                child: Container(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 26),
                                    child: Text(
                                      'Late',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: "cairo",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (type == "Cancelled")
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 55),
                          child: Text(
                            'Cancelled',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.shade400,
                        ),
                      ),
                    if (type == "Completed")
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade400,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: CustomPaint(
                  size: Size(100, 150),
                  painter: CustomCardShapePainter(
                    _borderRadius,
                    Colors.blue.shade100,
                    Colors.blue.shade400,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigate to order details page using orderNumber
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetails(
                          orderNumber: orderNumber,
                          clientName: clientName,
                          total: total,
                          clientNumber: clientNumber,
                          addressType: addressType,
                          paymentType: paymentType,
                          deliveryDate: deliveryDateTime,
                          reason: reason,
                          price: price,
                          productName: productName,
                          quantity: quantity,
                          img: img,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(size.width, size.height),
      [HSLColor.fromColor(startColor).withLightness(0.8).toColor(), endColor],
    );

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
Future<void> _showDelayOrLateDialog(BuildContext context, String type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDelay = type == "Delay";

  String? selectedReason = prefs.getString('selectedReason');

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(isDelay ? 'Delay Order' : 'Late Order',
            style: TextStyle(fontFamily: 'cairo')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text("The Customer's delivery location is too far from me",
                  style: TextStyle(fontFamily: 'cairo')),
              value: "Reason 1",
              groupValue: selectedReason,
              onChanged: (value) {
                Navigator.of(context).pop();
                prefs.setString('selectedReason', value!); // Save the selected reason
                selectedReason = value;
              },
              dense: true,
              // Reduce the vertical spacing
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 0), // Reduce horizontal padding
            ),
            SizedBox(height: 10),
            RadioListTile<String>(
              title: Text("I have a lot of orders today",
                  style: TextStyle(fontFamily: 'cairo')),
              value: "Reason 2",
              groupValue: selectedReason,
              onChanged: (value) {
                Navigator.of(context).pop();
                selectedReason = value;
              },
              dense: true,
              // Reduce the vertical spacing
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 0), // Reduce horizontal padding
            ),
          ],
        ),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.shade600)),
                  child: Text("Cancel",
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white)),
                ),
                SizedBox(width: 10),
                // Add spacing between buttons
                TextButton(
                  onPressed: () {
                    if (selectedReason != null && selectedReason!.isNotEmpty) {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade600)),
                  child: Text("OK",
                      style:
                          TextStyle(fontFamily: 'cairo', color: Colors.white)),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     if (selectedReason != null && selectedReason!.isNotEmpty) {
                //       // TODO: Add your logic for marking the order as Delay or Late with the selectedReason
                //       Navigator.of(context).pop();
                //     }
                //   },
                //   child: Text("OK", style: TextStyle(fontFamily: 'cairo')),
                // ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
Future<void> _showAssignDialog(BuildContext context, List<String> delegators) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? selectedDelegator = prefs.getString('selectedDelegator');

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Select Delegator :',
          style: TextStyle(fontFamily: 'cairo'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...delegators.map((delegator) => RadioListTile<String>(
              title: Text(
                delegator,
                style: TextStyle(fontFamily: 'cairo'),
              ),
              value: delegator,
              groupValue: selectedDelegator,
              onChanged: (value) {
                Navigator.of(context).pop();
                prefs.setString('selectedDelegator', value!); // Save the selected delegator
                selectedDelegator = value;
              },
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
            )),
          ],
        ),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade600),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontFamily: 'cairo', color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    if (selectedDelegator != null &&
                        selectedDelegator!.isNotEmpty) {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade600),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(fontFamily: 'cairo', color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

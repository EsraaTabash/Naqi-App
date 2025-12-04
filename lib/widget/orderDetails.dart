import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  final int orderNumber;
  final String clientName;
  final String total;
  final String clientNumber;
  final String addressType;
  final String paymentType;
  final DateTime deliveryDate;
  final String reason;

  final String productName;
  final int quantity;
  final double price;
  final String img;
  final DateFormat dateFormat = DateFormat(
    'dd-MM-yyyy',
  ); // Define the desired date format

  OrderDetails({
    super.key,
    required this.orderNumber,
    required this.clientName,
    required this.total,
    required this.clientNumber,
    required this.addressType,
    required this.paymentType,
    required this.deliveryDate,
    required this.reason,

    required this.productName,
    required this.quantity,
    required this.price,
    required this.img,
  });

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final ScrollController _scrollController = ScrollController();
  // bool _isAdditionalInfoVisible = false;

  @override
  Widget build(BuildContext context) {
    bool isCancelledOrder = widget.reason.isNotEmpty;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade200,
              ],
            ),
          ),
        ),
        title: Text("Orders Details", style: TextStyle(fontFamily: "cairo")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade600,
                    Colors.blue.shade400,
                    Colors.blue.shade200,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      // if (_isAdditionalInfoVisible) ...[
                      //   _buildProductImageAndInfo(),
                      // ],
                      _buildProductImageAndInfo(),
                      Row(
                        children: [
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Order Number : ',
                              value: '${widget.orderNumber}',
                            ),
                          ),
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Client Name : ',
                              value: widget.clientName,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Total : ',
                              value: widget.total,
                            ),
                          ),
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Client Number : ',
                              value: widget.clientNumber,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Address Type : ',
                              value: widget.addressType,
                            ),
                          ),
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Payment Type : ',
                              value: widget.paymentType,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OrderDetailCard(
                              title: 'Delivery Date : ',
                              value:
                                  widget.dateFormat
                                      .format(widget.deliveryDate)
                                      .toString(),
                            ),
                          ),
                          if (isCancelledOrder) ...[
                            // Expanded(
                            //   child: OrderDetailCard(
                            //     title: 'Rejection Reason :',
                            //     value: widget.reason,
                            //   ),
                            // ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 5, right: 5), // Add the desired margin
        child: SpeedDial(
          icon: Icons.menu,
          backgroundColor: Colors.blue.shade700,
          activeIcon: Icons.close,
          activeBackgroundColor: Colors.blue.shade700,
          visible: true,
          closeManually: false,
          curve: Curves.easeInOut,
          children: [
            SpeedDialChild(
              child: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
              backgroundColor: Colors.white,
              label: 'Scrolling Down',
              labelStyle: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo',
              ),
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.location_on, color: Colors.blue.shade700),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              label: 'Product Location',
              labelStyle: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo',
              ),
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.call, color: Colors.blue.shade700),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              label: 'Call Client',
              labelStyle: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo',
              ),
              onTap: () {
                // Add code to make a call to the client's phone number
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.sms, color: Colors.blue.shade700),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              label: 'Send SMS',
              labelStyle: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'cairo',
              ),
              onTap: () {
                // Add code to send an SMS to the client's phone number
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImageAndInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage('images/Group3.png'),
                    image: AssetImage('images/${widget.img}.png'),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: ListTile(
                  title: Text(
                    //'600mlBottle x 30pcs',
                    widget.productName,
                    style: TextStyle(
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //  'Quantity: 30',
                        'Quantity: ${widget.quantity}',
                        style: TextStyle(fontFamily: 'cairo', fontSize: 15),
                      ),
                      Text(
                        // 'Price: 10SAR',
                        'Price: ${widget.price}',
                        style: TextStyle(fontFamily: 'cairo', fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(), // Add a divider for separation
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total Price : ',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                //     '[ 300 SAR ]',
                '[ ${widget.price * widget.quantity} SAR ]',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class OrderDetailCard extends StatelessWidget {
  final String title;
  final String value;

  const OrderDetailCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(fontFamily: "Cairo", fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 7),
      ],
    );
  }
}

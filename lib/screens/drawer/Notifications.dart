import 'package:flutter/material.dart';

enum NotificationType { OnTheWay, Assigned, Completed }

class NotificationModel {
  final NotificationType type;
  final String title;
  final String description;
  final String time;

  NotificationModel({
    required this.type,
    required this.title,
    required this.description,
    required this.time,
  });
}

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List<NotificationModel> notifications = [
    NotificationModel(
      type: NotificationType.Completed,
      title: 'Order Completed',
      description: 'Order has been completed successfully',
      time: '3 days ago',
    ),
    NotificationModel(
      type: NotificationType.OnTheWay,
      title: 'Your Order On The Way',
      description: 'Your order delivery in progress',
      time: '1 week ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '1 month ago',
    ),
    NotificationModel(
      type: NotificationType.OnTheWay,
      title: 'Your Order On The Way',
      description: 'Your order delivery in progress',
      time: '1 month ago',
    ),
    NotificationModel(
      type: NotificationType.Completed,
      title: 'Order Completed',
      description: 'Order has been completed successfully',
      time: '2 months ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '3 months ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '3 months ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '3 months ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '3 months ago',
    ),
    NotificationModel(
      type: NotificationType.Assigned,
      title: 'Assign New Order',
      description: 'Order has been assigned successfully',
      time: '3 months ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
        title: Text("Notifications", style: TextStyle(fontFamily: "cairo")),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue.shade50,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.blue.shade600, Colors.blue.shade400, Colors.blue.shade200],
        //   ),
        // ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2,
              child: ListTile(
                trailing: Text(
                  notification.time,
                  style: TextStyle(color: Colors.blue, fontFamily: "cairo"),
                ),
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    notification.title,
                    style: TextStyle(
                      fontFamily: "cairo",
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    notification.description,
                    style: TextStyle(
                      fontFamily: "cairo",
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.0);
          },
          itemCount: notifications.length,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Notifications()));
}

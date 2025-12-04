import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          BottleCard(
            name: '600ml bottle x 30 pcs',
            image: 'images/Group2.png', // Replace with actual image path
            price: 30,
          ),
          SizedBox(height: 16),
          BottleCard(
            name: '330ml bottle x 24 pcs',
            image: 'images/Group1.png', // Replace with actual image path
            price: 25,
          ),
          SizedBox(height: 16),
          BottleCard(
            name: '200ml bottle x 24 pcs',
            image: 'images/Group3.png', // Replace with actual image path
            price: 20,
          ),
          SizedBox(height: 16),
          BottleCard(
            name: 'PET 200ml bottle x 24 pcs',
            image: 'images/Group4.png', // Replace with actual image path
            price: 15,
          ),
        ],
      ),
    );
  }
}

class BottleCard extends StatefulWidget {
  final String name;
  final String image;
  final double price;

  const BottleCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  _BottleCardState createState() => _BottleCardState();
}

class _BottleCardState extends State<BottleCard> {
  bool _isActivated = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PriceScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Activate',
                        style: TextStyle(fontSize: 14, fontFamily: 'Cairo'),
                      ),
                      SizedBox(width: 8),
                      Switch(
                        value: _isActivated,
                        onChanged: (value) {
                          setState(() {
                            _isActivated = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Icon(Icons.arrow_forward, color: Colors.blue, size: 28),
          ],
        ),
      ),
    );
  }
}

class PriceScreen extends StatelessWidget {
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Price', style: TextStyle(fontFamily: 'Cairo')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PriceCard(title: 'Mosques', price: 10),
            SizedBox(height: 16),
            PriceCard(title: 'Companies', price: 10),
            SizedBox(height: 16),
            PriceCard(title: 'Homes', price: 10),
          ],
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String title;
  final double price;

  const PriceCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

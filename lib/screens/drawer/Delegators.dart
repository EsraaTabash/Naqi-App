import 'package:flutter/material.dart';

class Delegators extends StatefulWidget {
  const Delegators({Key? key}) : super(key: key);

  @override
  _DelegatorsState createState() => _DelegatorsState();
}

class _DelegatorsState extends State<Delegators> {
  List<DelegatorInfo> _delegators = [
    DelegatorInfo(name: 'Delegator 1', isActivated: true),
    DelegatorInfo(name: 'Delegator 2', isActivated: false),
    DelegatorInfo(name: 'Delegator 3', isActivated: false),
    DelegatorInfo(name: 'Delegator 4', isActivated: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        title: Text("Delegators", style: TextStyle(fontFamily: "cairo")),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back when the back icon is pressed
          },
          icon: Icon(Icons.arrow_back), // Back icon
        ),
      ),
      body: ListView.builder(
        itemCount: _delegators.length,
        itemBuilder: (context, index) {
          return DelegatorCard(
            delegator: _delegators[index],
            onDelete: () {
              setState(() {
                _delegators.removeAt(index);
              });
            },
            onActivationChanged: (value) {
              setState(() {
                _delegators[index].isActivated = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDelegatorScreen()),
          ).then((result) {
            if (result != null && result is DelegatorInfo) {
              setState(() {
                _delegators.add(result);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DelegatorInfo {
  final String name;
  bool isActivated;

  DelegatorInfo({required this.name, required this.isActivated});
}

class DelegatorCard extends StatelessWidget {
  final DelegatorInfo delegator;
  final Function() onDelete;
  final Function(bool) onActivationChanged;

  const DelegatorCard({
    required this.delegator,
    required this.onDelete,
    required this.onActivationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade400,
            ),
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          title: Text(
            delegator.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
          ),
          subtitle: Text(
            delegator.isActivated ? 'Activated' : 'Deactivated',
            style: TextStyle(
              color: delegator.isActivated ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              Switch(
                value: delegator.isActivated,
                onChanged: onActivationChanged,
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDelegatorScreen extends StatefulWidget {
  @override
  _AddDelegatorScreenState createState() => _AddDelegatorScreenState();
}

class _AddDelegatorScreenState extends State<AddDelegatorScreen> {
  String _name = '';
  String _password = '';
  String _mobile = '';
  String? _selectedRegion = 'Region 1'; // Set default region
  String? _selectedCity = 'City 1'; // Set default city

  List<String> _regions = ['Region 1', 'Region 2', 'Region 3'];
  Map<String, List<String>> _citiesByRegion = {
    'Region 1': ['City 1', 'City 2', 'City 3'],
    'Region 2': ['City A', 'City B', 'City C'],
    'Region 3': ['City X', 'City Y', 'City Z'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        title: Text(
          "Add New Delegators",
          style: TextStyle(fontFamily: "cairo"),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back when the back icon is pressed
          },
          icon: Icon(Icons.arrow_back), // Back icon
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add New Delegator',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _mobile = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedRegion,
                    onChanged: (value) {
                      setState(() {
                        _selectedRegion = value.toString();
                        _selectedCity = _citiesByRegion[value.toString()]![0];
                      });
                    },
                    items: _regions.map<DropdownMenuItem<String>>((region) {
                      return DropdownMenuItem<String>(
                        value: region,
                        child: Text(region),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Region',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedCity,
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value.toString();
                      });
                    },
                    items:
                        _citiesByRegion[_selectedRegion]
                            ?.map<DropdownMenuItem<String>>((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            })
                            .toList() ??
                        [],
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Save the new delegator
                      DelegatorInfo newDelegator = DelegatorInfo(
                        name: _name,
                        isActivated: true, // Set to default value
                      );

                      // TODO: Perform saving logic here

                      Navigator.pop(
                        context,
                        newDelegator,
                      ); // Return new delegator
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Save', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

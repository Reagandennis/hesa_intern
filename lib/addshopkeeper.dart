import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const OwnerSection(),
    const StoreSection(),
    const StoreKeeperSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Owner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Store Keeper',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class OwnerSection extends StatefulWidget {
  const OwnerSection({Key? key}) : super(key: key);

  @override
  _OwnerSectionState createState() => _OwnerSectionState();
}

class _OwnerSectionState extends State<OwnerSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _saveOwnerInfo() {
    final name = _nameController.text;
    final email = _emailController.text;

    // TODO: save the owner info using a database or file system
    print('Name: $name, Email: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Owner',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _saveOwnerInfo,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class StoreSection extends StatefulWidget {
  const StoreSection({Key? key}) : super(key: key);

  @override
  _StoreSectionState createState() => _StoreSectionState();
}

class _StoreSectionState extends State<StoreSection> {
  final _formKey = GlobalKey<FormState>();
  String? _shopName;
  String? _location;

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save the data to a database or backend service
      print('Shop Name: $_shopName, Location: $_location');

      // Show a snackbar or toast to inform the user that the data has been saved
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Store Section',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Shop Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a shop name';
                }
                return null;
              },
              onSaved: (value) {
                _shopName = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
              onSaved: (value) {
                _location = value;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
class StoreKeeperSection extends StatefulWidget {
  const StoreKeeperSection({Key? key}) : super(key: key);

  @override
  _StoreKeeperSection createState() => _StoreKeeperSection();
}

class _StoreKeeperSection extends State<StoreSection> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shopkeeper Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              labelText: 'phone number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

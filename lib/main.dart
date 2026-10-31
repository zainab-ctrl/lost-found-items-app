
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost and Found',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> items = const [
    {
      'name': 'Mobile Phone',
      'location': 'Library',
      'status': 'Lost',
      'description': 'A black Samsung mobile phone was lost in the library.'
    },
    {
      'name': 'Water Bottle',
      'location': 'Cafeteria',
      'status': 'Found',
      'description': 'A blue water bottle was found near the cafeteria.'
    },
    {
      'name': 'Student ID Card',
      'location': 'Computer Lab',
      'status': 'Lost',
      'description': 'A student ID card is missing from the computer lab.'
    },
    {
      'name': 'Wallet',
      'location': 'Parking Area',
      'status': 'Found',
      'description': 'A brown wallet was found in the parking area.'
    },
    {
      'name': 'Notebook',
      'location': 'Classroom 5',
      'status': 'Lost',
      'description': 'A mathematics notebook was lost in classroom 5.'
    },
    {
      'name': 'Headphones',
      'location': 'Library',
      'status': 'Found',
      'description': 'Black headphones were found on a library table.'
    },
    {
      'name': 'Keys',
      'location': 'Main Gate',
      'status': 'Lost',
      'description': 'A set of keys is missing near the main gate.'
    },
    {
      'name': 'Laptop Bag',
      'location': 'Auditorium',
      'status': 'Found',
      'description': 'A laptop bag was found in the auditorium.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(
                Icons.search,
                color: Colors.green,
                size: 35,
              ),

              title: Text(
                items[index]['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: ${items[index]['location']}'),
                  Text('Status: ${items[index]['status']}'),
                ],
              ),

              trailing: ElevatedButton(
                child: const Text('Details'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        item: items[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Details Screen
class DetailsPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailsPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.inventory_2,
              size: 80,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              'Item Name: ${item['name']}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Location: ${item['location']}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            Text(
              'Status: ${item['status']}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            Text(
              'Description: ${item['description']}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Items'),
            ),
          ],
        ),
      ),
    );
  }
}

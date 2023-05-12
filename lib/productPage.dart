// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product('Category 1', 'Subcategory 1', 'Product 1'),
    Product('Category 1', 'Subcategory 2', 'Product 2'),
    Product('Category 2', 'Subcategory 1', 'Product 3'),
    Product('Category 2', 'Subcategory 2', 'Product 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('${products[index].category} > ${products[index].subcategory}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddProductDialog(BuildContext context) {
    String category = '';
    String subcategory = '';
    String name = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                onChanged: (value) {
                  category = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Subcategory',
                ),
                onChanged: (value) {
                  subcategory = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                products.add(Product(category, subcategory, name));
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String category;
  final String subcategory;
  final String name;

  Product(this.category, this.subcategory, this.name);
}

import 'package:flutter/material.dart';

class Product {
  final String category;
  final String subCategory;
  final String name;

  Product({required this.category, required this.subCategory, required this.name});
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subCategoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _subCategoryController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _addProduct() {
    String category = _categoryController.text;
    String subCategory = _subCategoryController.text;
    String name = _nameController.text;

    // Save the new product to your data store
    Product newProduct = Product(category: category, subCategory: subCategory, name: name);
    // Add code to save the new product to your data store

    // Clear the text fields
    _categoryController.clear();
    _subCategoryController.clear();
    _nameController.clear();

    // Show a success message or navigate to the product display page
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Product added successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _subCategoryController,
              decoration: const InputDecoration(
                labelText: 'Sub-category',
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}

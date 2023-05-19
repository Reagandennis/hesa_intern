import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final String subCategory;

  Product({
    required this.name,
    required this.category,
    required this.subCategory,
  });
}

class DisplayProductsPage extends StatefulWidget {
  const DisplayProductsPage({Key? key}) : super(key: key);

  @override
  _DisplayProductsPageState createState() => _DisplayProductsPageState();
}

class _DisplayProductsPageState extends State<DisplayProductsPage> {
  List<Product> _products = [
    Product(name: 'Product 1', category: 'Category 1', subCategory: 'Sub-Category 1'),
    Product(name: 'Product 2', category: 'Category 2', subCategory: 'Sub-Category 1'),
    Product(name: 'Product 3', category: 'Category 1', subCategory: 'Sub-Category 2'),
    Product(name: 'Product 4', category: 'Category 2', subCategory: 'Sub-Category 2'),
  ];

  List<Product> _filteredProducts = [];
  String _selectedCategory = 'All';
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _filterByCategory(String? category) {
    setState(() {
      _selectedCategory = category ?? 'All';
      if (_selectedCategory == 'All') {
        _filteredProducts = _products;
      } else {
        _filteredProducts = _products
            .where((product) => product.category == _selectedCategory)
            .toList();
      }
    });
  }

  void _searchProducts(String keyword) {
    setState(() {
      _filteredProducts = _products
          .where((product) =>
          product.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchProducts,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            onChanged: _filterByCategory,
            items: const [
              DropdownMenuItem<String>(
                value: 'All',
                child: Text('All Categories'),
              ),
              DropdownMenuItem<String>(
                value: 'Category 1',
                child: Text('Category 1'),
              ),
              DropdownMenuItem<String>(
                value: 'Category 2',
                child: Text('Category 2'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Category: ${product.category} | Sub-Category: ${product.subCategory}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Code to add new product
          // It can navigate to a different page or show a dialog for adding product details
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

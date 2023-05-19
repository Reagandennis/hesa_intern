import 'package:flutter/material.dart';

class SalesGeneratePage extends StatefulWidget {
  @override
  _SalesGeneratePageState createState() => _SalesGeneratePageState();
}

class _SalesGeneratePageState extends State<SalesGeneratePage> {
  List<Sale> sales = [];
  TextEditingController productController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  void generateSale() {
    String product = productController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;
    if (product.isNotEmpty && quantity > 0) {
      setState(() {
        sales.add(Sale(product: product, quantity: quantity));
        productController.clear();
        quantityController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Generate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: productController,
              decoration: const InputDecoration(
                labelText: 'Product',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateSale,
              child: const Text('Generate Sale'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sales Made:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  Sale sale = sales[index];
                  return ListTile(
                    title: Text(sale.product),
                    subtitle: Text('Quantity: ${sale.quantity}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sale {
  final String product;
  final int quantity;

  Sale({required this.product, required this.quantity});
}

import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  final List<Expense> expenses = [
    Expense(description: 'Cereals', amount: 150),
    Expense(description: 'Dairy', amount: 50),
    Expense(description: 'Poultry', amount: 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Expenses:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  Expense expense = expenses[index];
                  return ListTile(
                    title: Text(expense.description),
                    subtitle: Text('Amount: \$${expense.amount}'),
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

class Expense {
  final String description;
  final double amount;

  Expense({required this.description, required this.amount});
}

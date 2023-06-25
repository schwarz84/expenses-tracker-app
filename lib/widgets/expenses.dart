import 'package:flutter/material.dart';

import '../models/models.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Curso de Flutter', amount: 12.49, date: DateTime.now(), category: Category.educacion),
    Expense(title: 'Cine', amount: 10.25, date: DateTime.now(), category: Category.ocio)
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Aqui va los Charts'),
          Text('Aqui va la lista de gastos')
        ],
      ),
    );
  }
}
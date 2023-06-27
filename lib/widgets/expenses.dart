import 'package:flutter/material.dart';

import 'package:expenses_tracker/widgets/widgets.dart';
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
    Expense(title: 'Cine', amount: 10.25, date: DateTime.now(), category: Category.ocio),
    Expense(title: 'FCI', amount: 100000, date: DateTime.now(), category: Category.ahorro),
    Expense(title: 'Viaje a Monaco', amount: 60000.20, date: DateTime.now(), category: Category.viajes),
    Expense(title: 'Hamburgesa', amount: 9.77, date: DateTime.now(), category: Category.comida)
  ];

  void _addNewExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Gastos'),
        actions: [
          IconButton(
            onPressed: _addNewExpenseModal,
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Aqui va los Charts'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}
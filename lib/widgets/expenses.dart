import 'dart:math';

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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense)
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Eliminado con exito!!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Lista Vacia'),
    );

    if(_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }
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
            child: mainContent
          )
        ],
      ),
    );
  }
}
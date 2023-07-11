import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy');

const uuid = Uuid();

enum Category {trabajo, ocio, viajes, comida, ahorro, educacion}

const categoryIcons = {
  Category.trabajo: Icons.work,
  Category.ocio: Icons.movie,
  Category.viajes: Icons.flight_takeoff,
  Category.comida: Icons.local_grocery_store,
  Category.ahorro: Icons.account_balance_outlined,
  Category.educacion: Icons.school
};

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateFormatter {
    return formatter.format(date);
  }
}

class ExpensesBucket {
  const ExpensesBucket({required this.expenses, required this.category});

  ExpensesBucket.forCategory({required List<Expense> allExpenses, required this.category})
    : expenses = allExpenses
        .where((expense) => expense.category == category)
        .toList();

  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double result = 0;

    for(final expense in expenses) {
      result += expense.amount;
    }
    return result;
  }


}
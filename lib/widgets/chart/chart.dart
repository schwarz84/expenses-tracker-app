import 'package:flutter/material.dart';

import 'package:expenses_tracker/widgets/chart/chart_bar.dart';
import 'package:expenses_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpensesBucket> get buckets {
    return [
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.trabajo),
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.ocio),
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.viajes),
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.comida),
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.ahorro),
      ExpensesBucket.forCategory(allExpenses: expenses, category: Category.educacion),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
            children: [
              Expanded(
                child: Row(
                  children: buckets.map(
                          (bucket) => SizedBox(
                            width: 200,
                            child: Text(
                                bucket.totalExpenses.toStringAsFixed(2),
                              textAlign: TextAlign.center,
                            ),
                          )
                  ).toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final bucket in buckets) // alternative to map()
                      SizedBox(
                        width: 200,
                        child: ChartBar(
                          fill: bucket.totalExpenses == 0
                              ? 0
                              : bucket.totalExpenses / maxTotalExpense,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: buckets
                    .map(
                      (bucket) => SizedBox(
                        width: 200,
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              categoryIcons[bucket.category],
                              color: isDarkMode
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
      ]
        ),
      ),
    );
  }
}

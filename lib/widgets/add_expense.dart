import 'package:flutter/material.dart';

import 'package:expenses_tracker/models/models.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.addExpense});

  void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  Category _selectedCategory = Category.ahorro;

  void _showDataPicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1, now.month, now.day);
    final pickerDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      locale: const Locale('es')
    );
    setState(() {
      _selectedDate = pickerDate;
    });
  }

  void _addExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || invalidAmount || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Alguno de los datos son incorrectos. Reviselos!!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text(
                  'Cerrar',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error
                  ),
                )
              )
            ],
          );
        });
      return ;
    }
    Navigator.pop(context);
    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory
      )
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Titulo')
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Monto'),
                    prefixText: '\$ '
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null ? 'Seleccionar Fecha' : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _showDataPicker,
                      icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()));
                }).toList(),
                onChanged: (value) {
                  if(value == null) {
                    return ;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: _addExpense,
                child: const Text('Agregar Gasto'))
            ],
          )
        ],
      ),
    );
  }
}
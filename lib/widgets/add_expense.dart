import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _showDataPicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1, now.month, now.day);
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      locale: const Locale('es')
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
      padding: const EdgeInsets.all(20),
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
              const Spacer(),
              Row(
                children: [
                  const Text('Seleccionar Fecha'),
                  IconButton(
                    onPressed: _showDataPicker,
                    icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Agregar Gasto'))
            ],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import  'package:expense_tracker/models/expense.dart';

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _PresentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firstDate, 
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Amount',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? 'No Date Selected' : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () {
                        _PresentDatePicker();
                      },
                      icon: Icon(Icons.calendar_month),
                    )
                  ],
                )
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(children: [
            DropdownButton(items: Category.values.map((category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.toUpperCase()),
            )).toList(),
            onChanged: (value) {
              setState(() {
                if (value == null) {
                  return;
                }
                _selectedCategory = value;
              });
            },
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              },
              child: const Text('Save Expense'),
            )
          ],)
        ],
      ),
    );
  }
}
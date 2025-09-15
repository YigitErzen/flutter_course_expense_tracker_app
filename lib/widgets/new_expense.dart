import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
 var enteredTitle = '';

 void SaveTitleInput(String inputValue) {
   enteredTitle = inputValue;
 }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: SaveTitleInput,
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                print(enteredTitle);
              },
              child: const Text('Save Expense'),
            )
          ],)
        ],
      ),
    );
  }
}
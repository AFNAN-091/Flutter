import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:http/http.dart' as http;  

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpense,{super.key});

  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // inputText
  // String inputValue = '';
  // void inputTitle(String val) {
  //   inputValue = val;
  // }

  final inputTitle = TextEditingController();
  final amount = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;
  void presentDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final lastDate = DateTime(now.year + 5, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void submitExpense() {
    final enteredAmount = double.tryParse(amount.text);

    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (inputTitle.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) =>  AlertDialog(
          title: const Text('Error!!!'),
          content: const Text('Please enter valid title ,amount and date!'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child:const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.addExpense(
      Expense(
        title: inputTitle.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory,
      ),
    );

    Navigator.pop(context);

    
  }

  @override
  void dispose() {
    inputTitle.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keySpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(16, 16,16, keySpace+16),
          child: Column(
            children: [
              TextField(
                controller: inputTitle,
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: amount,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixText: '\$ ', labelText: 'Amount'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(selectedDate == null
                            ? 'Selected Date'
                            : formatter.format(selectedDate!)),
                        IconButton(
                            onPressed: presentDate,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  DropdownButton(
                      value: selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          selectedCategory = value;
                        });
                      }),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: submitExpense,
                    child: const Text('Save Title'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

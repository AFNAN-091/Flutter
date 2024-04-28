import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
        title: 'New Shoes',
        amount: 90.00,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);

    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
        // backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          // backgroundColor: Colors.amber[800],
          title: const Text('Expenses Tracker'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpense),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpense)),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ));
  }
}

import 'package:expense_tracker/expenese_Item.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, required this.onRemoveExpense, super.key});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(
          color: Colors.white,
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        child: ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}

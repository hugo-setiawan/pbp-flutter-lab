import 'dart:collection';

import 'package:flutter/material.dart';

class Budget {
  const Budget(this.judulBudget, this.nominalBudget, this.jenisBudget);

  final String judulBudget;
  final int nominalBudget;
  final String jenisBudget;
}

class BudgetModel extends ChangeNotifier {
  // Internal, private state of all budgets
  final List<Budget> _budgetList = [];

  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgetList);

  void add(Budget newBudget) {
    _budgetList.add(newBudget);
    notifyListeners();
  }
}

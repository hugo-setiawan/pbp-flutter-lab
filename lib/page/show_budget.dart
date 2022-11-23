import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/budget_model.dart';

class BudgetShowPage extends StatefulWidget {
  const BudgetShowPage({super.key});

  @override
  State<BudgetShowPage> createState() => _BudgetShowPageState();
}

class _BudgetShowPageState extends State<BudgetShowPage> {
  List<Budget> budgetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const MyDrawer(),

      // Body data page mengambil (consume) data BudgetModel
      body: Consumer<BudgetModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.budgets.length,
            itemBuilder: (context, index) {
              var eachBudget = value.budgets[index];

              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        eachBudget.judulBudget, 
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(eachBudget.nominalBudget.toString()),
                          Text(eachBudget.jenisBudget),
                        ],
                      )
                    ],
                  ),
                ),
              );

            },

          );

        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/models.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetShowPage()),
                );
              },
            ),
          ],
        ),
      ),

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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(eachBudget.judulBudget),
                      const SizedBox(height: 8),
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
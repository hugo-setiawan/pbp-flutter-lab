import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {
  final _formKey = GlobalKey<FormState>();

  // var untuk menyimpan keperluan form
  String _judulBudget = "";
  int _nominalBudget = 0;
  final List<String> _daftarJenisPengeluaranBudget = <String>[
    "Pemasukan",
    "Pengeluaran",
  ];
  String _jenisPengeluaranBudget = "Pemasukan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Judul Budget",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // hanya boleh memasukkan angka
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: "Nominal Budget",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // dikosongkan dengan sengaja, perlu validasi dgn validator
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nominalBudget = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    }

                    try {
                      int.parse(value);
                    } on FormatException {
                      return 'Nominal bukan berupa angka valid!';
                    }

                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Jenis Pengeluaran",
                      hintText: "Pilih Jenis",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                  // value: _jenisPengeluaranBudget,
                  items: _daftarJenisPengeluaranBudget.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenisPengeluaranBudget = newValue!;
                    });
                  }, // TODO validasi ada opsi dipilih
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
              ),
              TextButton(
                onPressed: () {}, // TODO save data on press, handling data model etc.
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.black),
                )
              )
            ]),
          ),
        ),
      ),
    );
  }
}

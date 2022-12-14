import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/budget_model.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {
  final _formKey = GlobalKey<FormState>();

  // var untuk menyimpan keperluan form
  String? _judulBudget;
  int? _nominalBudget;
  final List<String> _daftarJenisPengeluaranBudget = <String>[
    "Pemasukan",
    "Pengeluaran",
  ];

  // Nullable, null <-> jika blm ada jenis yg dipilih
  String? _jenisBudget;

  // fungsi untuk menyimpan budget ke Model, akan dipanggil saat simpan ditekan
  bool saveBudget() {
    if (_formKey.currentState!.validate()) {
      final Budget newBudget =
          Budget(_judulBudget!, _nominalBudget!, _jenisBudget!);

      Provider.of<BudgetModel>(context, listen: false).add(newBudget);

      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const MyDrawer(),
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
                      int? newNominal = int.tryParse(value!);

                      if (!(newNominal == null)) {
                        _nominalBudget = newNominal;
                      }
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

                    if (int.tryParse(value) == null) {
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
                      )),
                  // value: _jenisPengeluaranBudget,
                  items: _daftarJenisPengeluaranBudget
                      .map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenisBudget = newValue!;
                    });
                  },
                  validator: (value) {
                    // value null <-> blm ada yg dipilih
                    if (value == null) {
                      return "Jenis tidak boleh kosong!";
                    }

                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
              ),
              TextButton(
                  onPressed: () {
                    // saveBudget return true <-> data berhasil tersimpan
                    if (saveBudget()) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(
                                    child: Text(
                                      "Data budget berhasil disimpan!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  TextButton(
                                    onPressed: () {
                                      // pop untuk menutup dialog box
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        )
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

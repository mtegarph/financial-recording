import 'package:financial_recording/features/financial/presentation/bloc/add_financial_bloc/add_financial_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionSheet extends StatefulWidget {
  const AddTransactionSheet({super.key});

  @override
  _AddTransactionSheetState createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  String description = '';
  String category = 'Pemasukan'; // Default category
  double amount = 0.0;

  void _submitTransaction(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<AddFinancialBloc>().add(AddData(
          description: description,
          value: amount.toString(),
          category: category));
      Navigator.pop(context); // Close the modal sheet
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              onSaved: (value) => description = value!,
              validator: (value) => value!.isEmpty ? 'Enter description' : null,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Category'),
              value: category,
              items: ['Pemasukan', 'Pengeluaran'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
              onSaved: (value) => category = value!,
              validator: (value) => value == null ? 'Select a category' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSaved: (value) => amount = double.parse(value!),
              validator: (value) => value!.isEmpty ? 'Enter amount' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitTransaction(context),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}

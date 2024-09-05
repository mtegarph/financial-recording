import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/presentation/bloc/add_financial_bloc/add_financial_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionSheet extends StatefulWidget {
  final FinancialRecordEntity? financialRecordEntity;
  const AddTransactionSheet({super.key, this.financialRecordEntity});

  @override
  _AddTransactionSheetState createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  String description = '';
  String category = 'Pemasukan';
  double amount = 0.0;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      description = widget.financialRecordEntity?.description ?? '';
      amount = double.parse(widget.financialRecordEntity?.value ?? '0.0');
      category = widget.financialRecordEntity?.category ?? 'Pemasukan';
      _amountController = TextEditingController(text: amount.toString());
      _descriptionController = TextEditingController(text: description);
    });
  }

  void _submitTransaction(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.financialRecordEntity != null
          ? context.read<AddFinancialBloc>().add(UpdateData(
              financialRecordEntity: FinancialRecordEntity(
                  id: widget.financialRecordEntity?.id,
                  description: description,
                  value: amount.toString(),
                  category: category,
                  date: DateTime.now())))
          : context.read<AddFinancialBloc>().add(AddData(
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
              controller: _descriptionController,
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
              controller: _amountController,
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

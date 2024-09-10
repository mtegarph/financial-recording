import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/entities/mix_financial_record.dart';
import 'package:financial_recording/features/financial/presentation/bloc/bloc/financial_count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionSheet extends StatefulWidget {
  final FinancialRecordEntity? financialRecordEntity;
  const AddTransactionSheet({super.key, this.financialRecordEntity});

  @override
  AddTransactionSheetState createState() => AddTransactionSheetState();
}

class AddTransactionSheetState extends State<AddTransactionSheet> {
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
      final dataUpdate = FinancialRecordEntity(
          id: widget.financialRecordEntity?.id,
          description: description,
          value: amount.toString(),
          category: category,
          createdAt: DateTime.now().toString(),
          currency: 'Rp',
          deletedAt: DateTime.now().toString(),
          image: DateTime.now().toString(),
          name: description,
          note: description,
          status: description,
          subCategory: description,
          time: description,
          type: description,
          updatedAt: description,
          date: DateTime.now(),
          amount: '');

      debugPrint(dataUpdate.toJson().toString());
      widget.financialRecordEntity != null
          ? context
              .read<FinancialCountBloc>()
              .add(FinancialCountEvent.updateData(dataUpdate))
          : context.read<FinancialCountBloc>().add(FinancialCountEvent.addData(
              description, amount.toString(), category));
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

import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/presentation/bloc/add_financial_bloc/add_financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/get_data_bloc/financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/widgets/card_custom.dart';
import 'package:financial_recording/features/financial/presentation/widgets/show_modal_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTransactionModal(context, null);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Financial Recording'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FinancialBloc, FinancialState>(
              builder: (context, state) {
                if (state is FinancialLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FinancialLoaded) {
                  // Filter transactions based on selected category and date
                  final filteredTransactions =
                      state.financialRecordEntity.where((transaction) {
                    final matchesCategory = selectedCategory == 'All' ||
                        transaction.category == selectedCategory;
                    final matchesDate = selectedDate == null ||
                        _isSameDate(transaction.date, selectedDate!);
                    return matchesCategory && matchesDate;
                  }).toList();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            children: [
                              CardCustom(
                                  title: 'Total Saldo',
                                  total: state.totalBalance),
                              CardCustom(
                                  title: 'Total Pemasukan',
                                  total: state.totalIncome.toString()),
                              CardCustom(
                                  title: 'Total Pengeluaran',
                                  total: state.totalExpenses.toString()),
                            ],
                          ),
                        ),
                        _buildFilterOptions(context),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredTransactions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final transaction = filteredTransactions[index];
                            return GestureDetector(
                              onLongPress: () {
                                _showDeleteDialog(transaction);
                              },
                              onTap: () {
                                _showAddTransactionModal(context, transaction);
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(transaction.description),
                                  subtitle: Text(transaction.value),
                                  trailing: Text(transaction.category),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else if (state is FinancialError) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                return const Center(
                  child: Text('kosong'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog(FinancialRecordEntity transaction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BlocConsumer<AddFinancialBloc, AddFinancialState>(
          listener: (context, state) {
            if (state is AddFinancialSuccess) {
              context.read<FinancialBloc>().add(GetDataEvent());
            }
          },
          builder: (context, state) {
            return AlertDialog(
              title: const Text('Delete Data'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Apakah Anda Yakin Ingin Menghapus Data ?'),
                    Text('Data yang sudah di hapus tidak bisa balik lagi'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Tidak'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ya'),
                  onPressed: () {
                    context
                        .read<AddFinancialBloc>()
                        .add(DeleteData(financialRecordEntity: transaction));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildFilterOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedCategory,
              items: ['All', 'Pemasukan', 'Pengeluaran'].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
          ),
          if (selectedDate != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  selectedDate = null;
                });
              },
            ),
        ],
      ),
    );
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void _showAddTransactionModal(
      BuildContext context, FinancialRecordEntity? data) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<AddFinancialBloc, AddFinancialState>(
            listener: (context, state) {
              if (state is AddFinancialSuccess) {
                context.read<FinancialBloc>().add(GetDataEvent());
              }
            },
            builder: (context, state) {
              return AddTransactionSheet(
                financialRecordEntity: data,
              );
            },
          ),
        );
      },
    );
  }
}

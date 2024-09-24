import 'package:financial_recording/core/firebase/firebase_remote_config.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/presentation/bloc/bloc/financial_count_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/get_data_bloc/financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/widgets/card_custom.dart';
import 'package:financial_recording/features/financial/presentation/widgets/show_modal_custom.dart';
import 'package:financial_recording/features/weather/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  DateTime? selectedDate;
  String welcomeText = '';
  @override
  void initState() {
    super.initState();
    welcomeText = remoteConfig.getString('welcome_text');
    getWelcomeText().then(
      (value) {
        setState(() {
          welcomeText = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton(
            onPressed: () {
              _showAddTransactionModal(context, null);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherPage(),
                  ));
            },
            child: const Icon(Icons.sunny),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Hallo'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: BlocListener<FinancialBloc, FinancialState>(
              listener: (context, state) {
                if (state is FinancialLoaded) {
                  debugPrint('ip address: ${state.ipAddress}');
                  if (state.ipAddress == '192.168.1.9') {
                    if (state.isUpdate == true) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentMaterialBanner()
                        ..showMaterialBanner(
                          const MaterialBanner(
                            content: Text('An update is available!'),
                            actions: [Text('iya')],
                          ),
                        );
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentMaterialBanner()
                        ..showMaterialBanner(
                          const MaterialBanner(
                            content: Text('Theres no update available!'),
                            actions: [Text('iya')],
                          ),
                        );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(
                      const MaterialBanner(
                        content: Text('your device is not get the update'),
                        actions: [Text('iya')],
                      ),
                    );
                }
              },
              child: BlocBuilder<FinancialBloc, FinancialState>(
                builder: (context, state) {
                  if (state is FinancialLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FinancialLoaded) {
                    final filteredTransactions =
                        state.financialRecordEntity.where((transaction) {
                      final matchesCategory = selectedCategory == 'All' ||
                          transaction.category == selectedCategory;
                      final matchesDate = selectedDate == null ||
                          _isSameDate(transaction.date, selectedDate!);
                      return matchesCategory && matchesDate;
                    }).toList();

                    return homePage(context, filteredTransactions,
                        state: state);
                  } else if (state is FinancialError) {
                    return homePage(context, []);
                  }
                  return const Center(
                    child: Text('kosong'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView homePage(
      BuildContext context, List<FinancialRecordEntity> filteredTransactions,
      {FinancialLoaded? state}) {
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
                    title: state == null ? 'Total Saldo' : 'total saldo',
                    total: state == null ? '' : state.totalBalance),
                CardCustom(
                    title: 'Total Pemasukan',
                    total: state == null ? '' : state.totalIncome.toString()),
                CardCustom(
                    title: 'Total Pengeluaran',
                    total: state == null ? '' : state.totalExpenses.toString()),
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
                    leading: Text(transaction.id.toString()),
                  ),
                ),
              );
            },
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
        return BlocConsumer<FinancialCountBloc, FinancialCountState>(
          listener: (context, state) {
            if (state.isSuccess == true) {
              context.read<FinancialBloc>().add(GetDataEvent());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
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
                        .read<FinancialCountBloc>()
                        .add(FinancialCountEvent.deleteData(transaction));
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
          child: BlocConsumer<FinancialCountBloc, FinancialCountState>(
            listener: (context, state) {
              if (state.isSuccess == true) {
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

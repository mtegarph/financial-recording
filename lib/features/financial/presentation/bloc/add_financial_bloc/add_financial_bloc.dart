import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/usecases/add_financial.dart';

part 'add_financial_event.dart';
part 'add_financial_state.dart';

class AddFinancialBloc extends Bloc<AddFinancialEvent, AddFinancialState> {
  final AddFinancialUsecase addFinancialUsecase;

  AddFinancialBloc(this.addFinancialUsecase) : super(AddFinancialInitial()) {
    on<AddData>(_addFinancial);
  }
  void _addFinancial(AddData event, Emitter<AddFinancialState> emit) async {
    emit(AddFinancialLoading());
    try {
      final data = FinancialRecordEntity(
          date: DateTime.now(),
          description: event.description,
          value: event.value,
          category: event.category);
      await addFinancialUsecase.call(params: data);
      emit(AddFinancialSuccess());
    } catch (e) {
      emit(AddFinancialError(message: e.toString()));
    }
  }
}

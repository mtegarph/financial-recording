import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class AddFinancialUsecase extends UseCase<void, FinancialRecordEntity> {
  final FinancialRepositories financialRepositories;

  AddFinancialUsecase({required this.financialRepositories});

  @override
  Future<void> call({FinancialRecordEntity? params}) {
    // TODO: implement call
    return financialRepositories.create(params!);
  }
}

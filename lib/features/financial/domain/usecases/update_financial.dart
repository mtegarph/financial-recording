import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class UpdateFinancialUsecase extends UseCase<void, FinancialRecordEntity> {
  final FinancialRepositories financialRepositories;

  UpdateFinancialUsecase({required this.financialRepositories});

  @override
  Future<void> call({FinancialRecordEntity? params}) {
    // TODO: implement call
    return financialRepositories.update(params!);
  }
}

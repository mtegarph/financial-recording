import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/financial/domain/entities/financial_record_entity.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class ListFinancialUseCase
    implements UseCase<List<FinancialRecordEntity>, void> {
  final FinancialRepositories financialRepositories;

  ListFinancialUseCase({required this.financialRepositories});

  @override
  Future<List<FinancialRecordEntity>> call({void params}) {
    // TODO: implement call
    return financialRepositories.findAll();
  }
}

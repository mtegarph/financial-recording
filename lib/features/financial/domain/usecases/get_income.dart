import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class GetIncomeUseCase implements UseCase<double, void> {
  final FinancialRepositories financialRepositories;

  GetIncomeUseCase({required this.financialRepositories});

  @override
  Future<double> call({void params}) {
    // TODO: implement call
    return financialRepositories.getTotalIncome();
  }
}

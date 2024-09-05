import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';

class GetBalanceUseCase implements UseCase<String, void> {
  final FinancialRepositories financialRepositories;

  GetBalanceUseCase({required this.financialRepositories});

  @override
  Future<String> call({void params}) {
    // TODO: implement call
    return financialRepositories.getTotalBalance();
  }
}

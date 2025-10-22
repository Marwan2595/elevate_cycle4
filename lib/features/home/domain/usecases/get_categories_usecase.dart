import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  GetCategoriesUseCase(this.repo);
  final HomeRepoContract repo;

  Future<List<CategoryModel>> call() => repo.getCategories();
}

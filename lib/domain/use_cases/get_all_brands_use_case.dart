import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:e_commerce_app/domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetAllBrandsUseCase{
  final BrandRepository brandRepository;
  GetAllBrandsUseCase({required this.brandRepository});

  Future<List<Category>?> invoke(){
    return brandRepository.getAllBrands();
  }

}
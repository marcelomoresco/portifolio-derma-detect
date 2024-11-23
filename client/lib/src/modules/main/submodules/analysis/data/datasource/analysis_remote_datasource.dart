import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/analysis_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

abstract class AnalysisRemoteDatasource {
  Future<Analysis> create(CreateAnalysisUsecaseParams params);

  Future<Analysis> getById(GetByIdAnalysisUsecaseParams params);

  Future<List<Analysis>> getAll();
  Future<List<Analysis>> getRecents();
}

class AnalysisRemoteDatasourceImpl implements AnalysisRemoteDatasource {
  AnalysisRemoteDatasourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;

  @override
  Future<Analysis> create(CreateAnalysisUsecaseParams params) async {
    FormData formData = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(
          params.file.path,
          filename: basename(params.file.path),
        ),
      },
    );

    final response = await _networkService.post(
      ClientRequest(
        path: "/analyses/",
        formData: formData,
      ),
    );
    try {
      Analysis result = AnalysisModel.fromJson(response.body);
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }

  @override
  Future<List<Analysis>> getAll() async {
    final response = await _networkService.get(
      const ClientRequest(
        path: "/analyses/",
      ),
    );
    try {
      List<Analysis> result = (response.body as List).map((e) => AnalysisModel.fromJson(e)).toList();
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }

  @override
  Future<Analysis> getById(GetByIdAnalysisUsecaseParams params) async {
    final response = await _networkService.get(
      ClientRequest(
        path: "/analyses/${params.id}",
      ),
    );
    try {
      Analysis result = AnalysisModel.fromDetailJson(response.body);
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }

  @override
  Future<List<Analysis>> getRecents() async {
    final response = await _networkService.get(
      const ClientRequest(
        path: "/analyses/recents",
      ),
    );
    try {
      List<Analysis> result = (response.body as List).map((e) => AnalysisModel.fromJson(e)).toList();
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }
}

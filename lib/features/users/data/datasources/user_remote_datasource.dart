import '../models/user_model.dart';
import '../../../../core/network/api_client.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await apiClient.dio.get('/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("Error al obtener usuarios de la API");
    }
  }
}

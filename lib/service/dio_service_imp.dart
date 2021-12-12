import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:movieapp/service/dio_sevice.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/4/',
      headers: {
        'content-type': 'application/json;charset=utf-8',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDczMWVhM2M5NmMyMWM2MjI1ZTcxOWVkZTlhYzlmMCIsInN1YiI6IjYxOWE5ZjVlNWMwNzFiMDA5MjEwMzdhZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.d93TBK3kKYqrYyLi3d7YnbcHd3J7e9a0MXknGn0R_FM'
      },
    ));
  }
}

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:duel_links_decks/support/exections/ResponseErroException.dart';
import 'package:duel_links_decks/support/exections/UnauthorizedException.dart';

///Classe responsavel por realizar conexões com API
class Con{

  final String urlBase;
  final bool debug;
  Dio _dio;
  Con(this.urlBase, {this.debug = false}){
    _dio = Dio();
    _dio.options.baseUrl = urlBase;
  }

  void addInterceptor(InterceptorsWrapper interceptor){
    _dio.interceptors.add(interceptor);
  }

  /// Método que executa chamada de conexão do tipo GET
  /// @params uri
  /// @params headers (opcional)
  Future <dynamic> get(String uri, {Map<String,String> headers}) async{

    Response response;

    try{

      final op = Options(headers: headers);
      response = await _dio.get(uri,options: op);
      if(debug) print("[${DateTime.now().toString()}]($uri) <-- $response");
    }on DioError catch(e){

      if(e.error is SocketException){
        throw new ResponseErroException("Without Internet",e.response.statusCode);
      }

      int statusCode = e.response.statusCode;
      print('Dio exeption: ($statusCode) ${e.response}');

      if(statusCode == 401){
        throw new UnauthorizedException(e.response.toString());
      }

      if(statusCode == 400){
        String msg = "";
        if(e.response.data["message"] != null){
          msg = e.response.data["message"];
        }else
        if(e.response.data["error"] != null){
          msg = e.response.data["error"];
        }
        throw new ResponseErroException(msg,e.response.statusCode);
      }

      if(statusCode == 403){
        return e.response.data;
      }

    }

    return response.data;

  }

  /// Método que executa chamada de conexão do tipo POST
  /// @params uri
  /// @params body
  /// @params headers (opcional)
  Future <dynamic> post(String uri,dynamic body, {Map<String,String> headers}) async{

    Response response;

    try{
      if(debug) print("[${DateTime.now().toString()}]($uri) --> $body");
      final op = Options(headers: headers);
      response = await _dio.post(uri,data: body,options: op);
      if(debug) print("[${DateTime.now().toString()}]($uri) <-- $response");
    }on DioError catch(e){

      if(e.error is SocketException){
        throw new ResponseErroException("Without Internet",e.response.statusCode);
      }

      int statusCode = e.response.statusCode;
      print('Dio exeption: ($statusCode) ${e.response}');

      if(statusCode == 401){
        throw new UnauthorizedException(e.response.toString());
      }

      if(statusCode == 400){
        String msg = "";
        if(e.response.data["message"] != null){
          msg = e.response.data["message"];
        }else
        if(e.response.data["error"] != null){
          msg = e.response.data["error"];
        }
        throw new ResponseErroException(msg,e.response.statusCode);
      }

      if(statusCode == 403){
        return e.response.data;
      }

    }

    return response.data;

  }

  /// Método que executa chamada de conexão do tipo PUT
  /// @params uri
  /// @params body
  /// @params headers (opcional)
  Future <dynamic> put(String uri,dynamic body, {Map<String,String> headers}) async{

    Response response;

    try{

      if(debug) print("[${DateTime.now().toString()}]($uri) --> $body");
      final op = Options(headers: headers);
//      op.contentType = "application/x-www-form-urlencoded";
      response = await _dio.put(uri,data: body,options: op);
      if(debug) print("[${DateTime.now().toString()}]($uri) <-- $response");

    }on DioError catch(e){

      if(e.error is SocketException){
        throw new ResponseErroException("Without Internet",e.response.statusCode);
      }

      int statusCode = e.response.statusCode;
      print('Dio exeption: ($statusCode) ${e.response}');

      if(statusCode == 401){
        throw new UnauthorizedException(e.response.toString());
      }

      if(statusCode == 400){
        String msg = "";
        if(e.response.data["message"] != null){
          msg = e.response.data["message"];
        }else
        if(e.response.data["error"] != null){
          msg = e.response.data["error"];
        }
        throw new ResponseErroException(msg,e.response.statusCode);
      }

      if(statusCode == 403){
        return e.response.data;
      }

    }

    return response.data;

  }

  /// Método que executa chamada de conexão do tipo DELETE
  /// @params uri
  /// @params headers (opcional)
  Future <dynamic> delete(String uri, {Map<String,String> headers}) async{

    Response response;

    try{

      final op = Options(headers: headers);
      response = await _dio.delete(uri,options: op);
      if(debug) print("[${DateTime.now().toString()}]($uri) <-- $response");

    }on DioError catch(e){

      if(e.error is SocketException){
        throw new ResponseErroException("Without Internet",e.response.statusCode);
      }

      int statusCode = e.response.statusCode;
      print('Dio exeption: ($statusCode) ${e.response}');

      if(statusCode == 401){
        throw new UnauthorizedException(e.response.toString());
      }

      if(statusCode == 400){
        String msg = "";
        if(e.response.data["message"] != null){
          msg = e.response.data["message"];
        }else
        if(e.response.data["error"] != null){
          msg = e.response.data["error"];
        }
        throw new ResponseErroException(msg,e.response.statusCode);
      }

      if(statusCode == 403){
        return e.response.data;
      }

    }

    return response.data;

  }

}

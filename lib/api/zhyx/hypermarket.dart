import 'package:app/api/model/response.dart';
import 'package:app/api/model/system/user.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/hypermarket/model.dart';
import 'package:app/view/zhyx/product/model.dart';

class HypermarketApi {
  /// TODO 创建超市
  // static Future<ServerResponse<dynamic>> createHypermarket({
  //   dynamic data,
  //   Map<String, dynamic>? params,
  // }) async {
  //   var response = await HttpUtil().post(
  //     '/hypermarket/createHypermarket',
  //     queryParameters: params,
  //     data: data,
  //   );
  //   return ServerResponse<DataPage>.fromJson(response, DataPage.fromJson);
  // }

  /// TODO 删除超市
  static Future<ServerResponse<dynamic>> deleteHypermarket(params) async {
    var response = await HttpUtil().delete(
      '/hypermarket/deleteHypermarket',
      queryParameters: params,
    );
    return ServerResponse<UserInfoResponseData>.fromJson(response,
        fromJsonT: UserInfoResponseData.fromJson);
  }

  /// TODO 用id查询超市
  static Future<ServerResponse<dynamic>> findHypermarket(params) async {
    var response = await HttpUtil().get(
      '/hypermarket/findHypermarket',
      queryParameters: params,
    );
    return ServerResponse<UserInfoResponseData>.fromJson(response,
        fromJsonT: UserInfoResponseData.fromJson);
  }

  /// 分页获取超市列表
  static Future<ServerResponse<DataPage<Hypermarket>>> getHypermarketList(
      Map<String, dynamic>? queryParameters) async {
    var response = await HttpUtil().get(
      '/hypermarket/getHypermarketList',
      queryParameters: queryParameters,
    );
    return ServerResponse<DataPage<Hypermarket>>.fromJson(response,
        fromJsonT: (data) =>
            DataPage.fromJson(data, (item) => Hypermarket.fromJson(item)));
  }

  static Future<ServerResponse<DataPage<Product>>> getHypermarketProductList(
      Map<String, dynamic> queryParameters) async {
    var response = await HttpUtil().get(
      '/hypermarket/getHypermarketProductList',
      queryParameters: queryParameters,
    );
    logger.i("超市商品列表: ${response.toString()}");
    return ServerResponse<DataPage<Product>>.fromJson(response,
        fromJsonT: (data) =>
            DataPage.fromJson(data, (item) => Product.fromJson(item)));
  }
}

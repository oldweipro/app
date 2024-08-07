import 'package:app/core/router/routes.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketProductListPage extends GetView<HypermarketController> {
  const HypermarketProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 接收传递的参数
    final hypermarketId = Get.arguments;
    controller.getHypermarketProductList(hypermarketId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品列表'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              logger.i("等一下: ${hypermarketId}");
              // 跳转到新增商品页面，假设路由名为'/product/add'
              Get.toNamed(AppRoutes.hypermarketProductAdd,
                  arguments: hypermarketId);
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.state.productList.value.isEmpty
            ? const Center(
                child: Text(
                  '暂无商品数据',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: controller.state.productList.value.length,
                itemBuilder: (context, index) {
                  final product = controller.state.productList.value[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        product.image ??
                            'https://oss.gds.org.cn/userfile1/wechat/2023592993617901271.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        product.name ?? 'Unknown Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '条码: ${product.barcode}\n产地: ${product.placeOrigin}\n规格: ${product.norm}\n计价单位: ${product.unit}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      onTap: () {
                        // 假设路由名为'/product/detail'，并传递商品ID
                        // Get.toNamed(AppRoutes.productDetail,
                        //     arguments: product.id);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

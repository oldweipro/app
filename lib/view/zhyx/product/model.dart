import 'package:app/api/model/base_model.dart';

class Product extends BaseModel {
  String? name; // 商品名称
  String? barcode; // 商品名称
  String? sn; // 商品名称
  String? sku; // 最小存货单位
  String? image; // 图片
  String? placeOrigin; // 产地
  String? norm; // 规格
  String? unit; // 计价单位

  Product({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    this.name,
    this.barcode,
    this.sn,
    this.sku,
    this.image,
    this.placeOrigin,
    this.norm,
    this.unit,
  });

  // 将 JSON 数据转换为 Product 对象
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      createdAt:
          json['CreatedAt'] != null ? DateTime.parse(json['CreatedAt']) : null,
      updatedAt:
          json['UpdatedAt'] != null ? DateTime.parse(json['UpdatedAt']) : null,
      createdBy: json['CreatedBy'],
      updatedBy: json['UpdatedBy'],
      deletedBy: json['DeletedBy'],
      name: json['name'],
      barcode: json['barcode'],
      sn: json['sn'],
      sku: json['sku'],
      image: json['image'],
      placeOrigin: json['placeOrigin'],
      norm: json['norm'],
      unit: json['unit'],
    );
  }

  // 将 Product 对象转换为 JSON 数据
  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'name': name,
      'barcode': barcode,
      'sn': sn,
      'sku': sku,
      'image': image,
      'placeOrigin': placeOrigin,
      'norm': norm,
      'unit': unit,
    });
    return json;
  }
}

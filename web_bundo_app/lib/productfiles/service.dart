
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_bundo_app/productfiles/product_api.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var productList = <Products1>[].obs;
  var _product = {}.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }

  void addProduct(Products1 product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
    } else {
      _product[product] = 1;
    }
    Get.snackbar(
      'Product Added',
      'You have added the ${product.name} to the Cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Products1 product) {
    if (_product.containsKey(product) && _product[product] == 1) {
      _product.removeWhere((key, value) => key == product);
    } else {
      _product[product] -= 1;
    }
  }
void clear() {
    _product = {}.obs;
  }

  get product => _product;

  get productSubtotal => _product.entries
      .map((prducts) => prducts.key.price * prducts.value)
      .toList();

  get total => _product.entries
      .map((prducts) => prducts.key.price * prducts.value)
      .toList()
      .reduce((value, element) => (value + element));
}

class RemoteServices {
  static var client = http.Client();

  static Future<List<Products1>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse("https://apiappmobile.suekisnv.repl.co/products1"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
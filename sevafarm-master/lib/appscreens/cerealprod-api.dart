import 'cerealprod.dart';
import 'package:http/http.dart' as http;
Future<List<Cerealprod>> fetchCerealprod() async {
  var url = Uri.parse(
      "http://192.168.18.15/sevafarm/sevafarm/products/cerealprod.php");
  final response = await http.get(url);
  return cerealprodFromJson(response.body);
}
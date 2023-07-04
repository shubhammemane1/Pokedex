
import 'package:pokedex/Utils/utils.dart';

import 'package:http/http.dart' as http;

class ApiRepository {
  var client = http.Client();

  // Future<List<Pokemon>> fetchPokemon() async {
  //   try {
  //     // var mapbody = jsonEncode(formData);
  //     var postResponse = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));
  //     logs("Status Code : ${postResponse.statusCode}");
  //     if (postResponse.statusCode == 200) {
  //       var responseData = postResponse.body;
  //       var data = jsonDecode(responseData);

  //       root.results.forEach((element) {
  //         listOfpokemon.add(element);
  //       });


  //       // for (var item in root.!) {
  //       //   listOfprops.add(item!);
  //       // }
  //       return listOfpokemon;
  //     } else {
  //       logs("API call failed with status code: ${postResponse.statusCode}");
  //       return [];
  //     }
  //   } catch (e) {
  //     logs("error : $e");
  //     return [];
  //   }
  // }

}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => getEnumValue(this).toUpperCase();
}

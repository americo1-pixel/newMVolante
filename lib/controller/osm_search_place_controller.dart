import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OsmSearchPlaceController extends GetxController {
  Rx<TextEditingController> searchTxtController = TextEditingController().obs;
  RxList<SearchInfo> suggestionsList = <SearchInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchTxtController.value.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    fetchAddress(searchTxtController.value.text);
  }

  fetchAddress(String text) async {
    log(":: fetchAddress (BO) :: $text");
    if (text.isEmpty) {
      suggestionsList.clear();
      return;
    }

    try {
      List<SearchInfo> results = await searchInBolivia(text);
      suggestionsList.value = results;
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<List<SearchInfo>> searchInBolivia(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&countrycodes=bo&format=json&addressdetails=1');

    final response = await http.get(
      url,
      headers: {
        "User-Agent": "YourAppName (contact@example.com)" // Nominatim requiere un User-Agent válido
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) {
        final lat = double.tryParse(e['lat']);
        final lon = double.tryParse(e['lon']);
        final address = e['display_name'];

        if (lat != null && lon != null) {
          return SearchInfo(
            point: GeoPoint(latitude: lat, longitude: lon),
            address: Address(
              country: e['address']['country'],
              name: address,
              // Agrega más campos si los necesitas
            ),
          );
        }
        return null;
      }).whereType<SearchInfo>().toList();
    } else {
      throw Exception("No se pudo obtener direcciones de Bolivia");
    }
  }
}

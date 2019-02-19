import 'package:bloc_example/models/districts.dart';

class DistrictRepository {
  Future<DistrictList> fetchDistricts({bool updated=false}) async {
    List<String> rawDistricts = [
      "Karonga",
      "Zomba",
      "Lilongwe",
      "Blantyre",
      "Mwanza",
      "Mangochi"
    ];

    List<String> otherDistricts = [
      "Mzimba",
      "Karonga",
      "Likoma",
      "Dedza"
    ];

    List<String> toGetFrom = updated ? otherDistricts : rawDistricts;
    await Future.delayed(Duration(seconds: 2));
    List<DistrictDetails> districts = toGetFrom
        .map((dist) => DistrictDetails(name: dist, id: dist))
        .toList();
    return DistrictList(districts: districts);
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_28/Models/premier_league_model.dart';

class ApiPremierLeagueService {
  final String url =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<List<PremierLeagueModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List PremierLeagueList = data['teams'];
      return PremierLeagueList.map((json) => PremierLeagueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Premier League');
    }
  }
}

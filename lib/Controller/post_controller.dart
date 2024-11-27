import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/API/premier_league_service.dart';
import 'package:pas1_mobile_11pplg2_28/Models/premier_league_model.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PremierLeagueModel>[].obs;

  void detailed(PremierLeagueModel premierLeagueModel) {
    Get.toNamed('/detailedview', arguments: premierLeagueModel);
  }

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiPremierLeagueService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}

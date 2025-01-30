import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels_task/resources/include.dart';
import 'package:http/http.dart' as http;

class HomeBloc extends Cubit<ReelModel?> {
  ReelModel? reel;
  int limit = 1;
  int pageNumber = 1;
  HomeBloc() : super(null);

  getReels() async {
    if (pageNumber != 0) {
      try {
        emit(null);
        String apiUrl =
            "https://api.ulearna.com/bytes/all?page=$pageNumber&limit=$limit&country=United+States";
        final response = await http.get(Uri.parse(apiUrl));
        final jsonResponse = jsonDecode(response.body);
        ReelsListResponse reelsListResponse =
            ReelsListResponse.fromJson(jsonResponse);
        var newReel = reelsListResponse.data!.data.first;
        emit(newReel);
      } catch (e) {
        Utilities.debugPrintCustom(e);
      }
    }
  }
}

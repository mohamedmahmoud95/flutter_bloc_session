import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import '../data/model/post.dart';


class PostCubit extends Cubit<List<Post>> {
  PostCubit() : super([]);

  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> fetchPosts() async {
    Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if (response.statusCode == 200) {
      print(response.data);
      final List<dynamic> jsonData = response.data;
      final posts = jsonData.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
      emit(posts);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
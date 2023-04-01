import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './common/indicator.dart';

class StackTest extends StatefulWidget {
  const StackTest({super.key});

  @override
  State<StackTest> createState() => _StackTestState();
}

class _StackTestState extends State<StackTest> {
  List items = [];
  bool isError = false;
  String errorString = '';
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.get(Uri.https(
          'www.googleapis.com',
          '/books/v1/volumes',
          {'q': '{Flutter}', 'maxResults': '40', 'langRestrict': 'ja'}));

      // 2. 問題がなければ、Json型に変換したデータを格納
      var jsonResponse = _response(response);
      // 3. 本の情報をリスト形式でデータを格納
      setState(() {
        items = jsonResponse['items'];
        isLoading = false;
      });
    } on SocketException catch (e) {
      debugPrint("Error: ${e.toString()}");
    } on Exception catch (e) {
      debugPrint("Error: ${e.toString()}");
    } catch (_) {
    } finally {}
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        print(responseJson['items']);

        return responseJson;
      case 400:
        // 400 Bad Request : 一般的なクライアントエラー
        throw Exception('一般的なクライアントエラーです');
      case 401:
        // 401 Unauthorized : アクセス権がない、または認証に失敗
        throw Exception('アクセス権限がない、または認証に失敗しました');
      case 403:
        // 403 Forbidden ： 閲覧権限がないファイルやフォルダ
        throw Exception('閲覧権限がないファイルやフォルダです');
      case 500:
        // 500 何らかのサーバー内で起きたエラー
        throw Exception('何らかのサーバー内で起きたエラーです');
      default:
        // それ以外の場合
        throw Exception('何かしらの問題が発生しています');
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Center(
            child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(items[index]['volumeInfo']['title']),
                      subtitle: Text(
                        items[index]['volumeInfo']['publishedDate'],
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        : MyIndicator();
  }
}

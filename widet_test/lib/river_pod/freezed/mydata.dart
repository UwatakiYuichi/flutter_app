import 'package:riverpod/riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_api/youtube_api.dart';

part 'mydata.freezed.dart';

@freezed
// Immutableなクラスの作成
class MyData with _$MyData {
  const factory MyData(
      {@Default(0.5) double value, @Default(false) bool isEnable}) = _MyData;
}

// Providerで使うNotifier
class MyDataStateNotifier extends StateNotifier<MyData> {
  MyDataStateNotifier() : super(const MyData());

  final String apiKey = "AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ";
  static String key = 'AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ';
  String type = "channel";
  YoutubeAPI youtube = new YoutubeAPI(key);

  // 値の書き換えは、copyWithで別インスタンスにする
  changeState(newValue) {
    // 下記はImmutableではNGのためエラー
    // state.value = newValue;
    // copyWithで別のインスタンスにする
    state = state.copyWith(value: newValue);
    // 変更の確認のためprintで情報を表示
    print("value:${state.value}, hashCode:${state.hashCode}");
  }

  changeIsEnable(enable) {
    // 下記はImmutableではNGのためエラー
    // state.value = newValue;
    // copyWithで別のインスタンスにする
    state = state.copyWith(isEnable: enable);
    // 変更の確認のためprintで情報を表示
    print("value:${state.isEnable}, hashCode:${state.hashCode}");
  }

  /**
   * youtube動画一覧を取得する
   *  query: 検索ワード
   *  callback 通信後のコールバック処理
   */
  Future<void> searchYoutubeMovieList(String query, Function callback) async {
    List<YouTubeVideo> videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );

    state = state.copyWith(isEnable: true);

    videoResult = await youtube.nextPage();

    for (int i = 0; i < videoResult.length; i++) {
      var youTubeVideo = videoResult[i];
      print(youTubeVideo.url);
      print(youTubeVideo.thumbnail.small.url);
    }

    callback();

    state = state.copyWith(isEnable: false);
  }
}

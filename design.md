# これは最強のバンドを見つけたときの
# **衝動**をインターネットという
# 海に解き放つためのソフトウェアである

## やること
* Macで再生中の曲のアーティスト名を取得して形式に当てはめてツイートする

  * やっぱり最強のバンドは<アーティスト名>なんだよなあ...<br><apple musicのリンク>
<br>

## ユースケース
* デスクトップに置いてワンボタンで実行&ツイート
  * Twitterのアカウントの事前登録をする
  * 曲がApple Musicで見つからなかったときにはURLを張らないでツイート

## 言語
* iThunesAPIとかいっぱい使うのでswiftでやりましょう

## 処理フロー
* 起動
* ストリーミング情報取得
  * アーティスト名, 曲名を取得
  * iThunes APIで検索をかけてURLを取得
  * これらの値を渡す
* Tweet用の文面を作る
  * アーティスト名, URLで定型文を作る
* Tweetする

## 参考にしたサイト
ストリーミングされている曲情報の取り方
https://qiita.com/ayasuda/items/3773858e5e93ba94da48

Twitterへの連携のやつ
https://qiita.com/kumamotone/items/c1fe3dd5718d29cc94d0

swiftでパイプとか標準入力を扱うやつ
https://qiita.com/masakihori/items/a85d1667b0af86d6f6e7

JSON系
https://qiita.com/satoshi-iwaki/items/708fac8f24ec26068455

URLの使い方
https://qiita.com/shiz/items/09523baf7d1cd37f6dee

iThunes APIの使い方
https://qiita.com/kenchan1837/items/a9e1de18c7eab75c4145



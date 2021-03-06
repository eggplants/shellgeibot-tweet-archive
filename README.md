# これは何か
- シェル芸botのツイートアーカイヴCSVを保存する
- ランキングを生成する
- 分析をする

# 必要
- [matplotlib](https://github.com/matplotlib/matplotlib)
- [numpy](https://github.com/numpy/numpy)
- [pandas](https://github.com/pandas-dev/pandas)
- [pytablewriter](https://github.com/thombashi/pytablewriter)
- [requests-oauthlib](https://github.com/requests/requests-oauthlib)
- [scipy](https://github.com/scipy/scipy)

# 収集ツール
- [Twitter メディアダウンローダ](https://memo.furyutei.work/entry/20160723/1469282864)
  - API制限で通常は[statuses/user_timeline](https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-user_timeline)で直近3200件しか取れないがそれを超えて取得できる優れもの
# 生成する
- `analyze.ipynb`を実行するとよしなに`/CSV/`にある新しいデータを読み込む
## 基本
- `formatted.csv`
  - 最初4行削除
  - カラム削除
    - Action date
    - Display name
    - Username
    - Media type
    - Media URL
    - Saved filename
    - Remarks
    - Tweet content
    - Replies
  - カラム追加
    - RT+FAV
    - User
      - Tweet contentからユーザーを抽出
      - 複数ユーザーのID(minyoruminyon除く)があれば`Twitter API`叩く
      - 特定できなければminyoruminyonとしてカウント

## バズり
- `buzz.csv`
  - 全ツイートRT, LIKEでソート
  - RANK, URL, USER, RT+LIKE, RT, LIKE
- `buzz_1000.md`
  - buzz.csvの1000行バージョン
- `buzz_500.md`
  - `buzz.csv`の500行バージョン
- `buzz_100.md`
  - `buzz.csv`の100行バージョン

## ユーザーリスト
- `user.csv`
  - ユーザ一覧(実行を一度でもされた)
  - 実行回数でソート
  - RANK, NAME, COUNT
- `user.md`
  - `user.csv`のmdバージョン
- `/user/`
  - `tweet>=10`のユーザーが実行したリスト
  - `<user name>.csv`

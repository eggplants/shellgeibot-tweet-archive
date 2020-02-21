# これは何か
- シェル芸botのツイートアーカイヴCSVを保存する
- ランキングを生成する
- 分析をする

# 必要
- [matplotlib](https://github.com/matplotlib/matplotlib)
- [numpy](https://github.com/numpy/numpy)
- [pandas](https://github.com/pandas-dev/pandas)
- [pytablewriter](https://github.com/thombashi/pytablewriter)
- [scipy](https://github.com/scipy/scipy)

# 収集ツール
[Twitter メディアダウンローダ](https://memo.furyutei.work/entry/20160723/1469282864)

# 生成する
- analyze.ipynbを実行するとよしなに/CSV/にある新しいデータを読み込む
## 基本
- formatted.csv
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
      - https://twitter.com/([a-zA-Z0-9_]+)/status/[0-9]+

## バズり
- buzz.csv
  - 全ツイートRT, LIKEでソート
  - RANK, URL, USER, RT+LIKE, RT, LIKE
- buzz_1000.md
  - buzz.csvの1000行バージョン
- buzz_500.md
  - buzz.csvの500行バージョン
- buzz_100.md
  - buzz.csvの100行バージョン

## ユーザーリスト
- user.csv
  - ユーザ一覧(実行を一度でもされた)
  - 実行回数でソート
  - RANK, NAME, COUNT
- user.md
  - user.csvのmdバージョン
- /user/
  - tweet>=10のユーザーが実行したリスト
  - <user name>.csv

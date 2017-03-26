---
layout: post
title: "cygwin環境へMeCab(UTF8辞書)をインストールする"
categories: journal
tags: [nlp,mecab]
image:
  feature:
  teaser:
  credit:
  creditlink:
---
cygwin環境へMeCabとUTF８の辞書を入れる際に、色々と大変だったので健忘録的な記事です

## MeCabと辞書のインストール
------------
基本的には[ちらのうら-CygwinでMeCabインストール。](http://chiranoura.nobody.jp/articles/2015-07-24_01_how_to_install_mecab/)  
こちらのブログを参考にすれば
問題なくMeCabを使用できるようになります。  
自分の環境ではどうしてもMeCabの出力がEUCになってしまいました  
<br />  

## nkfのインストール
----------
文字コード変換に必要なnkfがapt-cygにもsetup.exeのリストにも無いので、手動でインストールする必要があります  

- <https://osdn.net/projects/nkf/releases/> からnkf-2.1.4.tar.gzをダウンロード
- tar xzvf nkf-2.1.4.tar.gz  #tarファイルの展開
- cd nkf-2.1.4;make;make install  #インストール  
~~~
※makeコマンドがない場合はsetup.exeからmakeのインストールをします
~~~
<br />  

## 辞書の再インストール
--------
[こちら](http://qiita.com/junpooooow/items/0a7d13addc0acad10606)の記事を参考にしました  
- 一番最初に、MeCabの辞書をインストールしたディレクトリに移動
~~~
ちらのうらブログを参考にしたのであれば、/usr/src/mecab-ipadic-2.7.0-20070801
~~~
- make cleanを実行
- nkf -w --overwrite *.csv; nkf -w --overwrite *.def #文字コードを変換
- config-charset = UTF-8 #dicrcに書かれている文字コードの行を編集
- ./configure --with-charset=utf8; make; make install #辞書再インストール
<br />  

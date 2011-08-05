======================================
Redmine Wikilink Converter Pluginの概要
======================================

本ツールは、以下の機能を提供するRedmineプラグインです。

機能
-------------------------

* Wikiで任意のURLを簡単に生成できる


本プラグインの使い方
-------------------------

URLへのリンクを簡単に作成することができます。

例えば、Redmineの課題ページ(http://www.redmine.org/issue/) に、課題番号を指定する
だけで、リンクが作成できるようになります。

図1のような記述( {{wikilink(Redmine課題, 440)}} )を行うと、図2のようなリンク( http://www.redmine.org/issue/440 )が自動的に生成されます。

.. image:: image/setting4.png
  :scale: 100%

図1: Wikiの編集画面

.. image:: image/setting5.png
  :scale: 100%

図2. Wikiの出力画面


設定方法
--------------------------

本プラグインが正しく設置されている場合、Plugin設定画面内にRedmine Wikilink Converter Pluginが追加されている
はずです(図3)。

.. image:: image/setting1.png
  :scale: 100%

図3:Plugin設定画面


設定画面をクリックすると、置き換える文字列とURLの設定ができます(図4。)


.. image:: image/setting2.png
  :scale: 100%

図4:Wikilink Converter 設定画面

Redmineの課題ページ(http://www.redmine.org/issue/) に、課題番号を指定するだけでリンクが作成できるようにするには、
まず新規登録ボタンをクリックします。

その後、置き換えたい文字列に任意の文字列を（例ではRedmine課題)、URLには置き換えたいURLを指定してください（図5)。
URLは引数をとる事ができます。

例えば、http://www.redmine.org/issue/[1] と設定し、
Wiki内で {{wikilink( Redmine課題, 440)}} とした場合、
[1]の部分にwikilinkの第二引数の値( 例では440 ) が挿入されます。

.. image:: image/setting3.png
  :scale: 100%

図5:Linkの新規作成


インストール方法
---------------------------

Redmineの設置ディレクトリに移動後、以下のコマンドを実行してください。

.. code-block:: bash

    $ ruby script/plugin install git://github.com/nishio-dens/redmine_wikilink_converter.git
    $ rake db:migrate_plugins

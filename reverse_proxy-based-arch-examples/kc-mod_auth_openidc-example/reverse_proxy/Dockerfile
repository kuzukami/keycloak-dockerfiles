# Dockerイメージの指定
FROM centos:centos8.1.1911


#全体の使い方
#Step1 $ bash extract_envsubst.sh で、ドキュメント付設定テンプレートproxy.confから変数処理ファイル群を自動生成
#   Output:
#      custom-envsubst.sh: 設定テンプレートの環境変数置換プログラム
#      proxy.conf.autogen_envsubst: コンパイル済み設定テンプレート
#      parameters.tsv: パラメータ定義ファイル
#      sample.env: サンプル環境設定ファイル for docker
#      test/sample.env.test: 置換テスト用の環境変数ファイル
#Step2 $ ( cd test; bash envsubst-walktru.sh ) で、置換テストを行う。特殊文字等で置換に失敗するケースを防ぐ
#Step3 parameters.tsv 定義に基づいて、envファイルを作成する。

# 各種バージョンの定義
#ENV HTTPD_VERSION=2.4.6-88.el7.centos \
#    MOD_AUTH_OPENIDC_VERSION=2.3.10.2-1.el7.x86_64 \
#    MOD_AUTH_OPENIDC_SHORT_VERSION=2.3.10.2 \
#    HIREDIS_VERSION=0.12.1-1.el7.x86_64 \
#    CJOSE_VERSION=0.5.1-1.el7.centos.x86_64

# iproute と Apache HTTPD Serverインストール

#全部yum defaultを利用=＞実験性の最小化、保守性互換性の最大化
# => gettext => envsubstを使いたい
# => iproute =>  右のために利用する[pingチェック後、名前解決出来ない場合は、hostsに追加する。]
RUN set -x \
  && yum module enable -y mod_auth_openidc \
  && yum install -y httpd mod_auth_openidc \
  && yum install -y iproute \
  && yum install -y gettext  \
  && yum clean all 

# mod_auth_openidcのインストール
#RUN mkdir -p /tmp/work \
#  && cd /tmp/work \
#  && curl -k -L -O https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/h/hiredis-${HIREDIS_VERSION}.rpm \
#  && curl -k -L -O https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/cjose-${CJOSE_VERSION}.rpm \
#  && curl -k -L -O https://github.com/zmartzone/mod_auth_openidc/releases/download/v${MOD_AUTH_OPENIDC_SHORT_VERSION}/mod_auth_openidc-${MOD_AUTH_OPENIDC_VERSION}.rpm \
#  && yum install -y *.rpm \
#  && yum clean all \
#  && rm -rf /tmp/work

# シンボリックリンクで出力先を標準出力(dev/stdout)、標準エラー(/dev/stderr)に設定
RUN ln -sf /dev/stdout /var/log/httpd/access_log && ln -sf /dev/stderr /var/log/httpd/error_log

#デフォルトのログ設定を削除。LTSVに変更
RUN sed -i.bck -Ee  's|^(\s*CustomLog "logs/access_log".*)$|#Remove Default Log \1|'  /etc/httpd/conf/httpd.conf

# リバプロの設定、mod_auth_openidcの設定情報の配置
COPY proxy.conf.autogen_envsubst /etc/httpd/conf.d/proxy.conf.autogen_envsubst

# コンテナ実行時のリッスンポート
EXPOSE 80

# docker run時の初期起動シェルの配置
COPY docker-entrypoint.sh /opt/
RUN chmod -v +x /opt/docker-entrypoint.sh

COPY custom-envsubst.sh /opt/
RUN chmod -v +x /opt/custom-envsubst.sh

# ENTRYPOINTに初期起動シェルパスを設定
ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]

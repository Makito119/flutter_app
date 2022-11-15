import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TosPage extends HookConsumerWidget {
  TosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff2c233a),
          title: Text('利用規約'),
          shadowColor: Color(0x7f840899),
          elevation: 10,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '利用規約',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'この利用規約（以下，「本規約」といいます。）は，＿＿＿＿＿（以下，「当社」といいます。）がこのウェブサイト上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
                TosWidget.titleBar(
                  context: context,
                  title: '第１条（適用）',
                ),
                TosWidget.itemBar(
                    context: context,
                    index: 1,
                    text: '本規約は，ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。'),
                TosWidget.itemBar(
                  context: context,
                  index: 2,
                  text:
                      '当社は本サービスに関し，本規約のほか，ご利用にあたってのルール等，各種の定め（以下，「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず，本規約の一部を構成するものとします。',
                ),
                TosWidget.itemBar(
                    context: context,
                    index: 3,
                    text:
                        '本規約の規定が前条の個別規定の規定と矛盾する場合には，個別規定において特段の定めなき限り，個別規定の規定が優先されるものとします。'),
                TosWidget.titleBar(
                  context: context,
                  title: '第２条（利用登録）',
                ),
                TosWidget.itemBar(
                    context: context,
                    index: 1,
                    text:
                        '本サービスにおいては，登録希望者が本規約に同意の上，当社の定める方法によって利用登録を申請し，当社がこれを承認することによって，利用登録が完了するものとします。'),
                TosWidget.itemBar(
                    context: context,
                    index: 2,
                    text:
                        '当社は，利用登録の申請者に以下の事由があると判断した場合，利用登録の申請を承認しないことがあり，その理由については一切の開示義務を負わないものとします。'),
                TosWidget.itemsabBar(
                    context: context,
                    index: 1,
                    text: '利用登録の申請に際して虚偽の事項を届け出た場合'),
                TosWidget.itemsabBar(
                    context: context,
                    index: 2,
                    text: '本規約に違反したことがある者からの申請である場合'),
                TosWidget.itemsabBar(
                    context: context,
                    index: 3,
                    text: 'その他，当社が利用登録を相当でないと判断した場合'),
                TosWidget.titleBar(
                    context: context, title: '第３条（ユーザーIDおよびパスワードの管理）'),
                TosWidget.itemBar(
                    context: context,
                    index: 1,
                    text:
                        'ユーザーは，自己の責任において，本サービスのユーザーIDおよびパスワードを適切に管理するものとします。'),
                TosWidget.itemBar(
                    context: context,
                    index: 2,
                    text:
                        'ユーザーは，いかなる場合にも，ユーザーIDおよびパスワードを第三者に譲渡または貸与し，もしくは第三者と共用することはできません。当社は，ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には，そのユーザーIDを登録しているユーザー自身による利用とみなします。'),
                TosWidget.itemBar(
                    context: context,
                    index: 3,
                    text:
                        'ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は，当社に故意又は重大な過失がある場合を除き，当社は一切の責任を負わないものとします。'),
                TosWidget.titleBar(
                    context: context, title: '第４条（利用料金および支払い方法）'),
                TosWidget.itemBar(
                    context: context,
                    index: 1,
                    text:
                        'ユーザーは，本サービスの有料部分の対価として，当社が別途定め，本ウェブサイトに表示する利用料金を，当社が指定する方法により支払うものとします。'),
                TosWidget.itemBar(
                  context: context,
                  index: 2,
                  text:
                      'ユーザーが利用料金の支払を遅滞した場合には，ユーザーは年14．6％の割合による遅延損害金を支払うものとします。',
                ),
                TosWidget.titleBar(context: context, title: '第５条（禁止事項）'),
                TosWidget.itemBar(
                    context: context, index: 1, text: '法令または公序良俗に違反する行為'),
                TosWidget.itemBar(
                    context: context, index: 2, text: '犯罪行為に関連する行為'),
                TosWidget.itemBar(
                    context: context,
                    index: 3,
                    text: '本サービスの内容等，本サービスに含まれる著作権，商標権ほか知的財産権を侵害する行為'),
                TosWidget.itemBar(
                    context: context,
                    index: 5,
                    text:
                        '当社，ほかのユーザー，またはその他第三者のサーバーまたはネットワークの機能を破壊したり，妨害したりする行為'),
                TosWidget.itemBar(
                    context: context,
                    index: 4,
                    text: '本サービスによって得られた情報を商業的に利用する行為 '),
                TosWidget.itemBar(
                    context: context,
                    index: 6,
                    text: ' 当社のサービスの運営を妨害するおそれのある行為'),
                TosWidget.itemBar(
                    context: context, index: 7, text: ' 不正アクセスをし，またはこれを試みる行為'),
                TosWidget.itemBar(
                    context: context,
                    index: 8,
                    text: ' 他のユーザーに関する個人情報等を収集または蓄積する行為')
              ],
            ),
          ),
        ));
  }
}

class titleWidget extends StatelessWidget {
  final String title;
  const titleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
    );
  }
}

class TosWidget {
  static titleBar({required BuildContext context, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
      ),
    );
  }

  static itemBar(
      {required BuildContext context,
      required int index,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index}.　',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static itemsabBar(
      {required BuildContext context,
      required int index,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index}.　',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static oneitemBar({required BuildContext context, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

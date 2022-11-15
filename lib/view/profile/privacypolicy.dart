import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shot_dev/view/profile/tos.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivacyPolicyPage extends HookConsumerWidget {
  PrivacyPolicyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff2c233a),
          title: Text('プライバシーポリシー'),
          shadowColor: Color(0x7f840899),
          elevation: 10,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'プライバシーポリシー',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  '＿＿＿＿＿＿＿＿（以下，「当社」といいます。）は，本ウェブサイト上で提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              TosWidget.titleBar(context: context, title: '第１条（個人情報）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '個人情報」とは，個人情報保護法にいう「個人情報」を指すものとし，生存する個人に関する情報であって，当該情報に含まれる氏名，生年月日，住所，電話番号，連絡先その他の記述等により特定の個人を識別できる情報及び容貌，指紋，声紋にかかるデータ，及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。'),
              TosWidget.titleBar(context: context, title: '第２条（個人情報の収集方法）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。'),
              TosWidget.titleBar(
                  context: context, title: '第３条（個人情報の収集・利用する目的）'),
              TosWidget.oneitemBar(
                  context: context, text: '当社が個人情報を収集・利用する目的は，以下のとおりです。'),
              TosWidget.itemsabBar(
                  context: context, index: 1, text: '当社サービスの提供・運営のため'),
              TosWidget.itemsabBar(
                  context: context,
                  index: 2,
                  text: 'ユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）'),
              TosWidget.itemsabBar(
                  context: context,
                  index: 3,
                  text:
                      'ユーザーが利用中のサービスの新機能，更新情報，キャンペーン等及び当社が提供する他のサービスの案内のメールを送付するため'),
              TosWidget.itemsabBar(
                  context: context,
                  index: 4,
                  text: 'メンテナンス，重要なお知らせなど必要に応じたご連絡のため'),
              TosWidget.titleBar(context: context, title: '第４条（利用目的の変更）'),
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
              TosWidget.titleBar(context: context, title: '第５条（個人情報の第三者提供）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。'),
              TosWidget.titleBar(context: context, title: '第６条（個人情報の開示）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。'),
              TosWidget.titleBar(context: context, title: '第７条（個人情報の訂正および削除）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。'),
              TosWidget.titleBar(context: context, title: '第８条（個人情報の利用停止等）'),
              TosWidget.oneitemBar(
                  context: context,
                  text:
                      '当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。'),
            ],
          ),
        ))); //利用規約基本的な形ここ,);
  }
}

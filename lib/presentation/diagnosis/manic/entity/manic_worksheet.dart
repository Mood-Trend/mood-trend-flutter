/// 躁状態のワークシートの抽象クラス
abstract class ManicWorkSheet {
  late final String plus_5;
  late final String plus_4;
  late final String plus_3;
  late final String plus_2;
  late final String plus_1;
}

/// [ManicWorkSheet] を具象化したアイデアのワークシート
class IdeaType extends ManicWorkSheet {
  @override
  String get plus_5 => 'アイデアが成功すると確信し、実現に向けて実際に動く';
  @override
  String get plus_4 => '次々と湧き上がるアイデアを具現化しようと奮闘する';
  @override
  String get plus_3 => 'アイデアが湧き上がり、絶え間なく考え続ける';
  @override
  String get plus_2 => 'アイデアを簡単に思いつくことができる';
  @override
  String get plus_1 => 'アイデアを考えようと思えば可能である';
}

/// [ManicWorkSheet] を具象化した気分高揚のワークシート
class ElationType extends ManicWorkSheet {
  @override
  String get plus_5 => '自分は絶対に正しく、すべてが上手くいくと確信する';
  @override
  String get plus_4 => 'どんなことでも自分は成功すると確信している';
  @override
  String get plus_3 => 'どんな状況でも上手くいく感覚が強い';
  @override
  String get plus_2 => '前向きで挑戦的な気持ちがあり、ポジティブなエネルギーを感じる';
  @override
  String get plus_1 => '普段より前向きな気分である';
}

/// [ManicWorkSheet] を具象化した活動性のワークシート
class ActivityType extends ManicWorkSheet {
  @override
  String get plus_5 => '何日も1日中活動を続けているが、疲れを感じずに精力的に行動している';
  @override
  String get plus_4 => '1日が予定でいっぱいである';
  @override
  String get plus_3 => '積極的でエネルギッシュな気分で、予定をたくさん詰める';
  @override
  String get plus_2 => '普段よりも活発に動く気分である';
  @override
  String get plus_1 => '活動が可能である';
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

///
/// なぞる操作ができる範囲全体
/// 中のアイテムがなぞられたときにコールバックを受け取る
///
/// SwipeTouchDetector
/// +---------------+
/// |  ■item        |
/// |       ■item   |
/// |   ■item       |
/// +---------------+
///
class SwipeTouchDetector extends HookWidget {
  const SwipeTouchDetector({
    super.key,
    required this.onTouch,
    required this.child,
  });

  final void Function(String id) onTouch;

  /// この child が アイテム である必要はない.
  /// 例: ここにリストを指定、その中にアイテムたちを並べることも可能
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// 無駄な反応を繰り返さないためキャッシュするアイテムID
    final cahcedItem = useState<String?>(null);
    return GestureDetector(
      onPanStart: (details) =>
          _onSwipe(context, details.localPosition, cahcedItem),
      onPanUpdate: (details) =>
          _onSwipe(context, details.localPosition, cahcedItem),
      child: child,
    );
  }

  void _onSwipe(
    BuildContext context,
    Offset localPosition,
    ValueNotifier<String?> chachedItem,
  ) {
    // ヒットテスト
    final box = context.findRenderObject() as RenderBox?;
    final result = BoxHitTestResult();
    final hasHit = box?.hitTest(result, position: localPosition) ?? false;

    if (hasHit) {
      // なぞった部分に何かヒットしたとき
      for (final hit in result.path) {
        final target = hit.target;
        final touchable = target is ToutchableBox;
        if (!touchable) continue; // タッチ不可なら無視
        final cached = chachedItem.value == target.id;
        if (cached) continue; // キャッシュ済みなら無視
        chachedItem.value = target.id; // キャッシュを更新
        onTouch(target.id); // コールバック
      }
      return;
    }

    // ヒットしなかったとき キャッシュ を null へ
    if (chachedItem.value != null) {
      chachedItem.value = null;
    }
  }
}

///
/// なぞる操作に反応するアイテム
/// なぞられたとき親に id を伝える --> SwipeTouchDetector
///
class SwipeTouchItem extends SingleChildRenderObjectWidget {
  const SwipeTouchItem({
    super.key,
    required this.id,
    super.child,
  });

  final String id;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ToutchableBox(id);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant ToutchableBox renderObject,
  ) {
    super.updateRenderObject(context, renderObject);
  }
}

class ToutchableBox extends RenderProxyBox {
  ToutchableBox(this.id);
  final String id;
}

import 'package:Shrine/login.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';
import 'login.dart';

const double _kFlingVelocity = 2;

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
  });

  @override
  State<StatefulWidget> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(Backdrop oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentCategory != oldWidget.currentCategory)
      _toggleBackDropLayerVisibility();
    else if (!_frontLayerVisible)
      _animationController.fling(velocity: _kFlingVelocity);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _frontLayerVisible =>
      _animationController.status == AnimationStatus.completed ||
      _animationController.status == AnimationStatus.forward;

  void _toggleBackDropLayerVisibility() => _animationController.fling(
      velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48;

    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, layerTop, 0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0, 0, 0, 0),
    ).animate(_animationController.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            onTap: _toggleBackDropLayerVisibility,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          titleSpacing: 0,
          title: _BackdropTitle(
            listenable: _animationController.view,
            onPress: _toggleBackDropLayerVisibility,
            frontTitle: widget.frontTitle,
            backTitle: widget.backTitle,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'login',
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                    )),
            IconButton(
                icon: Icon(
                  Icons.tune,
                  semanticLabel: 'login',
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                    )),
          ],
        ),
        body: LayoutBuilder(builder: _buildStack),
      );
}

class _FrontLayer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _FrontLayer({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        elevation: 16,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(46)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Container(
                height: 40,
                alignment: AlignmentDirectional.centerStart,
              ),
            ),
            Expanded(child: child),
          ],
        ),
      );
}

class _BackdropTitle extends AnimatedWidget {
  final void Function() onPress;
  final Widget frontTitle;
  final Widget backTitle;
  final Animation<double> _listenable;

  const _BackdropTitle({
    Key? key,
    required Animation<double> listenable,
    required this.onPress,
    required this.frontTitle,
    required this.backTitle,
  })   : _listenable = listenable,
        super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = _listenable;

    return DefaultTextStyle(
      style: Theme.of(context).primaryTextTheme.headline6!,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 72,
            child: IconButton(
              padding: EdgeInsets.only(right: 8),
              onPressed: this.onPress,
              icon: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: animation.value,
                    child: ImageIcon(AssetImage('assets/slanted_menu.png')),
                  ),
                  FractionalTranslation(
                    translation: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(1, 0),
                    ).evaluate(animation),
                    child: ImageIcon(AssetImage('assets/diamond.png')),
                  )
                ],
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Opacity(
                opacity: CurvedAnimation(
                  parent: ReverseAnimation(animation),
                  curve: Interval(0.5, 1),
                ).value,
                child: FractionalTranslation(
                  translation: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(0.5, 0),
                  ).evaluate(animation),
                  child: Semantics(
                      label: 'hide categories menu',
                      child: ExcludeSemantics(child: backTitle)
                  ),
                ),
              ),
              Opacity(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Interval(0.5, 1),
                ).value,
                child: FractionalTranslation(
                  translation: Tween<Offset>(
                    begin: Offset(-0.25, 0),
                    end: Offset.zero,
                  ).evaluate(animation),
                  child: Semantics(
                      label: 'show categories menu',
                      child: ExcludeSemantics(child: frontTitle)
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

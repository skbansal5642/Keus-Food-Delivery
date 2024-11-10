import 'package:flutter/material.dart';
import 'package:keus_food_delivery/ui/cart/components/cart_brief_ui.dart';

class CartOverlay {
  static OverlayEntry? _overlayEntry;
  static double _overlayPosition = 0;
  static OverlayState? _overlayState;
  static BuildContext? overlayContext;

  static final AnimationController _animationController = AnimationController(
    vsync: _overlayState!,
    duration: const Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 500),
  );

  static void _removeOverlayEntry() {
    _overlayEntry?.remove();
    overlayContext = null;
    _animationController.dispose();

    _overlayPosition = _overlayPosition - 10;
    _overlayEntry?.markNeedsBuild();
  }

  static void _addOverlay() {
    _overlayPosition = _overlayPosition + 10;
    _overlayEntry?.markNeedsBuild();

    _overlayState?.insert(_overlayEntry!);
    _animationController.forward();
  }

  static Future<void> show(
    BuildContext context, {
    required String cartTotal,
    Function()? onTap,
  }) async {
    _overlayState = Overlay.of(context);
    overlayContext = _overlayState?.context;
    _overlayEntry = OverlayEntry(
      builder: (context) => CartOverlayWidget(
        controller: _animationController,
        cartTotal: cartTotal,
        onPress: onTap,
      ),
    );

    _addOverlay();
  }

  static remove() {
    _removeOverlayEntry();
  }
}

class CartOverlayWidget extends StatelessWidget {
  final String cartTotal;
  final AnimationController controller;
  final Function()? onPress;

  const CartOverlayWidget({
    super.key,
    required this.cartTotal,
    required this.controller,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 10,
      right: 10,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Material(
              color: Colors.transparent,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: const Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Curves.easeIn,
                    reverseCurve: Curves.easeOut,
                  ),
                ),
                child: CartBriefUi(
                  title: "Cart",
                  onPress: onPress,
                  cartTotal: cartTotal,
                ),
              ),
            );
          }),
    );
  }
}

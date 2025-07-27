import 'package:flutter/material.dart';
import 'package:aa_toast/src/models/toast_config.dart';
import 'package:aa_toast/src/models/toast_position.dart';
import 'package:aa_toast/src/toast_theme.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({
    super.key,
    required this.config,
    required this.theme,
    required this.onDismiss,
  });

  final ToastConfig config;
  final ToastTheme theme;
  final VoidCallback onDismiss;

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: _getSlideBegin(),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();

    Future.delayed(widget.config.duration, () {
      if (mounted) {
        _dismiss();
      }
    });
  }

  Offset _getSlideBegin() {
    switch (widget.config.position) {
      case ToastPosition.top:
        return const Offset(0, -1);
      case ToastPosition.center:
        return const Offset(0, -0.5);
      case ToastPosition.bottom:
        return const Offset(0, 1);
    }
  }

  void _dismiss() {
    _animationController.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildToastContent(),
      ),
    );
  }

  Widget _buildToastContent() {
    return Container(
      margin: widget.config.margin,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: widget.config.maxWidth,
          ),
          decoration: BoxDecoration(
            color: widget.config.backgroundColor ??
                widget.theme.getColorByType(widget.config.type),
            borderRadius: BorderRadius.circular(widget.config.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: widget.config.padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.config.icon != null) ...[
                  widget.config.icon!,
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    widget.config.message,
                    style: TextStyle(
                      color: widget.config.textColor ?? widget.theme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

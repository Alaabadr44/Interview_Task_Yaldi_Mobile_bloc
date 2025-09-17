// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../core/config/l10n/generated/l10n.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/extension.dart';
import '../../../view_model/blocs/auth_bloc/auth_bloc.dart';
import '../../../view_model/blocs/auth_bloc/auth_state.dart';
import '../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../text_widget.dart';
import 'solid_button.dart';

class DownloadButton extends StatelessWidget {
  final double? width;
  final double? height;
  // final double? percentage;
  final String? titleButton;
  final Widget Function(({double? progress, String? title, bool? underProcessing}) progressData)? child;
  final Color? backgroundColor;
  final Color? progressColor;
  final VoidCallback? onTab;
  final TextStyle? style;
  final Bloc bloc;

  const DownloadButton({
    super.key,
    required this.bloc,
    this.width,
    this.height,
    this.titleButton,
    // this.percentage,
    this.backgroundColor,
    required this.onTab,
    this.style,
    this.progressColor,
    this.child,
  }) : assert(titleButton != null || child != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.sizeSide.width,
      height: height ?? kButtonHeight,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return SolidButton(
            title: getTitleButton(state, context),
            onTab: () {
              if (_getData(state, context).underProcessing != null && _getData(state, context).underProcessing!) {
                return;
              } else {
                onTab?.call();
              }
            },
            child: !getTitleButton(state, context).isNotNull
                ? child != null
                    ? child!(_getData(state, context))
                    : Stack(
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              backgroundColor: backgroundColor,
                              color: progressColor,
                              value: _getData(state, context).progress,
                            ),
                          ),
                          if (_getData(state, context).title.isNotNull)
                            Center(
                              child: TextWidget(
                                text: _getData(state, context).title!,
                                style: context.labelS,
                              ),
                            )
                        ],
                      )
                : null,
          );
          /* return InkWell(
            onTap: !(_getData(state, 'title', context) as String?).isNotNull ? onTab : null,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: LinearPercentIndicator(
              percent: _getData(state, 'progress', context) ?? 0,
              animation: true,
              isRTL: SettingService.isRTL,
              lineHeight: height ?? kButtonHeight,
              barRadius: const Radius.circular(kRadiusMedium),
              animationDuration: 250,
              padding: EdgeInsets.zero,
              animateFromLastPercent: true,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
              center: titleButton.isNotNull || (_getData(state, 'title', context) as String?).isNotNull
                  ? TextWidget(
                      text: _getData(state, 'title', context) ?? titleButton!,
                      style: style ?? context.headlineS,
                    )
                  : child,
            ),
          ); */
        },
      ),
    );
  }

  String? getTitleButton(Object? state, BuildContext context) {
    if (_getData(state, context).progress == null && _getData(state, context).underProcessing == null) {
      return titleButton;
    }
    return null;
  }

  ({double? progress, String? title, bool? underProcessing}) _getData(dynamic state, BuildContext context) {
    var result = _updateStateBtn(state, context);
    return (progress: result?['progress'], title: result?['title'], underProcessing: result?['under_processing']);
  }

  Map<String, dynamic>? _updateStateBtn(dynamic state, BuildContext context) {
    Map<String, dynamic>? data;
    if (bloc is ApiDataBloc) {
      (bloc.state as ApiDataState).maybeWhen(
        loading: (event, count, total, isInit) {
          data = _collectData(count, total);
        },
        orElse: () => data = null,
      );
    } else if (bloc is AuthBloc) {
      (bloc.state as AuthState).maybeWhen(
        loading: (event, count, total, isInit) {
          data = _collectData(count, total);
        },
        orElse: () => data = null,
      );
    }
    return data;
  }

  Map<String, dynamic> _collectData(int? count, int? total) {
    Map<String, dynamic> data = {};
    if ((count != null && total != null) && (count == total)) {
      data['progress'] = null;
      data['title'] = null;
      data['under_processing'] = true;
    } else if (count != null && total != null) {
      double percent = count / total;
      data['progress'] = percent;
      data['title'] = S.current.button_please_waite_title((percent * 100).toInt());
      data['under_processing'] = true;
    } else {
      data['progress'] = null;
      data['title'] = null;
      data['under_processing'] = false;
    }
    return data;
  }
}

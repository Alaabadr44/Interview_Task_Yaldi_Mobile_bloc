// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/error/error.dart';
import '../../../core/utils/extension.dart';
import '../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../view_model/blocs/data_bloc/api_data_state.dart';
import '../general/app_indicator.dart';
import 'custom_error_widget.dart';

class BuilderBloc<T> extends StatelessWidget {
  final Widget Function(T data) successBuilder;
  final ApiDataState<T> state;
  final Widget? loadingWidget;
  final Widget Function(AppError? error)? errorBuilder;
  final ApiDataBloc<T> bloc;
  const BuilderBloc({
    super.key,
    required this.successBuilder,
    this.loadingWidget,
    this.errorBuilder,
    required this.state,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return state.maybeMap(
      loading: (value) => loadingWidget != null ? loadingWidget! : const Center(child: AppIndicator(fit: BoxFit.none)),
      successModel: (data) => successBuilder(data.data as T),
      error: (error) => errorBuilder != null
          ? errorBuilder!(error.error)
          : Center(
              child: CustomErrorWidget(
                message: error.error?.message ?? '',
                btnTitle: context.localText.button_retry_title,
                onTab: bloc.refresh,
              ),
            ) /* Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: error.error?.message ?? '',
                  style: context.headlineS,
                  textAlign: TextAlign.center,
                ),
                (context.sizeSide.smallSide * .1).ph,
                ButtonWidget(
                  margin: EdgeInsets.symmetric(
                      horizontal: context.sizeSide.smallSide * .1),
                  title: context.localText.button_retry_title,
                  onTab: () => bloc.refresh(),
                )
              ],
            )) */
      ,
      orElse: () => loadingWidget != null ? loadingWidget! : const Center(child: AppIndicator(fit: BoxFit.none)),
    );
  }
}

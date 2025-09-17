// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/utils/extension.dart';
import '../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../general/app_indicator.dart';
import 'assistance_pagination.dart';
import 'custom_error_widget.dart';
import 'text_widget.dart';

class ResponsivePaginationWidget<MODEL> extends StatelessWidget {
  final ApiDataBloc<MODEL> bloc;
  final Widget Function(BuildContext context, MODEL item, int index,
      PagingController<int, MODEL> controller) itemBuilder;
  final EdgeInsetsGeometry? margin;
  final double? percentHight;
  final double? maxCrossAxisExtent;
  final ScrollPhysics? physics;
  final Widget Function(BuildContext)? noDataAvailable;
  final ListType listType;
  final double? gapItem;
  final bool reverse;
  final bool shrinkWrap;
  final bool hasRefreshIndictor;
  final Widget Function(BuildContext context)? newPageProgressIndicatorBuilder;

  const ResponsivePaginationWidget({
    super.key,
    required this.bloc,
    required this.itemBuilder,
    this.margin,
    this.percentHight,
    this.maxCrossAxisExtent,
    this.physics,
    this.noDataAvailable,
    this.listType = ListType.both,
    this.reverse = false,
    this.shrinkWrap = false,
    this.hasRefreshIndictor = true,
    this.newPageProgressIndicatorBuilder,
    this.gapItem = 10,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => bloc.refresh(),
      child: switch (listType) {
        ListType.list => PagedListView.separated(
            separatorBuilder: (context, index) => gapItem!.ph,
            pagingController: bloc.controller!,
            physics: physics,
            padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
            reverse: reverse,
            shrinkWrap: shrinkWrap,
            builderDelegate: PagedChildBuilderDelegate<MODEL>(
              itemBuilder: (context, item, index) =>
                  itemBuilder.call(context, item, index, bloc.controller!),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: AppIndicator()),
              newPageProgressIndicatorBuilder:
                  newPageProgressIndicatorBuilder ??
                      (context) => defaultLoading(),
              newPageErrorIndicatorBuilder: (context) =>
                  errorDuringBrowsing(context, bloc.controller!),
              firstPageErrorIndicatorBuilder: (context) =>
                  errorDuringBrowsing(context, bloc.controller!, true),
              noItemsFoundIndicatorBuilder: noDataAvailable ??
                  (context) {
                    return _errorWidget(context);
                    /* return Center(
                      child: TextWidget(
                        text: S.of(context).no_item_found,
                        style: context.titleM,
                      ),
                    ); */
                  },
            ),
          ),
        ListType.grid => PagedGridView(
            pagingController: bloc.controller!,
            physics: physics,
            padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
            builderDelegate: PagedChildBuilderDelegate<MODEL>(
              itemBuilder: (context, item, index) =>
                  itemBuilder.call(context, item, index, bloc.controller!),
              // firstPageProgressIndicatorBuilder: (context) => ,
              newPageProgressIndicatorBuilder: (context) => defaultLoading(),
              newPageErrorIndicatorBuilder: (context) =>
                  errorDuringBrowsing(context, bloc.controller!),
              firstPageErrorIndicatorBuilder: (context) =>
                  errorDuringBrowsing(context, bloc.controller!, true),
              noItemsFoundIndicatorBuilder: noDataAvailable ??
                  (context) {
                    return _errorWidget(context);

                    /* return Center(
                      child: TextWidget(
                        text: S.of(context).no_item_found,
                        style: context.titleM,
                      ),
                    ); */
                  },
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  maxCrossAxisExtent ?? context.sizeSide.smallSide / 2.2,
              childAspectRatio: getRatio(
                context,
                percentHight ??
                    (context.orientationInfo.isPortrait ? 0.75 : 0.6),
              ),
              crossAxisSpacing: gapItem ?? 8,
              mainAxisSpacing: gapItem ?? 8,
            ),
          ),
        ListType.both => context.isMobile
            ? PagedListView.separated(
                separatorBuilder: (context, index) => gapItem!.ph,
                pagingController: bloc.controller!,
                physics: physics,
                padding:
                    margin ?? EdgeInsets.only(bottom: context.bottomPadding),
                builderDelegate: PagedChildBuilderDelegate<MODEL>(
                  itemBuilder: (context, item, index) =>
                      itemBuilder.call(context, item, index, bloc.controller!),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: AppIndicator()),
                  newPageProgressIndicatorBuilder: (context) =>
                      defaultLoading(),
                  newPageErrorIndicatorBuilder: (context) =>
                      errorDuringBrowsing(context, bloc.controller!),
                  firstPageErrorIndicatorBuilder: (context) =>
                      errorDuringBrowsing(context, bloc.controller!, true),
                  noItemsFoundIndicatorBuilder: noDataAvailable ??
                      (context) {
                        return _errorWidget(context);
                        /* return Center(
                          child: TextWidget(
                            text: S.of(context).no_item_found,
                            style: context.titleM,
                          ),
                        ); */
                      },
                ),
              )
            : PagedGridView(
                pagingController: bloc.controller!,
                physics: physics,
                padding:
                    margin ?? EdgeInsets.only(bottom: context.bottomPadding),
                builderDelegate: PagedChildBuilderDelegate<MODEL>(
                  itemBuilder: (context, item, index) =>
                      itemBuilder.call(context, item, index, bloc.controller!),
                  // firstPageProgressIndicatorBuilder: (context) ,
                  newPageProgressIndicatorBuilder: (context) =>
                      defaultLoading(),
                  newPageErrorIndicatorBuilder: (context) =>
                      errorDuringBrowsing(context, bloc.controller!),
                  firstPageErrorIndicatorBuilder: (context) =>
                      errorDuringBrowsing(context, bloc.controller!, true),
                  noItemsFoundIndicatorBuilder: noDataAvailable ??
                      (context) => Center(
                            child: TextWidget(
                              text: S.of(context).no_item_found,
                              style: context.titleM,
                            ),
                          ),
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      maxCrossAxisExtent ?? context.sizeSide.smallSide / 2.2,
                  childAspectRatio: getRatio(
                    context,
                    percentHight ??
                        (context.orientationInfo.isPortrait ? 0.75 : 0.6),
                  ),
                  crossAxisSpacing: gapItem ?? 8,
                  mainAxisSpacing: gapItem ?? 8,
                ),
              ),
      },
    );
  }

  Column _errorWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (context.sizeSide.smallSide * 0.1).ph,
        CustomErrorWidget(
            message: S.of(context).no_item_found,
            btnTitle: context.localText.button_retry_title,
            onTab: bloc.refresh),
      ],
    );
  }

  double getRatio(BuildContext context, double percent) {
    // Improved aspect ratio calculation to prevent overflow
    double baseRatio = context.orientationInfo.isPortrait
        ? (context.sizeSide.width / context.sizeSide.largeSide) * percent
        : (context.sizeSide.height / context.sizeSide.largeSide) * percent;

    // Ensure minimum ratio to prevent extremely tall items
    return baseRatio.clamp(0.5, 1.5);
  }
}

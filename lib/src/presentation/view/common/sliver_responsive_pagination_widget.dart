// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/utils/extension.dart';
import '../../view_model/blocs/data_bloc/api_data_bloc.dart';
import 'assistance_pagination.dart';
import 'text_widget.dart';

class SliverResponsivePaginationWidget<MODEL> extends StatelessWidget {
  final ApiDataBloc<MODEL> bloc;
  final Widget Function(BuildContext context, MODEL item, int index)
      itemBuilder;
  final double? percentHight;
  final Widget Function(BuildContext)? noDataAvailable;
  final double? horGab;
  final double? verGab;
  final ListType listType;
  const SliverResponsivePaginationWidget({
    super.key,
    required this.bloc,
    required this.itemBuilder,
    this.percentHight,
    this.noDataAvailable,
    this.horGab,
    this.verGab,
    this.listType = ListType.both,
  });

  @override
  Widget build(BuildContext context) {
    return switch (listType) {
      ListType.list => PagedSliverList.separated(
          separatorBuilder: (context, index) => 8.ph,
          pagingController: bloc.controller!,
          builderDelegate: PagedChildBuilderDelegate<MODEL>(
            itemBuilder: itemBuilder,
            // firstPageProgressIndicatorBuilder: (context) => ,
            newPageProgressIndicatorBuilder: (context) => defaultLoading(),
            newPageErrorIndicatorBuilder: (context) =>
                errorDuringBrowsing(context, bloc.controller!),
            firstPageErrorIndicatorBuilder: (context) =>
                errorDuringBrowsing(context, bloc.controller!),
            noItemsFoundIndicatorBuilder: noDataAvailable ??
                (context) => Center(
                      child: TextWidget(
                        text: S.of(context).no_item_found,
                        style: context.titleM,
                      ),
                    ),
          ),
        ),
      ListType.grid => PagedSliverGrid(
          pagingController: bloc.controller!,
          builderDelegate: PagedChildBuilderDelegate<MODEL>(
            itemBuilder: itemBuilder,
            // firstPageProgressIndicatorBuilder: (context) => ,
            newPageProgressIndicatorBuilder: (context) => defaultLoading(),
            newPageErrorIndicatorBuilder: (context) =>
                errorDuringBrowsing(context, bloc.controller!),
            firstPageErrorIndicatorBuilder: (context) =>
                errorDuringBrowsing(context, bloc.controller!),
            noItemsFoundIndicatorBuilder: noDataAvailable ??
                (context) => Center(
                      child: TextWidget(
                        text: S.of(context).no_item_found,
                        style: context.titleM,
                      ),
                    ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: context.sizeSide.smallSide ~/ 250,
            maxCrossAxisExtent: context.sizeSide.smallSide / 1.4,
            childAspectRatio: getRatio(
              context,
              // 1.4,
              percentHight ?? (context.orientationInfo.isPortrait ? .5 : .4),
            ),
            crossAxisSpacing: horGab ?? context.deviceWidth * .015,
            mainAxisSpacing: verGab ?? context.deviceWidth * .015,
          ),
        ),
      ListType.both => context.isMobile
          ? PagedSliverList.separated(
              separatorBuilder: (context, index) => 8.ph,
              pagingController: bloc.controller!,
              builderDelegate: PagedChildBuilderDelegate<MODEL>(
                itemBuilder: itemBuilder,
                // firstPageProgressIndicatorBuilder: (context) => ,
                newPageProgressIndicatorBuilder: (context) => defaultLoading(),
                newPageErrorIndicatorBuilder: (context) =>
                    errorDuringBrowsing(context, bloc.controller!),
                firstPageErrorIndicatorBuilder: (context) =>
                    errorDuringBrowsing(context, bloc.controller!),
                noItemsFoundIndicatorBuilder: noDataAvailable ??
                    (context) => Center(
                          child: TextWidget(
                            text: S.of(context).no_item_found,
                            style: context.titleM,
                          ),
                        ),
              ),
            )
          : PagedSliverGrid(
              pagingController: bloc.controller!,
              builderDelegate: PagedChildBuilderDelegate<MODEL>(
                itemBuilder: itemBuilder,
                // firstPageProgressIndicatorBuilder: (context) => ,
                newPageProgressIndicatorBuilder: (context) => defaultLoading(),
                newPageErrorIndicatorBuilder: (context) =>
                    errorDuringBrowsing(context, bloc.controller!),
                firstPageErrorIndicatorBuilder: (context) =>
                    errorDuringBrowsing(context, bloc.controller!),
                noItemsFoundIndicatorBuilder: noDataAvailable ??
                    (context) => Center(
                          child: TextWidget(
                            text: S.of(context).no_item_found,
                            style: context.titleM,
                          ),
                        ),
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                // crossAxisCount: context.sizeSide.smallSide ~/ 250,
                maxCrossAxisExtent: context.sizeSide.smallSide / 1.4,
                childAspectRatio: getRatio(
                  context,
                  // 1.4,
                  percentHight ??
                      (context.orientationInfo.isPortrait ? .5 : .4),
                ),
                crossAxisSpacing: horGab ?? context.deviceWidth * .015,
                mainAxisSpacing: verGab ?? context.deviceWidth * .015,
              ),
            ),
    };
  }

  double getRatio(BuildContext context, double percent) {
    // double cross = context.deviceWidth / crossPercent;
    // double main = context.sizeSide.smallSide;
    // return min(cross, main) / max(cross, main) * (context.orientationInfo.isPortrait ? (context.sizeSide.width / context.sizeSide.largeSide) : 1.58);
    return context.orientationInfo.isPortrait
        ? (context.sizeSide.width / context.sizeSide.largeSide) * percent
        : (context.sizeSide.height / context.sizeSide.largeSide) * percent;
  }
}

import 'package:belik_coin/src/features/coin_details/domain/entities/coin_name_entity.dart';
import 'package:belik_coin/src/features/coin_details/presentation/bloc/coin_details_bloc.dart';
import 'package:belik_coin/src/features/coin_details/presentation/page/coin_details_body.dart';
import 'package:belik_coin/src/features/coin_details/presentation/widgets/my_error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../widgets/loading_widget.dart';

class CoinDetailsPage extends StatelessWidget {
  const CoinDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinDetailsBloc>(
      create: (context) => injector<CoinDetailsBloc>()
        ..add(CoinDetailsFetchCoin(CoinNameEntity().bitcoin)),
      child: blocBuilder(context),
    );
  }

  Widget blocBuilder(BuildContext context) {
    return BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
      builder: (context, state) {
        if (state is CoinDetailsLoading) {
          return const LoadingWidget();
        }

        if (state is CoinDetailsLoaded) {
          return CoinDetailsBody(
            priceHistoryEntities: state.priceHistoryEntities,
          );
        }

        if (state is CoinDetailsError) {
          return MyErrorWidget(state.errorMessage);
        }

        return const SizedBox();
      },
    );
  }
}

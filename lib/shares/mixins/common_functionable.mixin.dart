import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/services/logging.service.dart';
import 'package:flutter_proj/states/cubit/mask_cubit.dart';
import 'package:flutter_proj/states/redux/global_store/global.reducer.dart';
import 'package:flutter_proj/states/redux/router_store/router.reducer.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

mixin CommonFunctionable {
  LoggingService get logger => GetIt.I<LoggingService>();
  AppRouter get router => GetIt.I<AppRouter>();

  // Bloc
  MaskCubit get maskCubit => GetIt.I<MaskCubit>();

  // Store
  Store<GlobalState> get globalStore => GetIt.I<Store<GlobalState>>();
  RouterState get routerState => globalStore.state.router;
}
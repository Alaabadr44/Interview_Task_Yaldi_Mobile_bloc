
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocConsumer, BlocListener;

import '../auth_bloc/auth_bloc.dart' show AuthBloc;
import '../auth_bloc/auth_state.dart' show AuthState;
import 'api_data_bloc.dart' show ApiDataBloc;
import 'api_data_state.dart' show ApiDataState;


// Data Bloc
typedef BlocDataListener<T> = BlocListener<ApiDataBloc<T>, ApiDataState<T>>;
typedef BlocDataBuilder<T> = BlocBuilder<ApiDataBloc<T>, ApiDataState<T>>;
typedef BlocDataConsumer<T> = BlocConsumer<ApiDataBloc<T>, ApiDataState<T>>;





// Auth Bloc
typedef BlocAuthListener<T> = BlocListener<AuthBloc<T>, AuthState<T>>;
typedef BlocAuthBuilder<T> = BlocBuilder<AuthBloc<T>, AuthState<T>>;
typedef BlocAuthConsumer<T> = BlocConsumer<AuthBloc<T>, AuthState<T>>;


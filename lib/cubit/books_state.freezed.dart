// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BooksStateTearOff {
  const _$BooksStateTearOff();

// ignore: unused_element
  _BooksState call({String parentId}) {
    return _BooksState(
      parentId: parentId,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  ErrorDetails error([String message]) {
    return ErrorDetails(
      message,
    );
  }
}

// ignore: unused_element
const $BooksState = _$BooksStateTearOff();

mixin _$BooksState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String parentId), {
    @required Result loading(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String parentId), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BooksState value), {
    @required Result loading(Loading value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BooksState value), {
    Result loading(Loading value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res>;
}

class _$BooksStateCopyWithImpl<$Res> implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  final BooksState _value;
  // ignore: unused_field
  final $Res Function(BooksState) _then;
}

abstract class _$BooksStateCopyWith<$Res> {
  factory _$BooksStateCopyWith(
          _BooksState value, $Res Function(_BooksState) then) =
      __$BooksStateCopyWithImpl<$Res>;
  $Res call({String parentId});
}

class __$BooksStateCopyWithImpl<$Res> extends _$BooksStateCopyWithImpl<$Res>
    implements _$BooksStateCopyWith<$Res> {
  __$BooksStateCopyWithImpl(
      _BooksState _value, $Res Function(_BooksState) _then)
      : super(_value, (v) => _then(v as _BooksState));

  @override
  _BooksState get _value => super._value as _BooksState;

  @override
  $Res call({
    Object parentId = freezed,
  }) {
    return _then(_BooksState(
      parentId: parentId == freezed ? _value.parentId : parentId as String,
    ));
  }
}

class _$_BooksState with DiagnosticableTreeMixin implements _BooksState {
  const _$_BooksState({this.parentId});

  @override
  final String parentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState(parentId: $parentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState'))
      ..add(DiagnosticsProperty('parentId', parentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BooksState &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(parentId);

  @override
  _$BooksStateCopyWith<_BooksState> get copyWith =>
      __$BooksStateCopyWithImpl<_BooksState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String parentId), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(parentId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String parentId), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BooksState value), {
    @required Result loading(Loading value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BooksState value), {
    Result loading(Loading value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BooksState implements BooksState {
  const factory _BooksState({String parentId}) = _$_BooksState;

  String get parentId;
  _$BooksStateCopyWith<_BooksState> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$BooksStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BooksState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String parentId), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String parentId), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BooksState value), {
    @required Result loading(Loading value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BooksState value), {
    Result loading(Loading value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements BooksState {
  const factory Loading() = _$Loading;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<$Res> extends _$BooksStateCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String parentId), {
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String parentId), {
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BooksState value), {
    @required Result loading(Loading value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BooksState value), {
    Result loading(Loading value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements BooksState {
  const factory ErrorDetails([String message]) = _$ErrorDetails;

  String get message;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}

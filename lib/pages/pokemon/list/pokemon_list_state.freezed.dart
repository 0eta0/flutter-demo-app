// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonListStateTearOff {
  const _$PokemonListStateTearOff();

  _PokemonListState call({Pokemon? data = null}) {
    return _PokemonListState(
      data: data,
    );
  }
}

/// @nodoc
const $PokemonListState = _$PokemonListStateTearOff();

/// @nodoc
mixin _$PokemonListState {
  Pokemon? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonListStateCopyWith<PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res>;
  $Res call({Pokemon? data});
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  final PokemonListState _value;
  // ignore: unused_field
  final $Res Function(PokemonListState) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }
}

/// @nodoc
abstract class _$PokemonListStateCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$PokemonListStateCopyWith(
          _PokemonListState value, $Res Function(_PokemonListState) then) =
      __$PokemonListStateCopyWithImpl<$Res>;
  @override
  $Res call({Pokemon? data});
}

/// @nodoc
class __$PokemonListStateCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res>
    implements _$PokemonListStateCopyWith<$Res> {
  __$PokemonListStateCopyWithImpl(
      _PokemonListState _value, $Res Function(_PokemonListState) _then)
      : super(_value, (v) => _then(v as _PokemonListState));

  @override
  _PokemonListState get _value => super._value as _PokemonListState;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_PokemonListState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }
}

/// @nodoc

class _$_PokemonListState implements _PokemonListState {
  const _$_PokemonListState({this.data = null});

  @JsonKey()
  @override
  final Pokemon? data;

  @override
  String toString() {
    return 'PokemonListState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PokemonListState &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$PokemonListStateCopyWith<_PokemonListState> get copyWith =>
      __$PokemonListStateCopyWithImpl<_PokemonListState>(this, _$identity);
}

abstract class _PokemonListState implements PokemonListState {
  const factory _PokemonListState({Pokemon? data}) = _$_PokemonListState;

  @override
  Pokemon? get data;
  @override
  @JsonKey(ignore: true)
  _$PokemonListStateCopyWith<_PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

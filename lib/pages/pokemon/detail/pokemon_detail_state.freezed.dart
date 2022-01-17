// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonDetailStateTearOff {
  const _$PokemonDetailStateTearOff();

  _PokemonDetailState call({Pokemon? data = null}) {
    return _PokemonDetailState(
      data: data,
    );
  }
}

/// @nodoc
const $PokemonDetailState = _$PokemonDetailStateTearOff();

/// @nodoc
mixin _$PokemonDetailState {
  Pokemon? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDetailStateCopyWith<PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailStateCopyWith<$Res> {
  factory $PokemonDetailStateCopyWith(
          PokemonDetailState value, $Res Function(PokemonDetailState) then) =
      _$PokemonDetailStateCopyWithImpl<$Res>;
  $Res call({Pokemon? data});
}

/// @nodoc
class _$PokemonDetailStateCopyWithImpl<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  _$PokemonDetailStateCopyWithImpl(this._value, this._then);

  final PokemonDetailState _value;
  // ignore: unused_field
  final $Res Function(PokemonDetailState) _then;

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
abstract class _$PokemonDetailStateCopyWith<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  factory _$PokemonDetailStateCopyWith(
          _PokemonDetailState value, $Res Function(_PokemonDetailState) then) =
      __$PokemonDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({Pokemon? data});
}

/// @nodoc
class __$PokemonDetailStateCopyWithImpl<$Res>
    extends _$PokemonDetailStateCopyWithImpl<$Res>
    implements _$PokemonDetailStateCopyWith<$Res> {
  __$PokemonDetailStateCopyWithImpl(
      _PokemonDetailState _value, $Res Function(_PokemonDetailState) _then)
      : super(_value, (v) => _then(v as _PokemonDetailState));

  @override
  _PokemonDetailState get _value => super._value as _PokemonDetailState;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_PokemonDetailState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }
}

/// @nodoc

class _$_PokemonDetailState implements _PokemonDetailState {
  const _$_PokemonDetailState({this.data = null});

  @JsonKey()
  @override
  final Pokemon? data;

  @override
  String toString() {
    return 'PokemonDetailState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PokemonDetailState &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      __$PokemonDetailStateCopyWithImpl<_PokemonDetailState>(this, _$identity);
}

abstract class _PokemonDetailState implements PokemonDetailState {
  const factory _PokemonDetailState({Pokemon? data}) = _$_PokemonDetailState;

  @override
  Pokemon? get data;
  @override
  @JsonKey(ignore: true)
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

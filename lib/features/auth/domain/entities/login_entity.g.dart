// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthEntityAdapter extends TypeAdapter<AuthEntity> {
  @override
  final int typeId = 0;

  @override
  AuthEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthEntity(
      loginData: (fields[0] as Map?)?.cast<String, dynamic>(),
      logiMessage: fields[1] as String?,
      logiStatus: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.loginData)
      ..writeByte(1)
      ..write(obj.logiMessage)
      ..writeByte(2)
      ..write(obj.logiStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gorev_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GorevAdapter extends TypeAdapter<Gorev> {
  @override
  final int typeId = 1;

  @override
  Gorev read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gorev(
      id: fields[0] as String,
      name: fields[1] as String,
      olusturmaZamani: fields[2] as DateTime,
      tamamlandiMi: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Gorev obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.olusturmaZamani)
      ..writeByte(3)
      ..write(obj.tamamlandiMi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GorevAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

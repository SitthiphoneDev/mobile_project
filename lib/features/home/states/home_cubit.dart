import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/constants/enum.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    try {
      emit(state.copyWith(isLoading: true));
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        emit(state.copyWith(
          image: File(pickedFile.path),
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Error picking image: $e',
      ));
    }
  }

  void clearImage() {
    emit(state.copyWith(image: null, error: null));
  }
}

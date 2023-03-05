import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poffeh_app/screen/add_department/cubit/states.dart';
import 'package:image_picker/image_picker.dart';


class AddDepartmentCubit extends Cubit<AddDepartmentStates>{
  AddDepartmentCubit():super(AddDepartmentInitialState());
  static AddDepartmentCubit get(context) => BlocProvider.of(context);

  //to pick photo from the phone (dont forget installing image_picker package)
  var picker = ImagePicker();
  File? image;  //rename this variable as you need if use this code for new project (dont forget you must import 'dart:io')
  Future<void> getImage() async {  //rename this function as you need if use this code for new project
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path); //rename the variable profileImage the same name you named above if use this code for new project
      emit(ImagePickedSuccessState()); //rename state as you need if use this code for new project (dont forget make this state in states file)
    } else {
      print('No image selected.');
      emit(ImagePickedErrorState()); //rename state as you need if use this code for new project (dont forget make this state in states file)
    }
  }
}
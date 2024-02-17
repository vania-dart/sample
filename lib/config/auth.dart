import 'package:vania_sample/app/models/user.dart';

Map<String,dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': User(),
    }
  }
};
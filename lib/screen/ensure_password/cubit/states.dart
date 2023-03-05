
import '../../../models/ensure_model.dart';

abstract class EnsureStates{}

class EnsureInitialState extends EnsureStates{}

class EnsureLoadingState extends EnsureStates{}
class EnsureSuccessState extends EnsureStates{
  final EnsureModel ensureModel;
  EnsureSuccessState(this.ensureModel);
}
class EnsureErorrState extends EnsureStates{
  final String error;
  EnsureErorrState(this.error);
}


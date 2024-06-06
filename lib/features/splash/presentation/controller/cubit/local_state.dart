part of 'local_cubit.dart';

@immutable
abstract class LocalState extends Equatable{
  final Locale locale;
  const LocalState(this.locale);
  List<Object?> get props => [locale];


}

class ChangeLocalState extends LocalState {
  const ChangeLocalState(Locale selectedLocal):super(selectedLocal);

}

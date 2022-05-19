
abstract class DataState<T> {
  const DataState({
    this.data,
    this.messageError
  });

  final T? data;
  final String? messageError;

}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String? messageError)
      : super(messageError: messageError);

  static String doMessageError(Object? e, StackTrace st) {
    final String str = '${e.toString()} \n ${st.toString()}';
    return str;
  }

  // static String myThrow() {
  //   return 'Something went wrong.\n';
  // }
  //
  // static String myThrowNull() {
  //   return 'Data is NULL.\n';
  // }
  //
  // static bool isDataNull(DataState ds) {
  //   return ds.messageError!.toLowerCase().contains('null');
  // }
}

class DataNull<T> extends DataState<T> {
  const DataNull();
}

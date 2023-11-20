/**
 * Representa uma resposta utilizada no controller
 */
class Response<T, K> {
  final T? data;
  final K? error;

  Response({
    this.data,
    this.error,
  })  : assert(data != null || error != null,
            'data e error não devem ser nulos simultaneamente'),
        assert(data == null || error == null,
            'data e error não devem ser não-nulos simultaneamente');

  @override
  String toString() => 'Response(data: $data, error: $error)';
}

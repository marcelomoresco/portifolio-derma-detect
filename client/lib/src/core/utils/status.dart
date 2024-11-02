enum Status { initial, loading, success, failure }

extension StatusIdentifier on Status {
  get isInitial => this == Status.initial;
  get isLoading => this == Status.loading;
  get isSuccess => this == Status.success;
  get isFailure => this == Status.failure;
}

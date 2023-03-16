abstract class Error{
  final String message;
  Error({required this.message});
}

class NetworkError extends Error{
  NetworkError({required super.message});
}

class BadRequestError extends Error{
  BadRequestError({required super.message});
}

class UnauthorizedError extends Error{
  UnauthorizedError({required super.message});
}

class PageNotFoundError extends Error{
  PageNotFoundError({required super.message});
}

class ServerError extends Error{
  ServerError({required super.message});
}

class ForbiddenError extends Error{
  ForbiddenError({required super.message});
}

class UnknownError extends Error{
  UnknownError({required super.message});
}
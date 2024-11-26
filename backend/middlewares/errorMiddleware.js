const errorHandler = (err, req, res, next) => {
  // padrao 500
  let statusCode =
    res.statusCode && res.statusCode !== 200 ? res.statusCode : 500;
  let message = err.message;

  // validação do MongoDB
  if (err.name === "ValidationError") {
    statusCode = 400;
    message = Object.values(err.errors)
      .map((val) => val.message)
      .join(", ");
  }

  //  duplicação de chave única no MongoDB
  if (err.code && err.code === 11000) {
    statusCode = 400;
    message = "Duplicated field value entered";
  }

  if (err instanceof mongoose.Error.CastError) {
    statusCode = 404;
    message = `Resource not found with id of ${err.value}`;
  }

  //  erro de autenticação JWT
  if (err.name === "JsonWebTokenError") {
    statusCode = 401;
    message = "Invalid token. Authorization denied";
  }

  if (err.name === "TokenExpiredError") {
    statusCode = 401;
    message = "Token expired. Please log in again";
  }

  res.status(statusCode).json({
    message: message,
    statusCode: statusCode,
    exception: process.env.NODE_ENV === "development" ? err.stack : undefined,
  });
};

module.exports = { errorHandler };

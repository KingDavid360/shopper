class ApiRoute {
  //local endpoint
  static const local = "http://localhost:8000";

  static const base = "$local/ecommerce";
  static const merchantBase = "$local/merchants";

  //customer
  static const signUp = "$base/register-customer";
  static const login = "$base/login-user";
  static const addCart = "$base/add-cart";
  static const fetchCart = "$base/fetch-cart";
  static const fetchProducts = "$base/fetch-product";
  static const rateProduct = "$base/rate-product";

  //merchants
  static const merchantSignUp = "$merchantBase/register-merchant";
  static const createProduct = "$merchantBase/create-product";
}

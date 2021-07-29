/// 验证器
class Validator {
  /// 最小字符长度
  static bool miniStringLength(String str, int length) {
    if (str == null || str.isEmpty) {
      return false;
    }
    return str.length >= length;
  }
}

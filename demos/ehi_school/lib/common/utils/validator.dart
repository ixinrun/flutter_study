/// 最小字符长度
bool miniStringLength(String str, int length) {
  if (str == null || str.isEmpty) {
    return false;
  }
  return str.length >= length;
}

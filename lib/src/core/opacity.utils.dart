class OpacityUtils {
  static double calculateOpacity({
    zeroOpacityOffset = 0,
    fullOpacityOffset = 0,
    offset = 0,
  }) {
    if (fullOpacityOffset == zeroOpacityOffset) {
      return 1;
    } else if (fullOpacityOffset > zeroOpacityOffset) {
      // fading in
      if (offset <= zeroOpacityOffset) {
        return 0;
      } else if (offset >= fullOpacityOffset) {
        return 1;
      } else {
        return (offset - zeroOpacityOffset) /
            (fullOpacityOffset - zeroOpacityOffset);
      }
    } else {
      // fading out
      if (offset <= fullOpacityOffset) {
        return 1;
      } else if (offset >= zeroOpacityOffset) {
        return 0;
      } else {
        return (offset - fullOpacityOffset) /
            (zeroOpacityOffset - fullOpacityOffset);
      }
    }
  }
}

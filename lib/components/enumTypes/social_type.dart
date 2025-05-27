enum SocialType {
  google,
  facebook,
  apple;

  String get iconPath {
    switch (this) {
      case SocialType.google:
        return 'assets/icons/google.png';
      case SocialType.facebook:
        return 'assets/icons/facebook.png';
      case SocialType.apple:
        return 'assets/icons/apple.png';
    }
  }
}

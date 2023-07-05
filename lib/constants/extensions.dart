import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sot/common_libs.dart';

extension Sizes on SizedBox {
  SizedBox operator *(num factor) {
    return SizedBox(
      height: (height ?? 0) * factor,
    );
  }
}

extension DeviceStyles on BuildContext {
  TextStyle? bodyLarge({
    final FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
    String? fontFamily,
  }) {
    final style = Theme.of(this).textTheme.bodyLarge;
    final size = fontSize ?? style?.fontSize;
    return style?.copyWith(
      fontWeight: fontWeight ?? style.fontWeight,
      color: color ?? style.color,
      height: height ?? style.height,
      fontSize: size,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  TextStyle? bodyNotoSerif({
    final FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
    String? fontFamily,
  }) {
    final style = GoogleFonts.notoSerifMalayalam(
      fontSize: bodyLargeDefaultSize,
      color: kDarkColor,
      fontWeight: FontWeight.w600,
    );

    final size = fontSize ?? style.fontSize;
    return style.copyWith(
      fontWeight: fontWeight ?? style.fontWeight,
      color: color ?? style.color,
      height: height ?? style.height,
      fontSize: size,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  TextStyle? bodyNotoSerifTitle({
    final FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
    String? fontFamily,
  }) {
    final style = GoogleFonts.notoSerifMalayalam(
      fontSize: 35,
      color: kDarkColor,
      fontWeight: FontWeight.w600,
    );

    final size = fontSize ?? style.fontSize;
    return style.copyWith(
      fontWeight: fontWeight ?? style.fontWeight,
      color: color ?? style.color,
      height: height ?? style.height,
      fontSize: size,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  TextStyle? bodyMedium({
    final FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    String? fontFamily,
    double? height,
    FontStyle? fontStyle,
  }) {
    final style = Theme.of(this).textTheme.bodyMedium;
    final size = fontSize ?? style?.fontSize;
    return style?.copyWith(
      // height: height ?? style.height,
      height: 1.5,
      fontStyle: fontStyle ?? style.fontStyle,
      fontWeight: fontWeight ?? style.fontWeight,
      fontSize: size,
      color: color ?? style.color,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  InputDecoration inputDecoration(
      {Widget? prefixIcon,
      Widget? suffixIcon,
      Widget? icon,
      String? labelText,
      String? hintText,
      String? errorText,
      String? helperText,
      String? prefixText,
      String? suffixText,
      String? counterText,
      String? semanticCounterText,
      InputBorder? border,
      InputBorder? focusedBorder,
      InputBorder? enabledBorder,
      InputBorder? errorBorder,
      TextStyle? hintStyle,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      TextStyle? helperStyle,
      TextStyle? prefixStyle,
      TextStyle? suffixStyle,
      TextStyle? counterStyle,
      TextStyle? floatingLabelStyle,
      EdgeInsets? padding}) {
    final borderRadius = BorderRadius.circular(cornersSmall);
    final borderSide = BorderSide(
      width: .8,
      color: textColor,
    );
    return InputDecoration(
      errorMaxLines: 5,
      hintStyle: hintStyle ?? bodyMedium(),
      labelStyle: labelStyle ?? bodyMedium(),
      errorStyle: errorStyle ?? bodyMedium(color: Colors.red),
      helperStyle: helperStyle ?? bodyMedium(),
      prefixStyle: prefixStyle ?? bodyMedium(),
      suffixStyle: suffixStyle ?? bodyMedium(),
      counterStyle: counterStyle ?? bodyMedium(),
      floatingLabelStyle: floatingLabelStyle ?? bodyMedium(),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      icon: icon,
      contentPadding: padding ??
          const EdgeInsets.only(
              left: kDefaultPadding / 2, right: kDefaultPadding / 2),
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixText: prefixText,
      suffixText: suffixText,
      counterText: counterText,
      semanticCounterText: semanticCounterText,
      border: border ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(
              width: .8,
              color: Colors.red,
            ),
          ),
    );
  }
}

extension DeviceTheme on BuildContext {
  Brightness get _platformBrightness => MediaQuery.of(this).platformBrightness;
  bool get $isLightMode => _platformBrightness == Brightness.light;
  bool get $isDarkMode => _platformBrightness == Brightness.dark;

  Color get textColor => $isLightMode ? kDarkColor : kLightColor;
  Color get backgroundColor => $isLightMode ? kLightColor : kDarkColor;

  Divider get divider => Divider(
        color: textColor.withOpacity($isLightMode ? .3 : .8),
      );

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: kLightColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: kPrimaryColor),
        canvasColor: kLightColor,
        dialogBackgroundColor: kLightColor,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: kGoldDark),
        cardColor: kLightColor,
        iconTheme:
            ThemeData.light().iconTheme.copyWith(color: kDarkColor, size: 22),
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(this).textTheme.copyWith(
                bodyLarge: const TextStyle(
                  fontSize: bodyLargeDefaultSize,
                  color: kDarkColor,
                  fontWeight: FontWeight.w600,
                ),
                bodyMedium: const TextStyle(
                  fontSize: bodyMediumDefaultSize,
                  color: kDarkColor,
                ),
              ),
        ).apply(
          bodyColor: kDarkColor,
        ),
      );
}

extension DeviceSize on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  Size get _size => _mediaQuery.size;
  double get bottom => _mediaQuery.viewInsets.bottom;

  double get topPadding => _mediaQuery.padding.top;
  double get screenHeight => _size.height;
  double get screenWidth => _size.width;
}

extension DeviceAppBar on BuildContext {
  PreferredSizeWidget clothesAppBar({required Widget child}) {
    final topPadding = MediaQuery.of(this).padding.top;

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            color: kGoldDark,
          ),
          padding: EdgeInsets.only(
            top: topPadding,
          ),
          margin: const EdgeInsets.only(bottom: kDefaultMargin / 2),
          child: child),
    );
  }

  PreferredSizeWidget basicTextAppBar({
    String? text,
    bool backEnabled = true,
    List<Widget> actions = const [],
  }) =>
      clothesAppBar(
          child: Row(
        children: [
          if (backEnabled)
            IconButton(
              onPressed: () {
                router.pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: kLightColor,
              ),
            ),
          Expanded(
            child: Text(
              text ?? '',
              style: bodyLarge(color: kLightColor),
            ),
          ),
          ...actions,
        ],
      ));

  Widget screenContainer({
    required Widget child,
  }) =>
      AnimatedContainer(
        duration: medDuration,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        alignment: Alignment.center,
        width: ResponsiveWidget.isMediumScreen(this) ||
                ResponsiveWidget.isSmallScreen(this)
            ? MediaQuery.of(this).size.width
            : largeScreenSize.toDouble(),
        child: child,
      );
}

extension DeviceBar on BuildContext {
  Future<T?> showBottomBar<T>({
    required Widget child,
    double? height,
    bool dismissable = true,
    bool ignoreHeight = false,
  }) {
    final defaultHeight = screenHeight - (topPadding + kToolbarHeight * 2);

    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(cornersMedium),
      topRight: Radius.circular(cornersMedium),
    );
    final result = showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      isDismissible: dismissable,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: height ?? defaultHeight),
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
          height: ignoreHeight ? null : height,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
    );
    return result;
  }

  Future<T?> showAlertDialog<T>(
      {IconData? icon,
      required String title,
      String? desctiption,
      List<Widget> actions = const []}) {
    return showCustomAlertDIalog(
      icon: Icon(
        icon ?? Icons.info_rounded,
        color: $isDarkMode ? kLightColor : kGoldDark,
        size: 70,
      ),
      title: title,
      description: desctiption,
      children: [
        verticalSpaceMedium,
        ...actions,
      ],
    );
  }

  Future<T?> showInformationDialog<T>(String desciption) {
    return showAlertDialog<T>(
        title: "Information",
        desctiption: desciption,
        actions: [
          AppBtn.from(
            onPressed: () => router.pop(),
            isSecondary: $isDarkMode,
            text: "Close",
            isElevated: false,
            expand: true,
            isOutlined: true,
            icon: Icons.close,
          ).fadeIn(),
        ]);
  }

  Future<T?> $showGeneralDialog<T>({
    required Widget child,
    required String barrierLabel,
    bool dismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: dismissible,
      barrierLabel: barrierLabel,
      barrierColor: kDarkColor.withOpacity(0.5),
      transitionDuration: fastDuration,
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(cornersMedium),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(anim),
        child: child,
      ),
    );
  }

  Future<Y?> showErrorDialog<Y>(
    String? cause, {
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar(
      child: InformationWidget(
        icon: icon ??
            const Icon(
              Icons.error_rounded,
              color: Colors.red,
              size: 70,
            ),
        title: title ?? 'Error Occurred',
        description: cause ??
            'An error occurred with the data fetch, please try again later.',
        children: children,
      ),
    );
  }

  Future<S?> showSuccessDialog<S>(
    String description, {
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar<S>(
      child: InformationWidget(
        icon: icon ??
            const Icon(
              Icons.check_rounded,
              color: Colors.green,
              size: 70,
            ),
        title: title ?? 'Successful',
        description: description,
        children: children,
      ),
    );
  }

  Future<S?> showCustomAlertDIalog<S>({
    String? description,
    String? title,
    Icon? icon,
    List<Widget> children = const [],
  }) {
    return showBottomBar<S>(
      child: InformationWidget(
        icon: icon,
        title: title,
        description: description,
        children: children,
      ),
    );
  }
}

extension DeviceWidget on BuildContext {
  Widget errorWidget(
      {required VoidCallback onRefresh,
      String? description,
      EdgeInsets? padding,
      String? title,
      String? btnText,
      IconData? btnIcon,
      String? lottie}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(lottie ?? lottieError,
                width: 250,
                animate: true,
                reverse: true,
                repeat: true,
                height: 250,
                fit: BoxFit.contain,
                alignment: Alignment.center),
          ),
          Text(
            title ?? 'Error Occurred',
            style: bodyLarge(),
          ),
          verticalSpaceSmall,
          Text(
            description ?? 'An error occurred, please try again. ',
            style: bodyMedium(),
          ),
          verticalSpaceLarge,
          AppBtn.from(
            expand: true,
            isOutlined: true,
            onPressed: () => onRefresh.call(),
            isSecondary: $isDarkMode,
            text: btnText ?? "Refresh",
            icon: btnIcon ?? Icons.refresh_rounded,
          ),
        ],
      ),
    );
  }

  Widget noDataWidget(
      {String? description,
      EdgeInsets? padding,
      String? title,
      String? lottie}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottie ?? lottieNoData,
              width: 250,
              animate: true,
              reverse: true,
              repeat: true,
              height: 250,
              fit: BoxFit.contain,
              alignment: Alignment.center),
          Text(
            title ?? "No Data",
            style: bodyLarge(),
          ),
          verticalSpaceSmall,
          Text(
            description ??
                'This section currently contains no data, please check back later.',
            style: bodyMedium(),
          ),
        ],
      ),
    );
  }
}

extension AppIterableExtensions<T> on Iterable<T> {
  Iterable<T> merge(Iterable<T> other) sync* {
    Iterator<T> iter1 = iterator;
    Iterator<T> iter2 = other.iterator;

    bool has1 = iter1.moveNext();
    bool has2 = iter2.moveNext();
    while (has1 && has2) {
      yield iter1.current;
      yield iter2.current;
      has1 = iter1.moveNext();
      has2 = iter2.moveNext();
    }
    while (has1) {
      yield iter1.current;
      has1 = iter1.moveNext();
    }
    while (has2) {
      yield iter2.current;
      has2 = iter2.moveNext();
    }
  }
}

extension WidgetAnimation on Widget {
  fadeInAndMoveFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, -10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeInAndMoveFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, 10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? fastDuration).fade(
          duration: animationDuration ?? fastDuration,
          curve: curve ?? Curves.decelerate);
}

extension PriceFormatter on num {
  String formatPrice() {
    String symbol = '\$ ';
    double amount = toDouble();

    final formatCurrency = NumberFormat.currency(
      locale: 'en_US',
      symbol: symbol,
    );
    return formatCurrency.format(amount);
  }

// this converts from USD to the local currency
  double priceToBase([int? limit]) {
    double amount = toDouble();
    if (limit != null) {
      amount = num.parse(amount.toStringAsFixed(2)).toDouble();
    }
    return amount;
  }

//this converts from the local currency to USD
  double priceFromBase([int? limit]) {
    double amount = toDouble();
    if (limit != null) {
      amount = num.parse(amount.toStringAsFixed(2)).toDouble();
    }

    return amount;
  }
}

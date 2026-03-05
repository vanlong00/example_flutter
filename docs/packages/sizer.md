# sizer — Responsive UI Package

> **Phiên bản hiện tại:** `^3.1.3` · [pub.dev](https://pub.dev/packages/sizer) · [GitHub](https://github.com/TechnoPrashant/Sizer) · License: MIT

Giải pháp responsive UI tự động thích ứng với mọi kích thước màn hình (Mobile, Web, Desktop).

---

## Mục lục

- [Cài đặt & Khởi tạo](#cài-đặt--khởi-tạo)
- [Extensions — API chính](#extensions--api-chính)
- [Device — Thông tin thiết bị](#device--thông-tin-thiết-bị)
- [Cấu hình Sizer Widget](#cấu-hình-sizer-widget)
- [Ví dụ sử dụng](#ví-dụ-sử-dụng)
- [Câu hỏi thường gặp](#câu-hỏi-thường-gặp)
- [Lịch sử phiên bản](#lịch-sử-phiên-bản)

---

## Cài đặt & Khởi tạo

```dart
import 'package:sizer/sizer.dart';
```

Bọc `MaterialApp` bằng `Sizer`:

```dart
Sizer(
  builder: (context, orientation, screenType) {
    return MaterialApp(
      home: HomePage(),
    );
  },
);
```

---

## Extensions — API chính

### Kích thước theo % màn hình

| Extension | Class tương đương | Mô tả                              |
| --------- | ----------------- | ---------------------------------- |
| `.h`      | `Adaptive.h()`    | % chiều **cao** màn hình           |
| `.w`      | `Adaptive.w()`    | % chiều **rộng** màn hình          |
| `.sh`     | `Adaptive.sh()`   | % chiều cao sau khi áp `SafeArea`  |
| `.sw`     | `Adaptive.sw()`   | % chiều rộng sau khi áp `SafeArea` |

> **Ưu tiên dùng `.h` / `.w`**, chỉ dùng `.sh` / `.sw` khi muốn tính toán dựa trên vùng hiển thị sau SafeArea.

### Font size

| Extension | Class tương đương | Công thức tính                                           |
| --------- | ----------------- | -------------------------------------------------------- |
| `.dp`     | `Adaptive.dp()`   | Dựa trên `devicePixelRatio` (gần với Material Design dp) |
| `.sp`     | `Adaptive.sp()`   | Dựa trên pixel density + aspect ratio                    |

> `.dp` dùng cho kích thước layout; `.sp` dùng cho các trường hợp cần scale theo tỉ lệ màn hình.

### Đơn vị vật lý / CSS-like

| Extension | Mô tả               |
| --------- | ------------------- |
| `.px`     | Pixels              |
| `.cm`     | Centimeters         |
| `.mm`     | Millimeters         |
| `.Q`      | Quarter-millimeters |
| `.inches` | Inches              |
| `.pc`     | Picas (1/6 inch)    |
| `.pt`     | Points (1/72 inch)  |

---

## Device — Thông tin thiết bị

```dart
Device.orientation   // Orientation.portrait | Orientation.landscape
Device.screenType    // ScreenType.mobile | ScreenType.tablet | ScreenType.desktop*
Device.aspectRatio   // double
Device.pixelRatio    // double
Device.boxConstraints // BoxConstraints
```

> `*` `ScreenType.desktop` chỉ khả dụng khi đã cấu hình `maxTabletWidth` trong `Sizer`.

---

## Cấu hình Sizer Widget

| Tham số          | Kiểu     | Mặc định      | Mô tả                                           |
| ---------------- | -------- | ------------- | ----------------------------------------------- |
| `maxMobileWidth` | `double` | `599`         | Chiều rộng tối đa của mobile; lớn hơn → tablet  |
| `maxTabletWidth` | `double` | _(không đặt)_ | Chiều rộng tối đa của tablet; lớn hơn → desktop |

```dart
Sizer(
  maxMobileWidth: 599,
  maxTabletWidth: 1024, // bật Desktop ScreenType
  builder: (context, orientation, screenType) {
    return MaterialApp(home: HomePage());
  },
);
```

---

## Ví dụ sử dụng

### Widget Size

```dart
Container(
  width: Adaptive.w(20),  // 20% chiều rộng màn hình
  height: 30.5.h,         // 30.5% chiều cao màn hình
)
```

### Font Size

```dart
Text(
  'Hello Sizer',
  style: TextStyle(fontSize: 15.dp),
)
```

### Responsive theo Orientation

```dart
Device.orientation == Orientation.portrait
    ? Container(width: 100.w, height: 20.h)   // Dọc
    : Container(width: 100.w, height: 12.5.h) // Ngang
```

### Responsive theo ScreenType (Mobile / Tablet)

```dart
Device.screenType == ScreenType.tablet
    ? Container(width: 60.w, height: 20.h)  // Tablet
    : Container(width: 100.w, height: 15.h) // Mobile
```

---

## Câu hỏi thường gặp

**Auto import không hoạt động trong VSCode / Android Studio?**

Dart extension methods không kích hoạt auto-import. Gõ `Device` để gợi ý import hiện ra, hoặc thêm thủ công:

```dart
import 'package:sizer/sizer.dart';
```

**Sự khác biệt giữa `.sp` và `.dp`?**

- `.dp` → tính theo `devicePixelRatio` (xấp xỉ Material Design dp, nhưng không dùng physical width vì Flutter không cung cấp trực tiếp).
- `.sp` → tính theo pixel density **và** aspect ratio, phù hợp cho scale font trên màn hình có tỉ lệ khác thường.

---

## Lịch sử phiên bản

| Phiên bản         | Ngày       | Thay đổi nổi bật                               |
| ----------------- | ---------- | ---------------------------------------------- |
| **3.1.3**         | 26.08.2025 | Fix minor bug                                  |
| **3.1.2**         | 26.08.2025 | Fix minor bug                                  |
| **3.1.1**         | 26.08.2025 | Fix minor bug                                  |
| **3.1.0**         | 26.08.2025 | Cập nhật lint support, fix minor bug           |
| **3.0.5**         | —          | —                                              |
| **3.0.4**         | 19.11.2024 | Lint support 5.0.0, thêm FAQ `.sp` vs `.dp`    |
| **3.0.4** _(tag)_ | 10.08.2024 | Đổi tên thành **Sizer**                        |
| **3.0.3–3.0.1**   | 10.08.2024 | Cập nhật hướng dẫn (Guidance)                  |
| **3.0.0**         | 10.08.2024 | Hỗ trợ Flutter 3.13, fix toàn bộ issue         |
| **2.0.14**        | 15.09.2021 | Thêm method cho responsive web                 |
| **2.0.1–2.0.13**  | 20.04.2021 | Fix multiplatform bugs, fix Sizer widget class |
| **2.0.0**         | 20.04.2021 | Flutter 2.0, hỗ trợ Web & Desktop              |
| **1.1.1–1.1.0**   | 22.10.2020 | Thêm `Orientation` và `DeviceType`             |
| **0.1.3**         | 19.10.2020 | Thay đổi font size method                      |
| **0.1.0**         | 15.10.2020 | Phiên bản khởi đầu (initial release)           |
| **0.0.1**         | 15.10.2020 | First release                                  |

---

> **Nguồn:** [pub.dev/packages/sizer](https://pub.dev/packages/sizer) · [Changelog](https://pub.dev/packages/sizer/changelog)

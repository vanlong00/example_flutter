# Launcher Icon — Image Specifications

Thư mục này chứa các file ảnh dùng để tạo app icon cho PArchiver trên tất cả nền tảng.
Sau khi đặt đầy đủ ảnh, chạy lệnh:

```bash
flutter pub get
dart run flutter_launcher_icons
```

---

## Danh sách file cần chuẩn bị

| File | Kích thước | Mô tả |
|------|-----------|-------|
| `icon.png` | **1024 × 1024 px** | Icon chính — nền trắng đặc, dùng cho iOS + Android fallback |
| `icon_transparent.png` | **1024 × 1024 px** | Icon transparent — dùng cho Android Adaptive foreground & Monochrome |

> Background của Adaptive Icon dùng màu hex trực tiếp trong `flutter_launcher_icons.yaml` (`adaptive_icon_background`), không cần file ảnh.

---

## Yêu cầu kỹ thuật

### `icon.png` — Icon chính
- **Nền đặc, không transparent** (iOS không hỗ trợ alpha)
- Nội dung lấp đầy toàn bộ khung, không padding thừa
- Màu nền: `#FFFFFF` (trắng)

### `icon_transparent.png` — Adaptive Foreground + Monochrome
- Nền **transparent (trong suốt)**
- Vùng an toàn (safe zone): nội dung chính nằm trong **vòng tròn 66%** trung tâm (~672 px trên 1024 px) — phần ngoài có thể bị crop tùy launcher
- Padding khuyến nghị: **~16% mỗi cạnh** (~164 px)
- Khi dùng làm **Monochrome** (Android 13+): icon đơn sắc, hệ thống tự tô màu theo theme người dùng — đường nét cần rõ ràng

---

## Lưu ý

- **Định dạng:** PNG (32-bit), không dùng JPG
- **Không gian màu:** sRGB
- **Không bo góc** — hệ điều hành tự bo theo từng platform
- **Không thêm shadow/glow** — iOS/Android tự render
- Sau khi chạy `dart run flutter_launcher_icons`, các file trong `android/` và `ios/` được sinh tự động — không chỉnh sửa thủ công

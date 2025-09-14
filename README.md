# 🥞 크레페 (Crepe) - 커미션 플랫폼 앱

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Web](https://img.shields.io/badge/Web-FF6B6B?style=for-the-badge&logo=google-chrome&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)

**크리에이터와 클라이언트를 연결하는 커미션 플랫폼**

[🌐 웹 데모](#) • [📱 iOS 다운로드](#) • [🤖 Android 다운로드](#)

</div>

## 📖 프로젝트 소개

크레페는 [crepe.cm](https://crepe.cm) 웹사이트를 기반으로 한 **크로스 플랫폼 커미션 플랫폼 앱**입니다. 
일러스트, 디자인, 영상 등 다양한 창작물 커미션을 쉽게 의뢰하고 수행할 수 있는 모바일 및 웹 환경을 제공합니다.

### ✨ 주요 기능

- 🎨 **다양한 커미션 카테고리**: 일러스트, 디자인, 영상, 음악 등 9개 카테고리
- 🏷️ **스마트 필터링**: 카테고리별, 가격대별, 작업기간별 필터링
- ⭐ **평점 및 리뷰 시스템**: 실제 의뢰인들의 생생한 후기
- 🎠 **인터랙티브 배너**: 자동 슬라이드 배너로 주요 정보 제공
- 📊 **실시간 통계**: 31,609건의 진행 중인 커미션 현황
- 🔍 **직관적인 검색**: 빠르고 정확한 커미션 검색
- 💬 **커뮤니케이션**: 크리에이터와 클라이언트 간 소통 지원

## 🚀 기술 스택

### Frontend
- **Flutter 3.24.3** - 크로스 플랫폼 UI 프레임워크
- **Dart 3.5.3** - 프로그래밍 언어
- **Provider** - 상태 관리
- **Go Router** - 내비게이션 관리

### 패키지 및 라이브러리
- `cached_network_image` - 이미지 캐싱 및 최적화
- `json_annotation` & `json_serializable` - JSON 직렬화
- `font_awesome_flutter` - 아이콘
- `shimmer` - 로딩 애니메이션
- `http` - API 통신

### 지원 플랫폼
- ✅ **iOS** (17.0+)
- ✅ **Android** (API 21+)
- ✅ **웹** (Chrome, Safari, Firefox)
- ✅ **macOS** (10.14+)
- ⏳ **Windows** (준비 중)
- ⏳ **Linux** (준비 중)

## 📱 스크린샷

<div align="center">

| 홈 화면 | 커미션 리스트 | 카테고리 | 상세 페이지 |
|---------|---------------|----------|-------------|
| ![Home](screenshots/home.png) | ![List](screenshots/list.png) | ![Category](screenshots/category.png) | ![Detail](screenshots/detail.png) |

</div>

## 🏗️ 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── models/                   # 데이터 모델
│   ├── banner.dart          # 배너 모델
│   ├── category.dart        # 카테고리 모델
│   ├── commission.dart      # 커미션 모델
│   └── user.dart           # 사용자 모델
├── services/                # 비즈니스 로직
│   └── data_service.dart   # 데이터 서비스
├── widgets/                 # 재사용 가능한 위젯
│   ├── commission_card.dart
│   ├── category_grid.dart
│   ├── review_card.dart
│   └── simple_banner_carousel.dart
├── screens/                 # 화면 위젯
│   ├── home_screen.dart
│   └── commission_list_screen.dart
└── utils/                   # 유틸리티
    └── constants.dart

assets/
├── data/                    # JSON 데이터
│   ├── banners.json
│   ├── categories.json
│   ├── commissions.json
│   └── reviews.json
└── images/                  # 이미지 리소스
    └── banner_success.png
```

## 🛠️ 설치 및 실행

### 사전 요구사항
- Flutter SDK 3.24.3+
- Dart SDK 3.5.3+
- iOS: Xcode 16.4+ (iOS 개발 시)
- Android: Android Studio (Android 개발 시)

### 설치 방법

1. **저장소 클론**
   ```bash
   git clone https://github.com/kimhuisik/crepe.git
   cd crepe
   ```

2. **의존성 설치**
   ```bash
   flutter pub get
   ```

3. **JSON 모델 생성**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **앱 실행**
   
   **웹에서 실행:**
   ```bash
   flutter run -d chrome --web-renderer html
   ```
   
   **iOS 시뮬레이터에서 실행:**
   ```bash
   flutter run -d ios
   ```
   
   **Android 에뮬레이터에서 실행:**
   ```bash
   flutter run -d android
   ```
   
   **macOS에서 실행:**
   ```bash
   flutter run -d macos
   ```

## 📊 앱 현황

- **총 커미션**: 31,609건 진행 중
- **카테고리**: 9개 주요 분야
- **평균 평점**: 4.8/5.0
- **지원 플랫폼**: 4개 (iOS, Android, Web, macOS)

## 🎯 주요 화면

### 🏠 홈 화면
- **배너 캐러셀**: 주요 공지사항 및 이벤트
- **카테고리 그리드**: 9개 커미션 카테고리
- **인기 커미션**: 추천 작품들
- **통계 정보**: 실시간 커미션 현황
- **최신 후기**: 사용자 리뷰

### 📋 커미션 리스트
- **카테고리 필터**: 원하는 분야별 필터링
- **그리드 레이아웃**: 직관적인 카드 형태
- **상세 정보**: 가격, 평점, 작업기간 표시

## 🔧 개발 가이드

### 새로운 기능 추가

1. **모델 생성**: `lib/models/`에 새 모델 추가
2. **서비스 로직**: `lib/services/`에 비즈니스 로직 구현
3. **UI 컴포넌트**: `lib/widgets/`에 재사용 가능한 위젯 생성
4. **화면 구성**: `lib/screens/`에 새 화면 추가

### 코드 품질 가이드라인

- **파일 크기**: 단일 파일 최대 300줄 제한
- **컴포넌트 분리**: 기능별 모듈화
- **타입 안전성**: 강타입 사용 권장
- **문서화**: 주요 함수에 주석 추가

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 👨‍💻 개발자

**김휘식** - [@kimhuisik](https://github.com/kimhuisik)

프로젝트 링크: [https://github.com/kimhuisik/crepe](https://github.com/kimhuisik/crepe)

## 🙏 감사의 말

- [Flutter Team](https://flutter.dev/) - 훌륭한 크로스 플랫폼 프레임워크
- [crepe.cm](https://crepe.cm) - 영감을 준 원본 웹사이트
- 모든 오픈소스 기여자들

---

<div align="center">

**⭐ 이 프로젝트가 유용하다면 스타를 눌러주세요!**

Made with ❤️ and Flutter

</div>

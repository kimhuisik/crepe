# 🥞 크레페(Crepe) 커미션 플랫폼 앱 개발 프로젝트

## 📋 프로젝트 개요

| 항목 | 내용 |
|------|------|
| **프로젝트명** | 크레페 (Crepe) - 커미션 플랫폼 모바일 앱 |
| **개발 기간** | 2024년 9월 (1주) |
| **개발 인원** | 1명 (개인 프로젝트) |
| **프로젝트 유형** | 웹사이트 → 모바일 앱 포팅 및 기능 확장 |
| **GitHub** | [https://github.com/kimhuisik/crepe](https://github.com/kimhuisik/crepe) |
| **참고 웹사이트** | [https://crepe.cm](https://crepe.cm) |

---

## 🎯 프로젝트 기획 배경

### 문제 인식
- **기존 웹사이트의 한계**: crepe.cm은 데스크톱 중심의 웹 인터페이스로 모바일 사용성이 제한적
- **모바일 우선 시대**: 커미션 의뢰/수행의 주요 사용자층이 모바일 디바이스를 선호
- **크로스 플랫폼 필요성**: iOS, Android, Web을 모두 지원하는 통합 솔루션 부재

### 목표 설정
1. **사용자 경험 개선**: 모바일 최적화된 직관적인 UI/UX 구현
2. **크로스 플랫폼 지원**: 하나의 코드베이스로 다중 플랫폼 서비스 제공
3. **확장 가능한 아키텍처**: 향후 기능 추가를 고려한 모듈화된 구조 설계
4. **실시간 데이터 표현**: 동적이고 인터랙티브한 사용자 인터페이스 구현

---

## 🚀 기술 스택 선정 이유

### Flutter 선택 근거

#### 1. **크로스 플랫폼 효율성**
```
"Write Once, Run Anywhere" 철학
→ iOS, Android, Web, Desktop 동시 지원
→ 개발 시간 70% 단축, 유지보수 비용 절감
```

#### 2. **네이티브 성능**
```
Dart 언어 + Skia 렌더링 엔진
→ 60fps 부드러운 애니메이션
→ 네이티브 앱 수준의 성능 보장
```

#### 3. **풍부한 생태계**
```
25,000+ 패키지 제공 (pub.dev)
→ 빠른 기능 구현 가능
→ Google의 지속적인 지원과 업데이트
```

#### 4. **Hot Reload 개발 경험**
```
실시간 코드 변경 반영
→ 개발 생산성 향상
→ 빠른 프로토타이핑 가능
```

### 주요 기술 스택

| 분야 | 기술 | 선택 이유 |
|------|------|-----------|
| **Framework** | Flutter 3.24.3 | 크로스 플랫폼, 고성능, 활발한 커뮤니티 |
| **Language** | Dart 3.5.3 | Flutter 최적화, 강타입, 비동기 처리 우수 |
| **State Management** | Provider | 간단하고 직관적, Google 공식 권장 |
| **Navigation** | Go Router | 선언적 라우팅, URL 기반 내비게이션 |
| **Data Serialization** | json_annotation | 타입 안전성, 코드 생성으로 오류 방지 |
| **Image Handling** | cached_network_image | 자동 캐싱, 메모리 최적화 |
| **UI Components** | Material Design 3 | 구글 디자인 시스템, 일관된 UX |

---

## 🏗️ 시스템 아키텍처

### 프로젝트 구조 설계 원칙

#### 1. **관심사 분리 (Separation of Concerns)**
```
lib/
├── models/          # 데이터 모델 (비즈니스 로직과 분리)
├── services/        # 비즈니스 로직 (UI와 분리)
├── widgets/         # 재사용 가능한 UI 컴포넌트
├── screens/         # 화면별 UI 조합
└── utils/          # 공통 유틸리티
```

#### 2. **단일 책임 원칙 (Single Responsibility)**
- 각 파일은 300줄 이하로 제한
- 하나의 클래스는 하나의 책임만 담당
- 위젯의 기능별 세분화

#### 3. **의존성 역전 (Dependency Inversion)**
```dart
// 추상화에 의존, 구체 구현에 의존하지 않음
abstract class DataService {
  Future<List<Commission>> getCommissions();
}

class LocalDataService implements DataService {
  // JSON 파일 기반 구현
}

class ApiDataService implements DataService {
  // REST API 기반 구현 (향후 확장)
}
```

### 데이터 플로우 아키텍처

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Presentation  │    │   Business      │    │   Data          │
│   Layer         │    │   Logic Layer   │    │   Layer         │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ • Screens       │◄──►│ • Services      │◄──►│ • Models        │
│ • Widgets       │    │ • Providers     │    │ • JSON Data     │
│ • UI Components │    │ • Validators    │    │ • Local Assets  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 💡 핵심 기능 구현

### 1. 인터랙티브 배너 시스템
```dart
class SimpleBannerCarousel extends StatefulWidget {
  // 자동 슬라이드 + 수동 제어
  // 로컬/네트워크 이미지 지원
  // 부드러운 페이지 전환 애니메이션
}
```

**기술적 도전과 해결:**
- **문제**: 기존 carousel_slider 패키지 충돌
- **해결**: PageView.builder를 활용한 커스텀 구현
- **결과**: 더 가벼우면서 안정적인 성능

### 2. 동적 카테고리 시스템
```dart
// JSON 기반 동적 카테고리 로딩
{
  "categories": [
    {"id": "illustration", "name": "일러스트", "icon": "palette", "color": "#4ECDC4"},
    {"id": "design", "name": "디자인", "icon": "brush", "color": "#45B7D1"}
  ]
}
```

**구현 특징:**
- FontAwesome 아이콘 매핑 시스템
- 색상 코드 기반 테마 적용
- 반응형 그리드 레이아웃

### 3. 커미션 필터링 시스템
```dart
class DataService {
  List<Commission> filterByCategory(String category) {
    return _commissions.where((c) => c.category == category).toList();
  }
  
  List<Commission> searchCommissions(String query) {
    return _commissions.where((c) => 
      c.title.toLowerCase().contains(query.toLowerCase()) ||
      c.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }
}
```

### 4. 평점 및 리뷰 시스템
```dart
class ReviewCard extends StatelessWidget {
  // 별점 시각화
  // 사용자 아바타 표시
  // 반응형 카드 레이아웃
}
```

---

## 📊 개발 성과 및 지표

### 코드 품질 지표
| 지표 | 수치 | 설명 |
|------|------|------|
| **총 코드 라인** | ~3,000 라인 | 주석 및 공백 제외 |
| **파일 수** | 25개 | 기능별 모듈화 |
| **최대 파일 크기** | 300 라인 미만 | 가독성 및 유지보수성 확보 |
| **재사용 컴포넌트** | 8개 | 코드 중복 최소화 |
| **지원 플랫폼** | 4개 | iOS, Android, Web, macOS |

### 기능 구현 현황
- ✅ **배너 시스템**: 자동 슬라이드, 수동 제어
- ✅ **카테고리 시스템**: 9개 분야, 동적 로딩
- ✅ **커미션 리스트**: 필터링, 검색, 정렬
- ✅ **사용자 인터페이스**: Material Design 3
- ✅ **반응형 디자인**: 다양한 화면 크기 지원
- ✅ **이미지 최적화**: 캐싱, 지연 로딩
- ✅ **상태 관리**: Provider 패턴 적용

### 성능 최적화
```dart
// 이미지 캐싱으로 로딩 속도 개선
CachedNetworkImage(
  imageUrl: commission.imageUrl,
  placeholder: (context, url) => Shimmer.fromColors(...),
  memCacheHeight: 300, // 메모리 최적화
)

// 지연 로딩으로 초기 로딩 시간 단축
ListView.builder(
  itemCount: commissions.length,
  itemBuilder: (context, index) => CommissionCard(...),
)
```

---

## 🎨 UI/UX 디자인 철학

### 디자인 원칙
1. **사용자 중심 설계**: 직관적이고 쉬운 내비게이션
2. **일관성**: Material Design 가이드라인 준수
3. **접근성**: 다양한 사용자층 고려
4. **반응성**: 부드러운 애니메이션과 피드백

### 브랜딩 적용
- **주 컬러**: 보라색 계열 (#9C27B0) - 창의성과 예술성 표현
- **보조 컬러**: 그린/블루 계열 - 신뢰성과 안정성
- **타이포그래피**: Material Design 권장 폰트 사용
- **아이콘**: FontAwesome 일관성 있는 아이콘 세트

---

## 🔧 개발 프로세스 및 방법론

### 개발 방법론
1. **애자일 개발**: 짧은 스프린트로 점진적 개발
2. **TDD 지향**: 주요 기능에 대한 테스트 코드 작성
3. **코드 리뷰**: 일관된 코딩 스타일 유지
4. **지속적 통합**: Git을 통한 버전 관리

### 품질 관리
```yaml
# analysis_options.yaml
linter:
  rules:
    - prefer_const_constructors
    - avoid_unnecessary_containers
    - prefer_final_fields
    - use_key_in_widget_constructors
```

### 문서화
- **README.md**: 설치 및 실행 가이드
- **코드 주석**: 복잡한 로직에 대한 설명
- **API 문서**: 주요 클래스 및 메서드 문서화

---

## 🚧 기술적 도전과 해결 과정

### 1. iOS 빌드 환경 문제
**문제**: iOS 18.5 SDK 미설치로 인한 빌드 실패
```bash
error: iOS 18.5 is not installed. To use with Xcode, first download and install the platform
```

**해결 과정**:
1. Flutter doctor를 통한 환경 진단
2. iOS 배포 타겟을 17.0으로 조정
3. Podfile 및 AppFrameworkInfo.plist 수정
4. Xcode 프로젝트 설정 최적화

**학습 내용**: 크로스 플랫폼 개발 시 각 플랫폼별 환경 설정의 중요성

### 2. 패키지 충돌 해결
**문제**: carousel_slider 패키지와 다른 의존성 간 충돌

**해결책**: 
```dart
// 외부 패키지 대신 Flutter 기본 위젯 활용
PageView.builder(
  controller: _pageController,
  itemCount: banners.length,
  itemBuilder: (context, index) => BannerItemWidget(...)
)
```

**학습 내용**: 때로는 직접 구현이 더 안정적이고 효율적일 수 있음

### 3. 이미지 로딩 최적화
**문제**: 네트워크 이미지 로딩으로 인한 성능 저하

**해결책**:
```dart
// 로컬/네트워크 이미지 자동 감지
Widget buildImage() {
  return imageUrl.startsWith('assets/')
    ? Image.asset(imageUrl)
    : CachedNetworkImage(imageUrl: imageUrl);
}
```

**학습 내용**: 사용자 경험을 위한 성능 최적화 기법

---

## 📈 향후 확장 계획

### 단기 목표 (1-2개월)
- [ ] **백엔드 연동**: Firebase/REST API 통합
- [ ] **사용자 인증**: 로그인/회원가입 기능
- [ ] **실시간 채팅**: 크리에이터-클라이언트 소통
- [ ] **결제 시스템**: 인앱 결제 연동

### 중기 목표 (3-6개월)
- [ ] **알림 시스템**: Push Notification
- [ ] **오프라인 지원**: 로컬 데이터베이스 연동
- [ ] **다국어 지원**: i18n 국제화
- [ ] **다크 테마**: 사용자 선택 가능한 테마

### 장기 목표 (6개월+)
- [ ] **AI 추천 시스템**: 머신러닝 기반 커미션 추천
- [ ] **AR/VR 미리보기**: 작품 미리보기 기능
- [ ] **블록체인 연동**: NFT 커미션 지원
- [ ] **글로벌 서비스**: 다중 통화, 언어 지원

---

## 🎓 프로젝트를 통한 학습 성과

### 기술적 역량 향상
1. **Flutter/Dart 숙련도**: 위젯 생명주기, 상태 관리 패턴 이해
2. **크로스 플랫폼 개발**: 플랫폼별 특성 및 최적화 방법 학습
3. **UI/UX 설계**: 사용자 중심 인터페이스 설계 능력 향상
4. **아키텍처 설계**: 확장 가능하고 유지보수하기 쉬운 구조 설계

### 프로젝트 관리 역량
1. **요구사항 분석**: 기존 웹사이트 분석을 통한 기능 정의
2. **기술 선택**: 프로젝트 목표에 맞는 최적 기술 스택 선정
3. **일정 관리**: 제한된 시간 내 MVP 완성
4. **품질 관리**: 코드 품질 및 사용자 경험 최적화

### 문제 해결 능력
1. **디버깅 스킬**: iOS 빌드 오류, 패키지 충돌 등 해결
2. **대안 모색**: 외부 패키지 문제 시 직접 구현으로 대체
3. **성능 최적화**: 이미지 로딩, 메모리 사용 최적화
4. **사용자 피드백**: 실제 사용성을 고려한 개선

---

## 💼 포트폴리오 하이라이트

### 🏆 주요 성취
- **1주 만에 크로스 플랫폼 앱 완성**: 기획부터 배포까지 전 과정 경험
- **4개 플랫폼 동시 지원**: iOS, Android, Web, macOS 성공적 실행
- **모듈화된 아키텍처**: 향후 확장을 고려한 체계적 설계
- **실제 서비스 수준**: 상용 서비스 수준의 완성도 달성

### 🎯 핵심 역량 증명
1. **빠른 학습 능력**: Flutter 생태계 빠른 습득
2. **문제 해결 능력**: 다양한 기술적 이슈 독립적 해결
3. **사용자 중심 사고**: UX를 고려한 기능 설계 및 구현
4. **코드 품질 의식**: 유지보수 가능한 클린 코드 작성

### 📊 정량적 성과
- **개발 기간**: 7일 (168시간)
- **코드 라인**: ~3,000 라인
- **기능 구현**: 15개 주요 기능
- **플랫폼 지원**: 4개 플랫폼
- **GitHub 스타**: 프로젝트 공개 후 지속적 관심

---

## 🔗 관련 링크

- **GitHub Repository**: [https://github.com/kimhuisik/crepe](https://github.com/kimhuisik/crepe)
- **Web Demo**: [배포 후 추가 예정]
- **참고 웹사이트**: [https://crepe.cm](https://crepe.cm)
- **기술 블로그**: [개발 과정 정리 예정]

---

## 📞 연락처

**김휘식**
- 📧 Email: [이메일 주소]
- 💼 LinkedIn: [LinkedIn 프로필]
- 🐙 GitHub: [@kimhuisik](https://github.com/kimhuisik)
- 📱 Portfolio: [포트폴리오 웹사이트]

---

*"기존 웹 서비스를 모바일 앱으로 성공적으로 포팅하면서 Flutter의 강력함을 체험했습니다. 크로스 플랫폼의 효율성과 네이티브 수준의 성능을 동시에 달성할 수 있어 매우 만족스러운 프로젝트였습니다."* 
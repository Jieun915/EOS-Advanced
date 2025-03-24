# Week 2: Firebase 인증 구현 프로젝트

이 프로젝트는 Flutter와 Firebase Authentication을 활용하여 사용자 인증 시스템을 구현하는 과제입니다.

## 📝 과제 개요

### 과제 1: Firebase 설정 및 인증 상태 관리
1. **Firebase 초기화 코드 구현**
   - Firebase 프로젝트 설정 및 Flutter 앱 연결
   - 필요한 구성 파일 설치 (google-services.json, GoogleService-Info.plist)
   - Firebase 초기화 코드 구현vzvczxDcxvaxDasdadsf

2. **로그인 상태에 따른 화면 분기 처리**
   - FirebaseAuth.authStateChanges()를 활용한 인증 상태 모니터링
   - 로그인 상태에 따라 적절한 화면 표시 (로그인/홈 화면)
   - currentUser를 활용한 로그인 세션 유지 기능

### 과제 2: 사용자 인증 구현
1. **이메일/비밀번호 로그인 구현**
   - 입력값 유효성 검사 (이메일 형식, 비밀번호 길이)
   - Firebase Auth를 사용한 로그인 기능 구현
   - 오류 상황 처리 및 피드백 제공

2. **비밀번호 재설정 기능 구현**
   - 이메일 입력 다이얼로그 구현
   - Firebase의 sendPasswordResetEmail() 메서드 활용
   - 성공/실패 상황 처리

3. **회원가입 기능 구현**
   - 회원가입 양식 구현 (이메일, 비밀번호, 비밀번호 확인)
   - 입력값 유효성 검사
   - createUserWithEmailAndPassword() 메서드를 활용한 계정 생성

### 과제 3: 인증 후 기능 구현
1. **현재 로그인한 사용자 정보 표시**
   - FirebaseAuth.instance.currentUser 활용
   - 사용자 이메일 등 정보 화면에 표시

2. **로그아웃 기능 구현**
   - FirebaseAuth.instance.signOut() 메서드 활용
   - 로그아웃 후 로그인 화면으로 이동

## 🚀 프로젝트 실행 방법

### 사전 요구사항
- Flutter SDK (3.4.3 이상)
- Android Studio 또는 VS Code
- Firebase 계정

### 설치 및 실행 단계

1. **프로젝트 클론**
   ```bash
   git clone https://github.com/your-username/eos_advance_login.git
   cd eos_advance_login
   ```

2. **의존성 패키지 설치**
   ```bash
   flutter pub get
   ```

3. **Firebase 설정**
   - [Firebase 콘솔](https://console.firebase.google.com)에서 새 프로젝트 생성
   - Flutter 앱 등록 (Android/iOS)
   - 구성 파일 다운로드 및 적절한 위치에 배치:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **앱 실행**
   ```bash
   flutter run
   ```

## 🔥 Firebase Authentication 소개

Firebase Authentication은 사용자 인증 시스템을 쉽게 구현할 수 있게 해주는 서비스입니다.

### 주요 기능
- **다양한 인증 방식 지원**
  - 이메일/비밀번호
  - 소셜 로그인 (Google, Facebook, Twitter, Apple)
  - 전화번호 인증
  - 익명 로그인

- **인증 상태 관리**
  - 로그인 상태 유지
  - 세션 관리
  - 계정 연동

- **보안 기능**
  - 비밀번호 해싱
  - 이메일 인증
  - 비밀번호 재설정

### Flutter에서의 사용법

1. **필요한 패키지 설치 (flutter --version 3.27.1 기준)**
   ```yaml
   dependencies:
     firebase_core: ^3.9.0
     firebase_auth: ^5.3.4
   ```

2. **Firebase 초기화**
   ```dart
   await Firebase.initializeApp();
   ```

3. **로그인 예시**
   ```dart
   try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password,
     );
   } catch (e) {
     // 오류 처리
   }
   ```

4. **인증 상태 모니터링**
   ```dart
   FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if (user == null) {
       // 로그아웃 상태
     } else {
       // 로그인 상태
     }
   });
   ```

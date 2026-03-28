# 📱 정보비서 APK 빌드 가이드

GitHub에 올리면 **자동으로 APK가 빌드**됩니다. 코딩 지식 없이 따라하세요!

---

## 🚀 따라하기 (약 15분)

### Step 1: GitHub에 새 저장소 만들기

1. **https://github.com/new** 접속 (로그인 상태)
2. Repository name: `info-secretary-android` 입력
3. **Public** 선택
4. "Create repository" 클릭

---

### Step 2: 이 ZIP 파일의 내용을 GitHub에 업로드

1. 생성된 저장소 페이지에서 **"uploading an existing file"** 링크 클릭
2. 이 ZIP을 압축 해제한 **모든 파일과 폴더**를 드래그 & 드롭
3. "Commit changes" 클릭

> ⚠️ 중요: `.github` 폴더도 반드시 포함해야 합니다!
> 파일 탐색기에서 `.github` 폴더가 안 보이면 "숨김 파일 표시"를 켜세요.

**또는 Git 명령어로 (터미널 사용 가능한 경우):**
```bash
cd info-secretary-android
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/LEETAEYUN27/info-secretary-android.git
git push -u origin main
```

---

### Step 3: GitHub Actions에서 APK 자동 빌드 확인

1. GitHub 저장소 페이지에서 **"Actions"** 탭 클릭
2. "Build APK" 워크플로우가 자동 실행됨 (노란 원 = 빌드 중)
3. 약 **3~5분** 기다리면 초록 체크(✅)로 변경
4. 해당 빌드를 클릭 → 하단의 **"Artifacts"** 섹션에서 
   `info-secretary-apk` 클릭하여 **APK 다운로드**

---

### Step 4: 핸드폰에 설치

1. 다운로드된 ZIP 안에 `app-debug.apk` 파일이 있음
2. 이 APK 파일을 핸드폰으로 전송 (카카오톡, 구글드라이브, 이메일 등)
3. 핸드폰에서 파일 열기
4. "알 수 없는 앱 설치 허용" → **설치**
5. 홈화면에서 **"정보비서"** 앱 실행! 🎉

---

## ❓ 문제 해결

### "Actions 탭이 안 보여요"
→ 저장소가 Private이면 Actions가 제한될 수 있어요. Public으로 만들어주세요.

### "빌드가 실패해요 (빨간 X)"
→ Actions 탭에서 실패한 빌드 클릭 → 로그 확인
→ `.github/workflows/build-apk.yml` 파일이 올바르게 업로드되었는지 확인

### "APK 설치가 안 돼요"
→ 설정 → 앱 → 특별 접근 → 알 수 없는 앱 설치 → 파일관리자/크롬 허용

### "앱이 빈 화면이에요"
→ 인터넷 연결 확인 (이 앱은 https://info-secretary.emergent.host/ 에 접속)
→ 이머전트AI 서버가 정상 운영 중인지 확인

---

## 📋 프로젝트 구조

```
info-secretary-android/
├── .github/workflows/
│   └── build-apk.yml          ← GitHub Actions 자동 빌드
├── app/
│   ├── build.gradle            ← 앱 빌드 설정
│   ├── proguard-rules.pro
│   └── src/main/
│       ├── AndroidManifest.xml ← 앱 권한 설정
│       ├── java/.../
│       │   ├── MainActivity.java    ← 메인 화면 (WebView)
│       │   └── SplashActivity.java  ← 로딩 화면
│       └── res/
│           ├── layout/         ← 화면 레이아웃
│           ├── values/         ← 색상, 문자열, 테마
│           ├── drawable/       ← 버튼 스타일
│           ├── mipmap-*/       ← 앱 아이콘
│           └── xml/            ← 네트워크 설정
├── build.gradle                ← 프로젝트 빌드 설정
├── settings.gradle
├── gradle.properties
├── gradlew                     ← Gradle 실행 스크립트
└── gradle/wrapper/
    └── gradle-wrapper.properties
```

---

## ✨ 앱 기능

- 🔸 정보비서 웹앱을 네이티브 앱처럼 실행
- 🔸 스플래시(로딩) 화면 with 테마 색상
- 🔸 당겨서 새로고침 (Pull to refresh)
- 🔸 외부 링크는 크롬 브라우저로 열기
- 🔸 뒤로가기 버튼으로 이전 페이지 이동
- 🔸 오프라인 에러 화면 & 재시도 버튼
- 🔸 로그인 세션 유지 (쿠키 지원)
- 🔸 Emergent 배지 자동 숨김

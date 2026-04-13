<table>
    <tr>
        <td>
            <img src="https://github.com/user-attachments/assets/ba0c48e0-ea3b-47f6-bca0-058ab36d373b" width="150"/>
        </td>
        <td style="padding-left: 20px;">
            <h1>아이시선</h1>
            <h6>아이의 시선으로 세상을 설명하다</h6>
        </td>
    </tr>
</table>

<table align="center">
    <tr>
        <td><img src="https://github.com/user-attachments/assets/3f13d892-0e26-4b05-9678-06b264f133e8" width="180"/></td>
        <td><img src="https://github.com/user-attachments/assets/9ecf8b3f-cf2a-4323-a574-3769e9b8450b" width="180"/></td>
        <td><img src="https://github.com/user-attachments/assets/3ff25853-5bc7-4d5c-929c-84453f52d125" width="180"/></td>
        <td><img src="https://github.com/user-attachments/assets/2ccca69c-b7c0-449e-901b-a47935184b24" width="180"/></td>
        <td><img src="https://github.com/user-attachments/assets/dcf59a28-3278-48b9-9dbd-28a213de7b4d" width="180"/></td>
        <td><img src="https://github.com/user-attachments/assets/8f071b4e-5567-45d7-9048-bfdc25f3c3d7" width="180"/></td>
    </tr>
</table>

---

<a href="https://apps.apple.com/kr/app/%EC%95%84%EC%9D%B4%EC%8B%9C%EC%84%A0/id6760978295" target="_blank">
    <img src="https://github.com/user-attachments/assets/b68238d2-d0ef-4dac-bdb1-2110ae8b6f7e" alt="Download on the App Store" width="200"/>
</a>

<a href="https://play.google.com/store/apps/details?id=com.hogeunjo.eyelevelkid" target="_blank">
    <img src="https://github.com/user-attachments/assets/9b0eb6d0-13e6-4054-b6e6-b5ac2ead1f1e" alt="Download on the Google Store" width="200"/>
</a>

<br>
<br>

## 기술 스택

| 목록 | 설명 |
|------|------|
| Flutter SDK | 3.41.5 |
| Riverpod | 상태 관리 |
| GoRouter | 선언형 라우팅 처리 |
| Dio | 네트워크 요청 및 API 추상화 |
| Freezed / JsonSerializable | 불변 모델 및 JSON 직렬화 |
| get_it | UseCase / Repository DI 관리 |
| Google / Apple Sign-In | 소셜 로그인 기능 구현 |
| SharedPreferences / SecureStorage | 로컬 및 Private 데이터 저장 |
| Google Mobile Ads | 광고 SDK 연동 |

<br>
<br>

## 프로젝트 구조
<img width="1536" height="845" alt="image 2121" src="https://github.com/user-attachments/assets/c80983d6-0189-4467-bc08-41ccb1da615f" />

<br>
<br>

## 폴더 구조

  ```text
  lib/
  ├── core/
  │   ├── auth/
  │   ├── di/
  │   ├── image/
  │   ├── network/
  │   └── utils/
  ├── data/
  │   ├── dto/
  │   ├── repositories/
  │   └── sources/
  │       ├── external/
  │       ├── local/
  │       └── remote/
  ├── domain/
  │   ├── entities/
  │   ├── repositories/
  │   ├── usecases/
  │   └── values/
  ├── ui/
  │   ├── auth/
  │   ├── core/
  │   ├── history/
  │   ├── home/
  │   ├── question/
  │   └── user/
  ```

<br>
<br>

1인 개발

<br>
<br>

[아이시선 서버 보러가기](https://github.com/joho2022/eyelevel-kid-backend)

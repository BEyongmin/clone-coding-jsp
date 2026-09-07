# B.POINT

> 결과 너머의 성장을 지향하는 농구 클래스 브랜드 B.POINT의 웹사이트 클론 코딩 프로젝트

정적 HTML/CSS로 제작된 디자인 시안을 Spring Boot + JSP 기반의 서버사이드 애플리케이션으로 전환하고, DB 연동·관리자 페이지·AWS 배포까지 구현한 풀스택 프로젝트입니다.

## 🖥️ 데모

- 배포 주소: 상시 운영하지 않으며, 실행 필요 시 별도 안내
- 관리자 페이지: `/admin/login`

## 🛠️ 기술 스택

| 구분 | 기술 |
|---|---|
| Language | Java 21 |
| Framework | Spring Boot 3.5 |
| View | JSP, JSTL |
| ORM | Spring Data JPA (Hibernate) |
| Database | MariaDB |
| Build Tool | Gradle |
| Infra | AWS EC2, AWS RDS |
| Deploy | Docker, Docker Hub |

## 📁 주요 기능

### 사용자 페이지
- 홈 / 소개 / 스토리 / 프로그램(클래스·이벤트) 소개
- 공지사항·자료실 (검색, 필터, 정렬, 페이지네이션, 첨부파일 다운로드)
- 소식(News) 목록 및 상세, 카테고리 필터
- 1:1 문의 등록

### 관리자 페이지
- 세션 기반 로그인/로그아웃
- 대시보드 (공지·소식·문의 현황 요약)
- 공지·자료실 CRUD (파일 업로드/교체/삭제 포함)
- 소식 CRUD (이벤트 페이지 노출 여부 관리)
- 문의 내역 조회 및 답변 등록

## 🏗️ 아키텍처

```
[Client]
   │  HTTP
   ▼
[EC2 : Docker Container]
   ├─ Spring Boot (내장 Tomcat)
   ├─ JSP (View)
   └─ Spring Data JPA
        │  SSL
        ▼
   [RDS : MariaDB]
```

- 애플리케이션은 `bootWar`로 빌드된 실행 가능한 war 파일을 Docker 이미지로 패키징하여 배포
- Docker Hub를 경유해 로컬 → EC2로 이미지 전달
- RDS는 SSL 연결을 강제하며, EC2 보안 그룹을 신뢰하는 방식으로 접근 제어

## 🚀 로컬 실행 방법

### 1. 사전 요구사항
- Java 21
- MariaDB
- Gradle (Wrapper 포함되어 있어 별도 설치 불필요)

### 2. 환경 설정

`src/main/resources/application.properties.example`을 복사하여 `application.properties`로 만든 뒤, 본인 환경에 맞게 값을 채워주세요.

```properties
spring.datasource.url=${SPRING_DATASOURCE_URL:jdbc:mariadb://localhost:3306/bpoint}
spring.datasource.username=${SPRING_DATASOURCE_USERNAME:root}
spring.datasource.password=${SPRING_DATASOURCE_PASSWORD:비밀번호}
spring.jpa.hibernate.ddl-auto=${SPRING_JPA_HIBERNATE_DDL_AUTO:update}
```

> 모든 설정은 환경 변수로 오버라이드 가능하도록 구성되어 있어, 로컬/배포 환경에서 코드 변경 없이 값만 주입하면 됩니다.

### 3. 실행

```bash
./gradlew bootRun
```

기본 접속 주소: `http://localhost:8080`

## 🐳 Docker 배포

```bash
# 1. 실행 가능한 war 빌드
./gradlew bootWar

# 2. 이미지 빌드
docker build -t bpoint-app .

# 3. 실행 (RDS 등 외부 DB 연동 시)
docker run -d -p 8080:8080 \
  -v [인증서경로]:/certs/global-bundle.pem \
  -v [업로드폴더경로]:/app/uploads \
  -e SPRING_DATASOURCE_URL="jdbc:mariadb://[호스트]:3306/bpoint?useSsl=true&serverSslCert=/certs/global-bundle.pem" \
  -e SPRING_DATASOURCE_USERNAME=[계정] \
  -e SPRING_DATASOURCE_PASSWORD=[비밀번호] \
  bpoint-app
```

## 📌 설계 노트

- DB 스키마는 `notices`, `news`, `inquiries`, `admins` 4개 테이블로 구성되며, 서로 외래키로 연결되지 않은 독립 구조
- 첨부파일은 DB가 아닌 파일시스템에 저장하고, DB에는 파일명·크기 메타데이터만 보관
- 배포 환경에서 파일 경로 문제가 발생하지 않도록, 업로드 경로는 `@Value`로 외부화하여 환경별 설정 가능

## 📄 라이선스

이 프로젝트는 학습 목적의 클론 코딩 프로젝트입니다.
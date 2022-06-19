flutter packages pub run build_runner build --delete-conflicting-outputs  


### json serializable command

일회성 코드 생성 명령어

```
flutter pub run build_runner build
```

위의 Command 를 프로젝트 루트에서 실행하면, 모델의 JSON 직렬화 코드를 생성할 수 있다.
이 명령은 소스 코드를 살펴보며 관련된 부분을 찾고, 필요한 직렬화 코드를 생성해내는 일회성 빌드.


지속적인 코드 생성 명령어

```
flutter pub run build_runner watch
```

watcher 가 소스 코드 생성과정을 좀 더 편리하게 만들어 준다.
이는 프로젝트 파일들의 변화를 지켜 보고 자동으로 필요한 파일을 빌드한다.
프로젝트 루트에서 flutter pub run build_runner watch를 실행하여 watcher를 사용한다.


pub finished with exit code 78 Error 발생시 명령어

```
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

위의 명령어를 실행한 후에 전체적으로 리빌드 되고 나면 정상적으로 작동한다.
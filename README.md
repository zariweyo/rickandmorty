# RickAndMorty Demo APP

This is a Demo APP developed in Flutter. It use:

- BLoC pattern as State Management
- GetIt as Dependency Injector
- Hive as query caché and local data
- Responsive grids
- GitHub actions for CI/CD
- GraphQL for service consumption

## Demo APP

The APP looks like this:
<p align="center">
  <img src="./resources/showapp.gif">
</p>

## Use Hive

This app saves cache for Http Requests with hive. Hive needs to be generated his code using this command:

```
fvm flutter pub run build_runner build --delete-conflicting-outputs
```
It create the files XX.g.dart, which are the Adapters to use in the CacheRepository.

## Generate App Icon
To generate App Icon you need to change the icon in assets/icons/appIcon.png and then execute this command
```
fvm flutter pub run flutter_launcher_icons:main
```

It create tha files XX.g.dart, which are the Adapters to use in the CacheRepository.

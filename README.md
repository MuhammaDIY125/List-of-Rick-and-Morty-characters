# List of Rick and Morty Characters

Flutter-приложение для просмотра персонажей Rick and Morty с пагинацией, деталями, избранным и оффлайн-кэшированием страниц.

## Demo

![Demo GIF](assets/demo.gif)

## Функциональность

- Список персонажей с пагинацией.
- Экран деталей персонажа.
- Добавление/удаление персонажей в избранное.
- Сортировка избранного (`Default`, `Name A-Z`, `Name Z-A`).
- Навигация через нижний таб-бар (`Characters`, `Favorites`) на `go_router`.
- Поддержка светлой и темной темы с сохранением выбора.
- Retry при `429 Too Many Requests` (exponential backoff).
- Локальный кэш страниц персонажей в `Isar`.

## Кэширование

Приложение использует `Isar` для персистентного хранения:

- `FavoriteCharacterEntity` - избранные персонажи.
- `CharacterCachePageEntity` - кэш страниц списка персонажей.

Поведение кэша персонажей:

- При запросе страницы сначала читается локальный кэш.
- Если страница найдена, данные отдаются из `Isar`.
- Если страницы нет, данные берутся из сети и сохраняются в `Isar`.
- Кэш сохраняется между перезапусками приложения.

## Архитектура

Проект построен в стиле Clean Architecture с разделением по слоям:

- `data` - datasource, dto, repository impl.
- `domain` - модели и абстракции репозиториев.
- `presentation` - cubit и UI.

DI реализован через `get_it`, управление состоянием через `flutter_bloc`.

## Стек

- `flutter_bloc`
- `go_router`
- `dio`
- `isar_community`
- `get_it`
- `shared_preferences`
- `json_serializable`

## Запуск

1. Установить зависимости:

```bash
flutter pub get
```

2. Сгенерировать код:

```bash
dart run build_runner build --delete-conflicting-outputs
```

3. Запустить приложение:

```bash
flutter run
```

## Тесты

```bash
flutter test
```

В проекте есть unit-тесты для:

- `CharacterRepositoryImpl`
- `CharactersCubit`

## Структура проекта

```text
lib/
  app/
  core/
    di/
    navigation/
    network/
    storage/
    theme/
    widgets/
  features/
    characters/
      data/
      domain/
      presentation/
    favorites/
      data/
      domain/
      presentation/
```

# Demo App Clean Architecture (Flutter MVVM)

Este mini demo muestra una estructura alineada con la guía de arquitectura limpia para Flutter basada en MVVM.

## Capas

- **UI layer (`lib/ui/...`)**: Widgets y ViewModels. Los ViewModels (ChangeNotifier) exponen estado y comandos. No contienen lógica de infraestructura.
- **Domain layer (`lib/domain/...`)**: Modelos de dominio y casos de uso. Pura lógica de negocio; no depende de Flutter ni de detalles externos.
- **Data layer (`lib/data/...`)**: Servicios y Repositorios. Los servicios interactúan con fuentes externas (APIs, DB, memoria). Los repositorios traducen DTOs a modelos de dominio y son el punto de entrada para la capa domain.

## Flujo
```
[UI] -> solicita -> [UseCase] -> delega -> [Repository] -> llama -> [Service]
[Service] -> devuelve DTO -> [Repository] -> mapea -> Domain Model -> [UseCase] -> [ViewModel] -> Notifica UI
```

## Estructura
```
lib/
  ui/
    features/
      counter/
        view_model/counter_view_model.dart
        widgets/counter_screen.dart
  domain/
    models/counter.dart
    use_cases/
      get_counter_use_case.dart
      increment_counter_use_case.dart
  data/
    model/counter_dto.dart
    services/counter_service.dart
    repositories/counter_repository.dart
  main.dart
```

## Ejecución
```powershell
flutter run
```
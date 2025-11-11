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

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

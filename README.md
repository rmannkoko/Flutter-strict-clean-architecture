# 📝 Flutter Clean Architecture - Post App (Feature-Driven)

Ce projet est une application Flutter respectant les principes de :

- ✅ **Clean Architecture**
- ✅ **Feature-Driven Folder Structure**
- ✅ **SOLID Principles**
- ✅ **CQRS (Command Query Responsibility Segregation)**
- ✅ **TDD Ready (Tests unitaires & performance)**
- ✅ **Bloc State Management**
- ✅ **Service Locator (GetIt)**
- ✅ **REST API Integration** (JSONPlaceholder)

---

## 🚀 Fonctionnalités

- 🔍 Lister les posts
- 📄 Voir les détails d’un post
- ✍️ Créer un nouveau post
- 🖋️ Modifier un post existant
- ❌ Supprimer un post avec confirmation
- 🧪 Tests unitaires & tests de performance
- 🔌 Architecture scalable et découplée

> ⚠️ Mode **Offline** non implémenté pour le moment

---

## 🗂️ Structure du projet

```bash
lib/
├── core/
│   └── service_locator.dart       # Injection de dépendances (GetIt)
├── Post/
│   ├── data/
│   │   ├── datasource/            # Remote (command/query)
│   │   ├── post_model.dart
│   │   └── post_repository_implementation.dart
│   ├── domain/
│   │   ├── usecases/              # UseCases par action
│   │   ├── post_entity.dart
│   │   └── post_repository_interface.dart
│   └── presentation/
│       ├── bloc_*_post/           # 1 dossier bloc par use case
│       ├── screens/               # UI Screens (PostList, PostDetail, PostForm)
│       └── widgets/               # UI Components
└── main.dart                      # Entrée principale avec injection

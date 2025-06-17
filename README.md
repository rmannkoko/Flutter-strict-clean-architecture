# Flutter Clean Architecture 

Ce projet est une application Flutter respectant les principes de :

- ✅ **Clean Architecture**
- ✅ **Feature-Driven Folder Structure**
- ✅ **SOLID Principles**
- ✅ **CQRS (Command Query Responsibility Segregation)**
- ✅ **TDD Ready (Tests unitaires & performance)**
- ✅ **Bloc State Management**
- ✅ **Dependence Injection (GetIt)**
- ✅ **REST API Integration** (JSONPlaceholder)
- ✅ **CRUD POST** 

---

## Structure du projet

```bash
lib/
├── core/
│   └── service_locator.dart       # Injection de dépendances (GetIt)
├── post/                          # Feature : Post
    ├── data/
    │   ├── post_model.dart
    │   ├── datasource/
    │   │   ├── remote/
    │   │   │   ├── command/
    │   │   │   │   ├── create_post_remote_datasource.dart
    │   │   │   │   ├── delete_post_remote_datasource.dart
    │   │   │   │   └── update_post_remote_datasource.dart
    │   │   │   └── query/
    │   │   │       ├── get_post_remote_datasource.dart
    │   │   │       └── get_post_by_id_remote_datasource.dart
    │   └── post_repository_implementation.dart
    │
    ├── domain/
    │   ├── post_entity.dart
    │   ├── post_repository_interface.dart
    │   └── use_case/
    │       ├── command/
    │       │   ├── create_post_usecase.dart
    │       │   ├── update_post_usecase.dart
    │       │   └── delete_post_usecase.dart
    │       └── query/
    │           ├── get_posts_usecase.dart
    │           └── get_post_by_id_usecase.dart
    │
    ├── presentation/
    │   ├── screens/
    │   │   ├── post_list_screen.dart
    │   │   ├── post_detail_screen.dart
    │   │   
    │   ├── widgets/
    │   │   └── post_item_widget.dart
    │   └── state_manager/
    │       ├── create_post_state_manager/
    │       │   ├── create_post_bloc.dart
    │       │   ├── create_post_event.dart
    │       │   └── create_post_state.dart
    │       ├── update_post_state_manager/
    │       │   ├── update_post_bloc.dart
    │       │   ├── update_post_event.dart
    │       │   └── update_post_state.dart
    │       ├── delete_post_state_manager/
    │       │   ├── delete_post_bloc.dart
    │       │   ├── delete_post_event.dart
    │       │   └── delete_post_state.dart
    │       ├── get_posts_state_manager/
    │       │   ├── get_posts_bloc.dart
    │       │   ├── get_posts_event.dart
    │       │   └── get_posts_state.dart
    │       └── get_post_by_id_state_manager/
    │           ├── get_post_by_id_bloc.dart
    │           ├── get_post_by_id_event.dart
    │           └── get_post_by_id_state.dart
└── main.dart
test/
└── post/
    ├── domain/
    │   └── use_case/ 
    │       ├── create_post_usecase_test.dart
    │       ├── delete_post_usecase_test.dart
    │       └── update_post_usecase_test.dart
    │       ├── get_posts_usecase_test.dart
    │       └── get_post_by_id_usecase_test.dart                      
=======

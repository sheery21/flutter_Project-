📱 Flutter Boilerplate — Features Document

This boilerplate provides a complete, scalable, and future-proof foundation for building modern mobile applications using Flutter. It includes essential modules such as authentication, backend integration, push notifications, AI support, and reusable UI components. Designed to accelerate development and maintain clean architecture for all future projects.

🚀 Core Features
1. Splash Screen & App Initialization

Native splash screen via flutter_native_splash

App initialization manager

Auth state check (logged-in / logged-out)

Dark/Light theme support

First-time onboarding (optional)

App version fetch

2. Authentication System
Firebase Authentication

Sign Up / Sign In (Email & Password)

Google login

Apple login (iOS)

Phone Number authentication

Password reset & email verification

Secure token storage using flutter_secure_storage

Auto-login management

Logout flow with cleanup

Why Firebase Auth?
Free, stable, secure, fast, and widely used with strong Flutter support.

3. Backend Integration (Neon.tech)

Seamless connection with Neon.tech (serverless PostgreSQL) for data storage and backend logic.

Includes:

API service layer

User data fetch/update

App configuration fetch

Token saving (FCM token, device info)

Error handling & retry mechanism

Supported backends:

Supabase Edge Functions
OR

Dart Frog (recommended for Flutter developers)

4. OpenRouter AI Integration

Built-in API integration to use powerful AI models via OpenRouter.

Features:

Chat completions

Streaming responses

AI image generation

Model selection for user

Error and rate-limit handling

Models Supported:

GPT-4.1

Llama 3.1 405B

DeepSeek R1
and many more…

5. Push Notifications (FCM)

Firebase Cloud Messaging integration

Background & foreground notification handling

Notification click listener

Device token registration with backend

Silent notifications support

Topic-based subscriptions

6. App Settings Module

A centralized settings screen that includes:

Dark, Light, System theme toggle

Language selector (i18n)

Notification toggle

AI model preference

App version & About section

Clear cache option

Logout button

7. Routing System

Using go_router for modern routing:

Type-safe routes

Route guards (auth redirects)

Nested navigation support

Deep links ready

8. State Management

Powered by Riverpod 3.0:

Global providers

AutoDispose for memory management

AsyncValue for loading/error/data states

Testable & scalable design

9. Error Handling & Logging

Centralized API error handling

No-internet handler

Global exception catcher

FlutterError.onError integration

Firebase Crashlytics support (optional)

UI for displaying errors & retry

🎨 UI/UX Components
10. Reusable Widgets Library

Includes several ready-made widgets:

CustomButton

CustomTextField

LoadingIndicator

EmptyStateWidget

ErrorDisplayWidget

AppDialogs (info, confirm, error)

CustomSnackbars

RoundedCard & List components

11. Theme & Typography System

Light theme

Dark theme

Custom color palette

Global spacing system

Google Fonts integration

12. Internationalization (i18n)

Multi-language support via easy_localization

Auto locale detection

Language change saved locally

📦 Data Layer Features
13. Local Database & Caching

Hive or Drift (app preference)

Cache user profile

Cache app settings

Cache AI chat history

Auto-refresh mechanism

14. Secure Local Storage

Using:

flutter_secure_storage

Used for storing:

Auth tokens

Refresh tokens

Sensitive flags

🔧 Developer Experience
15. Modular Feature-Based Architecture
/features/auth
/features/splash
/features/settings
/features/notifications
/features/backend
/features/ai


Easy to add/remove new features

Each feature has its own logic, UI, models, and providers

16. Environment & Secret Handling

Using flutter_dotenv:

API keys (OpenRouter)

Backend URLs

Environment (dev, staging, prod)

17. Code Generation (Optional)

Support for:

Freezed models

JSON serialization

Router code generation

Riverpod generator (optional)

🧪 Testing Ready

Unit tests for services

Widget tests for UI components

Mock HTTP & backend tests

🔧 Optional Advanced Features

Add if needed later:

In-app Purchases

Analytics Dashboard

File & Media Picker integration

Background tasks

Offline-first sync engine

Update Checker

🏁 Conclusion

This boilerplate is designed to be:

Scalable

Production-grade

Team-friendly

Fast to extend

It provides all modern essentials:
auth, backend, AI, notifications, local storage, routing, themes, reusable UI components, and a clean architecture.
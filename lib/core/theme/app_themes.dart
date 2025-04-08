import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

class AppThemes {
  static ThemeData lightTheme(ColorSeed colorSeed) {
    return ThemeData(
      colorSchemeSeed: colorSeed.color,
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }

  static ThemeData darkTheme(ColorSeed colorSeed) {
    return ThemeData(
      colorSchemeSeed: colorSeed.color,
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}

// 🎨 Полный список ColorScheme в Flutter
//
// 🌟 Основные цвета
// Эти цвета формируют главную палитру интерфейса.
//
// Свойство	Описание	Рекомендуемое использование
// primary	Основной цвет темы	Кнопки, заголовки, выделенные элементы
// onPrimary	Контрастный к primary	Текст и иконки на фоне primary
// primaryContainer	Светлый вариант primary	Фон для карточек, вкладок, дополнительных элементов
// onPrimaryContainer	Контрастный к primaryContainer	Текст и иконки на primaryContainer

// 🔹 Дополнительные цвета
// Используются для выделения второстепенных элементов.
//
// Свойство	Описание	Рекомендуемое использование
// secondary	Вторичный цвет темы	Иконки, вкладки, чипы, выделение
// onSecondary	Контрастный к secondary	Текст на secondary
// secondaryContainer	Светлый вариант secondary	Фон для карточек и кнопок
// onSecondaryContainer	Контрастный к secondaryContainer	Текст на secondaryContainer
// 🖼 Фон и поверхности
// Отвечают за задний фон и карточки.
//
// Свойство	Описание	Рекомендуемое использование
// background	Основной цвет фона	Фон приложения
// onBackground	Контрастный к background	Текст на фоне background
// surface	Цвет поверхности (например, карточек)	Карточки, меню, диалоговые окна
// onSurface	Контрастный к surface	Текст и иконки на surface
// surfaceVariant	Вторичная поверхность	Альтернативный фон для разделения блоков
// onSurfaceVariant	Контрастный к surfaceVariant	Текст на surfaceVariant
// 🚨 Ошибки и уведомления
// Используются для ошибок и предупреждений.
//
// Свойство	Описание	Рекомендуемое использование
// error	Цвет ошибки	Ошибка валидации, красные уведомления
// onError	Контрастный к error	Текст и иконки на фоне error
// errorContainer	Светлый вариант ошибки	Фон для сообщений об ошибке
// onErrorContainer	Контрастный к errorContainer	Текст на errorContainer
// 🌚 Тёмная и светлая темы
// Эти цвета адаптируются в зависимости от режима (тёмная или светлая тема).
//
// Свойство	Описание	Рекомендуемое использование
// inverseSurface	Инвертированный surface	Фон для выделения в тёмной теме
// onInverseSurface	Контрастный к inverseSurface	Текст на inverseSurface
// inversePrimary	Инвертированный primary	Альтернативный основной цвет
// 🌈 Расширенные цвета
// Дополнительные оттенки для кастомизации.
//
// Свойство	Описание	Рекомендуемое использование
// outline	Граница и разделители	Разделительные линии, бордеры
// outlineVariant	Альтернативный outline	Дополнительные границы
// shadow	Цвет тени	Тени карточек и кнопок
// scrim	Цвет затемнения	Фон под ModalBottomSheet, диалогами
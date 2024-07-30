# taqtile-ios-trainee-task
Тестовое задание для Taqtile на позицию Trainee iOS Developer

<details>
<summary> Описание задания </summary>
  
#### Создайте простое приложение на SwiftUI, которое позволяет искать изображения по ключевым словам, используя публичный API.
Требования:
1. **Интерфейс:**
- Создайте экран с полем для ввода текста и кнопкой "Поиск".
- Под полем для ввода разместите список изображений, который обновляется в зависимости от введённого запроса. Используйте List или LazyVGrid для отображения изображений.
2. **Работа с данными:**
- Используйте публичный API для поиска изображений.
- Создайте модель Image, которая содержит URL изображения и описание.
- Имплементируйте ViewModel для выполнения запросов к API и обработки результатов.
3. **Что нужно предоставить:**
- Репозиторий с исходным кодом.
- Инструкции по сборке и запуску приложения.
- В readme описать преимущества программы.

</details>

## Преимущества приложения:
- Быстрый поиск изображений по картинке, повторная загрузка картинки при неудачной попытке первой загрузки;
- Возможность переключения между режимам просмотра картинок: в виде списка либо в виде сетки;
- Поиск по нескольким словам;
- Возможность сохранения картинки в галерею по нажатию на неё.
- Интуитивно понятный и простой интерфейс с поддержкой тёмной версии;
- Локализация приложения (русский и английский язык приложения).

Скриншоты:

<img width="200" alt="image" src="https://github.com/user-attachments/assets/38720347-5ba2-466b-a70d-30e4575efb42">
<img width="200" alt="image" src="https://github.com/user-attachments/assets/8ea24991-f0ee-4f1e-bb15-c68e56616371">
<img width="200" alt="image" src="https://github.com/user-attachments/assets/fe1206ed-f79e-4510-88ee-7917c6dcdeb3">


## Инструкция по сборке и запуску приложения:
### Требования:
Минимальная версия Xcode 15.2. Загрузить Xcode можно по [ссылке](https://apps.apple.com/by/app/xcode/id497799835?mt=12).

### 1. Клонирование репозитория
Перейдите в терминал и выполните команду `git clone git@github.com:ozzyasha/tea-mail-shop.git`

### 2. Открытие проекта в Xcode
Откройте Xcode и выберите "File" -> "Open..." (либо нажмите сочетание клавиш `⌘O`), далее перейдите в директорию репозитория 

### 3. Использование API ключа
Приложение работает с использованием публичного API сайта Pixabay, свой API ключ можно получить при регистрации, подробная информация о работе API и получении ключа [доступна по ссылке](https://pixabay.com/api/docs/).

- После получения ключа необходимо редактировать файл `config.plist` в папке проекта, вместо "YOUR_API_KEY" ввести свой API ключ, полученный при регистрации на сайте Pixabay:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>APIKey</key>
    <string>YOUR_API_KEY</string> // вводим здесь свой ключ
</dict>
</plist>

```
Либо замените ключ в Xcode в файле проекта:
<img width="714" alt="image" src="https://github.com/user-attachments/assets/752699b7-ef5e-4be5-8da0-43256a424aef">

<details>
<summary> Создание собственного файла config.plist (если есть необходимость) </summary>

- Нажать в левом нижнем углу в Xcode "+", выбрать "File..." ("Файл...")    
<img width="270" alt="image" src="https://github.com/user-attachments/assets/3f8d67af-b4fb-40a8-95ef-75f3f00cb225">

- Затем выбрать "Property List" и создать его в проекте с именем "config"    
<img width="725" alt="image" src="https://github.com/user-attachments/assets/3f2c36f0-5c07-498a-b496-2146a641bfa3">

- Настроить config.plist как показано на скриншоте ниже, вместо "YOUR_API_KEY" ввести свой API ключ, полученный при регистрации на сайте Pixabay    
<img width="714" alt="image" src="https://github.com/user-attachments/assets/752699b7-ef5e-4be5-8da0-43256a424aef">

</details>

### 4. Запуск проекта

- Выберите симулятор устройства (iPhone или iPad) в меню Xcode.    
<img width="316" alt="image" src="https://github.com/user-attachments/assets/4c1f6549-eba5-4de8-8a96-6f8f555fdcfa">

- Нажмите кнопку Run в верхней левой части Xcode, чтобы запустить приложение (либо используйте сочетание клавиш `⌘R`).    
<img width="305" alt="image" src="https://github.com/user-attachments/assets/46c22747-095e-4a59-bec0-91cc5b30542d">

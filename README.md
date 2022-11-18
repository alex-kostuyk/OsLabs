# Лабораторна робота №5. Деплой проекту на AWS EC2

## План:
 1. Зареєструватись на AWS.
 2. Створити інстанс EC2.
 3. Задеплоїти проект (може бути html сторінка) і скинути посилання в звіт для можливості перегляду.

---
Виконав студент ІІІ курсу

Напрям ІПЗ, група 1.2

Костюк Олександр Анатолійович

---

### 1. Зареєструватись на AWS.

У мене вже був акаунт на AWS, тому перше завдання було виконаним

### 2. Створити інстанс EC2.

вибираю операційну систему
![image1](assets/1.jpg)

Далі згенерував SSH ключ для доступу, також можна було вибрати для підключення вже існуючі ключі

Переходимо до налаштувань мережі,де даємо доступ через SSH та дозволяємо HTTP і HTTPS трафік

![image2](assets/2.jpg)

Натискаємо на Launch Instance і переходимо у вкладку Instances

![image3](assets/3.jpg)

Бачимо, що наш інстанс створено

Після цього вибираємо його(просто клік мишею) та тиснемо зверху на кнопку Connect

![image4](assets/Знімок екрана 2022-11-18 062546.jpg)

### 3. Задеплоїти проект (може бути html сторінка) і скинути посилання в звіт для можливості перегляду.

Входимо у термінал ОС, яку ми встановили раніше

![image5](assets/4.jpg)

Тепер нам треба встановити сервер (nginx або apache).

Встановив за допомогою команд

```
sudo apt upgrade
sudo apt install apache2
sudo ufw allow in "Apache Full"
sudo systemctl restart apache2
```
Змінив вміст html файлу, отримавши доступ до терміналу інстансу.

![image5](assets/6.jpg)

Далі я заповнив html файл

![image6](assets/5.jpg)


Перейшовши за адресою створеного ресурсу http://3.21.40.66/ отримав наступний результат:

![image6](assets/7.jpg)



[Лінк на сайт](http://3.21.40.66/)
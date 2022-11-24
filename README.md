# Лабораторна робота №4. Create terraform scenario for provisioning infrastructure on GCP (or AWS) cloud

## План:
 1. Create one instance (image: ubuntu 20.04)
 2. Allow HTTP/HTTPS traffic on a NIC
 3. Provision one SSH public key for created instance
 4. Install Web Server (Apache HTTP Server / NGINX HTTP Server) via bash scenario

---
Виконав студент ІІІ курсу

Напрям ІПЗ, група 1.2

Костюк Олександр Анатолійович

---

### 1. Create one instance (image: ubuntu 20.04)

зареєструвався на AWS, та створив користувача. Після чого отримав для цього користувача access_key i secret_key для того, щоб у подальшому використати їх у файлі config.tf

![image](img/1.jpg)

Далі я створив файл config.tf для прописування конфігурації образу убунти, щоб за допомогою Тераформу розмістити її на AWS.

![image](img/2.jpg)

Потім виконав команди terraform init(деплой інстансу на AWS), terraform plan(які зміни відбудуться після аплаю файлу), terraform apply(власне розміщення на AWS):

![image](img/3.jpg)

![image](img/4.jpg)

### 2. Allow HTTP/HTTPS traffic on a NIC

Прописую відповідні дозволи у файлі, також прописую security group безпосередньо для цього інстансу. 

![image](img/5.jpg)

Вигляд доданої security group y AWS:

![image](img/6.jpg)

результат:

![image](img/7.jpg)

### 3. Provision one SSH public key for created instance

Спочатку згенерую приватний та паблік ssh-ключі за допомогою наступної команди:

![image](img/8.jpg)

Додаю наступне у config.tf:

![image](img/9.jpg)

Далі потрібно додати ключ у resource:

![image](img/10.jpg)

ingress блок, що дозволяє вхідному трафіку SSH отримати доступ до VPS через протокол SSH з віддаленої машини

![image](img/11.jpg)

### 4. Install Web Server (Apache HTTP Server / NGINX HTTP Server) via bash scenario

Bash скрипт установки та запуску apache2

![image](img/12.jpg)

Додання скрипту до instance за допомогою user_data

![image](img/13.jpg)

![Лінк на сайт](http://ec2-18-192-26-168.eu-central-1.compute.amazonaws.com/)
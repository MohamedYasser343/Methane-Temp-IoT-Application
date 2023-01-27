# Methane-Temp-IoT-Project

Capstone Project for a team I helped

(I helped this team only in application and server)

---

# Table Of Content

* **Application:** The frond-end application that view sensor readings
* **Server:** The median between arduino and application that get data from serial, store it, and send it

---

# How To Install

1. Install Go-lang
1. Install Python
1. Install Flutter framework

Download the project:

```
git clone https://github.com/MohamedYasser343/Methane-Temp-IoT-Application.git
```
use command:
```
flutter create <project name>
```
Replace files in the project into the flutter project.

---
# How To Run

Remember to change IP address to your server address:
(Application/weather_app/lib/main.dart)

```dart
const serverIP = "<IP>:<Port>";
```


2. start the server using:

```
python3 Serial.py
```
and

```
go run main.go
```

3. build mobile application using:
```
flutter build apk --release --split-per-abi
```
4. view the results


---

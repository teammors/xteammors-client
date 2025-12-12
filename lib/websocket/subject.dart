// 主题类
import 'observer.dart';

class Subject {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) => _observers.add(observer);

  void removeObserver(Observer observer) => _observers.remove(observer);

  void notifyObservers(String message) {
    for (final observer in _observers) {
      observer.update(message);
    }
  }
}

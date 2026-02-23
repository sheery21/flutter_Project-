import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;
  RxDouble opacity = .4.obs;
  RxBool notification = false.obs;
  RxList<String> fruitList = ["Oringe", "Apple", "Mangoes", "Bannana"].obs;
  RxList tempFruitList = [].obs;

  incrementCounter() {
    counter.value++;
    print("counter value ${counter.value}");
  }

  setOpacity(double value) {
    opacity.value = value;
  }

  notifyLisner(bool value) {
    notification.value;

    print("notification value ${notification.value}");
  }

  addToFavourit(String value) {
    tempFruitList.add(value);
  }

  removeFromFavourit(String value) {
    tempFruitList.remove(value);
  }
}

import 'dart:math';

void miniMaxSum(List<int> list) {
  if (list.length != 5) return;
  int sum = list[0] + list[1] + list[2] + list[3];
  int lastValue = list[4];
  int minValue = sum;
  int maxValue = sum;

  for (int i = 0; i < list.length - 1; i++) {
    minValue = min(sum - list[i] + lastValue, minValue);
    maxValue = max(sum - list[i] + lastValue, maxValue);
  }
  print('$minValue $maxValue');
}

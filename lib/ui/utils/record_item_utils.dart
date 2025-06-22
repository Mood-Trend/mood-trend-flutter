const double kMinSleepHours = 0.0; // 最小睡眠時間
const double kMaxSleepHours = 16.0; // 最大睡眠時間
const int kMinStepCount = 0; // 最小歩数
const int kMaxStepCount = 20000; // 最大歩数

// 睡眠時間の制限を行う関数
double clampSleepHours(double value) {
  if (value <= kMinSleepHours) return kMinSleepHours;
  if (value > kMaxSleepHours) return kMaxSleepHours;
  return value;
}

// 歩数の制限を行う関数
int clampStepCount(double value) {
  if (value <= kMinStepCount) return kMinStepCount;
  if (value > kMaxStepCount) return kMaxStepCount;
  return value.toInt();
}

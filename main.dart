import 'dart:convert';
import 'dart:io';
import 'dart:math';

String getResult(String userInput, String cpuInput) {
  if (userInput == cpuInput) {
    return '비겼습니다.';
  }

  const winConditions = {
    '가위': '보',
    '바위': '가위',
    '보': '바위'
  };
  //map을 사용한 승리 조건 구현.

  if (winConditions[userInput] == cpuInput) {
    return '당신이 승리하였습니다.';
  } else {
    return 'CPU가 승리하였습니다.';
  }
}

void main() {
  print('가위, 바위, 보 중 하나를 입력해 주세요.');
  final String userInput = stdin.readLineSync(encoding: utf8)?.trim() ?? '';
  // stdin의 readLine으로 한 줄의 텍스트를 동기적으로 읽고 엔터 입력 때까지 기다림.
  // String 이 null인 경우 빈 문자열로 설정함.(null-safety)

  const validInputs = ['가위', '바위', '보'];
  if (!validInputs.contains(userInput)) {
    print('올바른 입력이 아닙니다.');
    return;
  }

  final cpuInput = validInputs[Random().nextInt(3)];
  // 0~2까지 범위의 랜덤 값을 받아옴.
  print('상대방: $cpuInput');

  final result = getResult(userInput, cpuInput);
  print(result);
}

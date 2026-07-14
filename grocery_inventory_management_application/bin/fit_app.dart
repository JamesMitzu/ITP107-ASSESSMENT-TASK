import 'dart:io';

void main(){
  List<int> duration = [];

  print("=== PNC SECTION E: METRICS ENGINE ===");

  for(int i = 1; i <= 5; i++){
      stdout.write("Enter duration for session $i: ");
      int minutes = int.tryParse(stdin.readLineSync()?? '0')?? 0;
      duration.add(minutes);
  }
  int totalMin = calculateTotalTime(duration);

  print("\n--- PERFORMANCE REPORT ---");
  print("Sessions Recorded: $duration");
  print("Total Exercise Volume: $totalMin");
  print("Athlete Standing: ${evaluatePerformance(totalMin)}");
}

int calculateTotalTime(List<int> duration){
  int totalMin = 0;
  for(int minutes in duration){
    totalMin += minutes;
  }
  return totalMin;
}

String evaluatePerformance(int totalMin){
  if(totalMin < 100){
    return "Conditioning Needed!";
  }else if(totalMin <= 150){
    return "Active Contender";
  }else{
    return "Elite Athlete";
  }
}
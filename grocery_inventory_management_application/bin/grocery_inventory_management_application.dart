import "dart:io";

void main() {
  print("WELCOME TO GROUP 4 SARI SARI STORE INVENTORY MANAGEMENT APPLICATION");
  bool isNotExit = true;
  List<String> itemName = [
    "Bear Brand Milk",
    "Nissin Cup Noodles",
    "Lucky Me Pancit Canton",
    "Coca Cola",
    "Sprite",
  ];
  List<int> itemQuantity = [10, 20, 15, 30, 25];
  List<double> itemPrice = [50.0, 30.0, 25.0, 40.0, 35.0];

  while (isNotExit) {
    print("\n====== MENU ======");
    print("1. ADD NEW ITEM");
    print("2. VIEW INVENTORY");
    print("3. SEARCH ITEM");
    print("4. UPDATE ITEM NAME");
    print("5. UPDATE ITEM QUANTITY");
    print("6. DELETE ITEM");
    print("7. INVENTORY SUMMARY");
    print("0. EXIT");
    stdout.write("Enter your choice: ");
    int choice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    switch (choice) {
      case 1:
        print("\n----------------------------");
        try {
          print("ADD NEW ITEM: ");
          stdout.write("HOW MANY ITEMS YOU WANT TO ADD: ");
          int numItems = int.parse(stdin.readLineSync()!);
          if(numItems < 0){
            print("Cannot input negative integer! ");
            continue;
          }

          for (int i = 0; i < numItems; i++) {
            print("----------------------------");
            stdout.write("\nEnter name for item ${i + 1}: ");
            String? name = stdin.readLineSync()!;
            stdout.write("Enter item quantity: ");
            int quantity = int.parse(stdin.readLineSync()!);
            stdout.write("Enter item price: ");
            double price = double.parse(stdin.readLineSync()!);
            itemName.add(name);
            itemQuantity.add(quantity);
            itemPrice.add(price);
          }
          print("----------------------------");
          print("\nITEM(S) ADDED SUCCESSFULLY!");
        } catch (numberFormatException) {
          print("NOT A VALID INTEGER");
        }
        break;

      case 2:
        print("\n----------------------------");
        print("VIEW INVENTORY: ");
        for (
          int i = 0;
          i < itemName.length &&
              i < itemQuantity.length &&
              i < itemPrice.length;
          i++
        ) {
          print(
            "${i + 1}. ${itemName[i]} - Quantity: ${itemQuantity[i]} - Price: ${itemPrice[i]}",
          );
        }
        print("----------------------------");
        break;

      case 3:
        print("\n----------------------------");
        print("SEARCH ITEM: ");
        stdout.write("Enter item name to search: ");
        String? searchName = stdin.readLineSync();
          if (searchName == "") {
            print("Enter an item name! ");
            break;
          }

        bool isFound = false;
        int index = -1;
        for (int i = 0; i < itemName.length; i++) {
          if (itemName[i].toLowerCase() == searchName?.toLowerCase()) {
            isFound = true;
            index = i;
          }
        }
        if (isFound == true) {
          print("ITEM FOUND!");
          print(
            "${index + 1}. ${itemName[index]} - Quantity: ${itemQuantity[index]} - Price: ${itemPrice[index]}",
          );
        } else {
          print("ITEM NOT FOUND!");
        }
        print("----------------------------");
        break;

      case 4:
        bool isFound = false;
        int index = -1;

        print("UPDATE ITEM NAME: ");

        do {
          stdout.write("Enter item name to update: ");
          String? toUpdateName = stdin.readLineSync();

          if (toUpdateName == null || toUpdateName.trim().isEmpty) {
            print("Enter an item name! ");
          } else {
            for (int i = 0; i < itemName.length; i++) {
              if (itemName[i].toLowerCase() == toUpdateName.toLowerCase()) {
                isFound = true;
                index = i;
                stdout.write("Enter new name for ${itemName[i]}: ");
                String? newName = stdin.readLineSync();
                if (newName == null || newName.trim().isEmpty) {
                  print("Enter a valid name! ");
                } else {
                  itemName[index] = newName;
                  print("ITEM NAME UPDATED SUCCESSFULLY!");
                }
              }
            }
          }
        } while (isFound == false);
        break;

      case 5:
        print("UPDATE ITEM QUANTITY: ");
        bool isNotFound = true;
        int index = -1;
        int tries = 5;

        do {
          stdout.write("Enter item name to update quantity: ");
          String? toUpdateQuantity = stdin.readLineSync();

          if (toUpdateQuantity == null || toUpdateQuantity.trim().isEmpty) {
            print("Enter an item name! ");
            continue;
          }

          for (int i = 0; i < itemName.length; i++) {
            if (itemName[i].toLowerCase() ==
                toUpdateQuantity.trim().toLowerCase()) {
              isNotFound = false;
              index = i;
              break;
            }
          }

          if (isNotFound) {
            tries--;
            print("Item not found! Try again. ($tries tries left)");

            if (tries == 0) {
              print("TRY AGAIN LATER!");
              break;
            }
          } else {
            stdout.write(
              "Current quantity of ${itemName[index]}: ${itemQuantity[index]}\n",
            );
            stdout.write("Enter new quantity for ${itemName[index]}: ");

            String? qtyInput = stdin.readLineSync();
            int? newQuantity = qtyInput != null ? int.tryParse(qtyInput) : null;

            if (newQuantity == null || newQuantity < 0) {
              print("You must enter a valid positive number! ");
              isNotFound = true;
            } else {
              itemQuantity[index] = newQuantity;
              print("ITEM QUANTITY UPDATED SUCCESSFULLY!");
            }
          }
        } while (isNotFound);
        break;

      case 6:
        print("DELETE ITEM: ");
        stdout.write("Enter item name to delete: ");
        String? toDeleteName = stdin.readLineSync();
        bool isFound = false;
        int index = -1;
        if (toDeleteName == null || toDeleteName.trim().isEmpty) {
          print("Enter an item name! ");
        } else {
          for (int i = 0; i < itemName.length; i++) {
            if (itemName[i].toLowerCase() == toDeleteName.toLowerCase()) {
              isFound = true;
              index = i;
            }
          }
        }

        if (isFound == true) {
          stdout.write(
            "Are you sure you want to delete ${itemName[index]} [yes/no]?: ",
          );
          String? confirmation = stdin.readLineSync();
          if (confirmation?.toLowerCase() == "yes") {
            itemName.removeAt(index);
            itemQuantity.removeAt(index);
            itemPrice.removeAt(index);
            print("ITEM DELETED SUCCESSFULLY!");
          } else {
            print("ITEM NOT DELETED!");
          }
        } else {
          print("ITEM NOT FOUND!");
        }
        break;

      case 7:
        print("\n----INVENTORY SUMMARY----");
        print("Total Items: ${itemName.length}");

        int totalQuant = 0;
        for (int i = 0; i < itemQuantity.length; i++) {
          totalQuant += itemQuantity[i];
        }
        print("Total Quantity: $totalQuant");

        print("Average Quantity: ${totalQuant / itemQuantity.length}");

        int highestQuantity = itemQuantity[0];
        String nameHighest = itemName[0];
        for (int i = 0; i < itemQuantity.length - 1; i++) {
          if (highestQuantity < itemQuantity[i + 1]) {
            highestQuantity = itemQuantity[i + 1];
            nameHighest = itemName[i + 1];
          }
        }
        print("HIGHEST ITEM QUANTITY: $nameHighest - $highestQuantity");

        int lowestQuantity = itemQuantity[0];
        String nameLowest = itemName[0];
        for (int i = 0; i < itemQuantity.length - 1; i++) {
          if (lowestQuantity > itemQuantity[i + 1]) {
            lowestQuantity = itemQuantity[i + 1];
            nameLowest = itemName[i + 1];
          }
        }
        print("LOWEST ITEM QUANTITY: $nameLowest - $lowestQuantity");
        print("----------------------------");
        break;

      default:
        print("ENTER A VALID CHOICE!");
    }
  }
}

struct character {
  char letter;
  int aIndex;
  int prevIndex;
};


int findIndex(char letter) {                   // Finds letter index in alphabet
  for (int j = 0; j < A_SIZE; j++) {
    if (letter == alphabet[j]) return j;
  }
  return -1;
}


void sortKey(character *array, int size) {    // Sorting key letter according to alphabet
  character temp;
  for (int i = 1; i < size; i++) {
    for (int j = 0; j < size-1; j++) {
      if (array[j].aIndex > array[j+1].aIndex) {
        temp = array[j];
        array[j] = array[j+1];
        array[j+1] = temp;
      }
    }
  }
}


character* strToCharacter (std::string str) {  // Converts std::string to array of "character" structs saving prevIndex in string
  character* outputChar = new character[str.length()];

  for (int i = 0; i < str.length(); i++) {
    outputChar[i].letter = str[i];
    outputChar[i].prevIndex = i;
    outputChar[i].aIndex = findIndex(str[i]);
    if (outputChar[i].aIndex == -1) {
      std::cout << "Error: Letter not found in alphabet" << std::endl;
      exit(1);
    }
  }

  return outputChar;
}

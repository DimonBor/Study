using namespace std;


void clear_screen() {

  #ifdef WINDOWS
    system("cls");
  #else
    system("clear");
  #endif

}


void wait_plz(int time) {

  #ifdef WINDOWS
    Sleep(time);
  #else
    sleep(time);
  #endif

}


bool is_in_vector(vector<int>& arr, int key) {

  for (int i = 0; i < arr.size(); i ++) {
    if (arr[i] == key) return true;
  }

  return false;

}


int how_many(vector<int>& arr, int key) {

  int counter = 0;

  for (int i = 0; i < arr.size(); i ++) {
    if (arr[i] == key) counter ++;
  }

  return counter;

}


int most_frequent(vector<int>& arr) {

  vector<int> numbers;
  int max_l = 0, l;

  for (int i = 0; i < arr.size(); i ++){
    if (!is_in_vector(numbers, arr[i])) numbers.push_back(arr[i]);
  }

  for (int i = 0; i < numbers.size(); i ++) {
    if (how_many(arr, numbers[i]) > max_l) {
      max_l = how_many(arr, numbers[i]);
      l = numbers[i];
    }
  }

  return l;

}


void convert_to_indeces(vector<int>& arr, string str) {

  for (int i = 0; i < str.size(); i ++) {
    for (int j = 0; j < alphabet_size; j ++) {
      if (str[i] == alphabet[j]) arr.push_back(j);
    }
  }

}


void convert_to_string(vector<int> arr, string& str) {

  for (int i = 0; i < arr.size(); i ++) {
    for (int j = 0; j < alphabet_size; j ++) {
      if (arr[i] == j) str += alphabet[j];
    }
  }

}


vector<int> move_arr(vector<int>& arr) {

  int first = arr[arr.size()-1];
  vector<int> new_arr;

  for (int i = 0; i < arr.size(); i ++) {
    new_arr.push_back(arr[i]);
  }

  new_arr.insert(new_arr.begin(), first);
  new_arr.pop_back();

  return new_arr;

}


string encrypt() {

  string key, user_input, key_word, encrypted;
  vector<int> user_indices, key_indices, encrypted_indices;

  cout << "Enter keyword: ";
  cin >> key_word;
  cout << "Enter text: ";
  cin >> user_input;

  while (key.size() < user_input.size()) {
    key += key_word;
  }

  convert_to_indeces(user_indices, user_input);
  convert_to_indeces(key_indices, key);

  for (int i = 0; i < user_indices.size(); i ++) {
      if (user_indices[i] + key_indices[i] >= alphabet_size) encrypted_indices.push_back(user_indices[i] + key_indices[i] - alphabet_size);
      else encrypted_indices.push_back(user_indices[i] + key_indices[i]);
  }

  convert_to_string(encrypted_indices, encrypted);

  return encrypted;

}


string decrypt() {

  string key, user_input, key_word, decrypted;
  vector<int> user_indices, key_indices, decrypted_indices;

  cout << "Enter keyword: ";
  cin >> key_word;
  cout << "Enter encrypted text: ";
  cin >> user_input;

  while (key.size() < user_input.size()) {
    key += key_word;
  }

  convert_to_indeces(user_indices, user_input);
  convert_to_indeces(key_indices, key);

  for (int i = 0; i < user_indices.size(); i ++) {
      if (user_indices[i] - key_indices[i] < 0) decrypted_indices.push_back(user_indices[i] - key_indices[i] + alphabet_size);
      else decrypted_indices.push_back(user_indices[i] - key_indices[i]);
  }

  convert_to_string(decrypted_indices, decrypted);

  return decrypted;

}


string hack() {

  int counter, l_strick, l, user_choise;
  string key, user_input, key_word, decrypted, temp_key;
  vector<string> possible_keys, mostly_possible_keys;
  vector<int> user_indices, key_indices, moved_indices, l_vector, decrypted_indices;
  vector<float> indices_s;
  float index_s = 0, letter_count[alphabet_size], accuracy = 0.045;

  cout << "Enter encrypted text: ";
  cin >> user_input;

  convert_to_indeces(user_indices, user_input);
  moved_indices = move_arr(user_indices);


  for (int g = 0; g < user_indices.size(); g ++) {

    index_s = 0;
    counter = 0;

    for (int i = 0; i < user_indices.size(); i ++) {
      if (user_indices[i] == moved_indices[i]) counter++;
    }

    index_s = (float)(counter)/(float)(user_indices.size());

    moved_indices = move_arr(moved_indices);
    indices_s.push_back(index_s);

  }

  for (int i = 0; i < indices_s.size(); i ++) {
    if (indices_s[i] < 0.048) l_strick ++;
    else {
      l_vector.push_back(l_strick+1);
      l_strick = 0;
    }
  }

  l = most_frequent(l_vector);

  cout << "\nKey lenght is " << l << "\n\n";

  ifstream vocabulary("f_word_list.txt");

  while (getline(vocabulary, temp_key)) possible_keys.push_back(temp_key);
  vocabulary.close();

  refind_keys:

  for (int j = 0; j < possible_keys.size(); j ++) {

    decrypted_indices.clear();
    key_indices.clear();
    decrypted = "";

    for (int i = 0; i < alphabet_size; i ++) letter_count[i] = 0;

    if (possible_keys[j].size() == l+1) {
      key = possible_keys[j];
      do {
        key += possible_keys[j];
      } while (key.size() < user_indices.size());

    }
    else continue;

    convert_to_indeces(key_indices, key);

    for (int i = 0; i < user_indices.size(); i ++) {
        if (user_indices[i] - key_indices[i] < 0) decrypted_indices.push_back(user_indices[i] - key_indices[i] + alphabet_size);
        else decrypted_indices.push_back(user_indices[i] - key_indices[i]);
    }


    index_s = 0;
    counter = 0;

    convert_to_string(decrypted_indices, decrypted);

    for (int i = 0; i < alphabet_size; i++) {
      for (int j = 0; j < user_indices.size(); j ++) {
        if (decrypted_indices[j] == i) letter_count[i]++;
      }
    }

    for (int i = 0; i < alphabet_size; i++) {
      index_s += (letter_count[i]*(letter_count[i]-1))/(user_indices.size()*(user_indices.size()-1));
    }

    if (index_s > accuracy) mostly_possible_keys.push_back(possible_keys[j]);

  }

  another_key:

  for (int i = 0; i < mostly_possible_keys.size(); i ++) {
    cout << i+1 << ". " << mostly_possible_keys[i] << "\n";
  }

  if (!mostly_possible_keys.size()) {
    cout << "ERROR! No keys found!\n\n";
    cout << "Try lower accuracy?[y/n]: ";
    cin >> user_input;

    if (user_input == "y" || user_input == "Y"){
      if (accuracy == 0.037){
        cout << "Already tried!!!";
        wait_plz(1);
        clear_screen();
        return "none";
      }
      accuracy = 0.037;
      clear_screen();
      goto refind_keys;
    }
    else if (user_input == "n" || user_input == "N") {
      cout << "Ending...\n";
      wait_plz(1);
      clear_screen();
      return "None";
    }
    else {
      cout << "Invalid input! Try again...\n";
      wait_plz(1);
      goto another_key;
    }
  }

  cout << "Choose mostly possible key(1-" << mostly_possible_keys.size() << "): ";
  cin >> user_choise;

  if (user_choise < 1 || user_choise > mostly_possible_keys.size()) {
    cout << "Invalid input! Try again...\n";
    wait_plz(1);
    clear_screen();
    goto another_key;
  }

  key_word = mostly_possible_keys[user_choise-1];

  decrypted_indices.clear();
  key_indices.clear();
  key = "";
  decrypted = "";

  do {
    key += key_word;
  } while (key.size() <= user_indices.size());

  convert_to_indeces(key_indices, key);

  for (int i = 0; i < user_indices.size(); i ++) {
      if (user_indices[i] - key_indices[i] < 0) decrypted_indices.push_back(user_indices[i] - key_indices[i] + alphabet_size);
      else decrypted_indices.push_back(user_indices[i] - key_indices[i]);
  }

  convert_to_string(decrypted_indices, decrypted);

  retry:

  clear_screen();

  cout << "\nDecrypted text is \n\n" << decrypted << "\n\n Is it okay?(type \"q\" to exit)[y/n/q]: ";
  cin >> user_input;

  if (user_input == "y" || user_input == "Y"){
    clear_screen();
    return decrypted;
  }
  else if (user_input == "n" || user_input == "N") {
    cout << "Try to choose another key...\n";
    wait_plz(1);
    clear_screen();
    goto another_key;
  }
  else if (user_input == "q" || user_input == "Q") {
    clear_screen();
    return "none";
  }
  else {
    cout << "Invalid input! Try again...\n";
    wait_plz(1);
    goto retry;
  }

}

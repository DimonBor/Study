using namespace std;


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


string encrypt(string user_input, string key_word) {

  string key, encrypted;
  vector<int> user_indices, key_indices, encrypted_indices;

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


string decrypt(string user_input, string key_word) {

  string key, decrypted;
  vector<int> user_indices, key_indices, decrypted_indices;

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



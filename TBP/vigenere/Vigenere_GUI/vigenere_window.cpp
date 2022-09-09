#include <string>
#include <algorithm>
#include <fstream>
#include <cctype>
#include <vector>
#include <QMessageBox>

#ifdef WINDOWS
#include <Windows.h>
#else
#include <unistd.h>
#endif

#include "alphabet.h"
#include "func.h"

#include "vigenere_window.h"
#include "./ui_vigenere_window.h"


Vigenere_Window::Vigenere_Window(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Vigenere_Window)
{
    ui->setupUi(this);
}


Vigenere_Window::~Vigenere_Window() {
    delete ui;
}


void Vigenere_Window::on_Encrypt_Button_clicked() {

    string user_input, key;
    QMessageBox msgBox;

    user_input = ui->Input_Field->toPlainText().toStdString();
    key = ui->Key_Field->toPlainText().toStdString();

    if (!user_input.length() || !key.length()) {
        msgBox.setText("ERROR!!! Check the correctness of the entered data!");
        msgBox.exec();
        Vigenere_Window::on_Clear_Button_clicked();
    }
    else {
        ui->Output_Field->setText(QString::fromStdString(encrypt(user_input, key)));
        ui->Key_Length_Monitor->display((int)(key.length()));
    }

}


void Vigenere_Window::on_Decrypt_Button_clicked() {

    string user_input, key;
    QMessageBox msgBox;

    user_input = ui->Input_Field->toPlainText().toStdString();
    key = ui->Key_Field->toPlainText().toStdString();

    if (!user_input.length() || !key.length()) {
        msgBox.setText("ERROR!!! Check the correctness of the entered data!");
        msgBox.exec();
        Vigenere_Window::on_Clear_Button_clicked();
    }
    else {
        ui->Output_Field->setText(QString::fromStdString(decrypt(user_input, key)));
        ui->Key_Length_Monitor->display((int)(key.length()));
    }

}


void Vigenere_Window::on_Hack_Button_clicked() {

    int counter, l_strick, l, user_choise;
    float index_s = 0, letter_count[alphabet_size], accuracy = 0.055;
    string key, key_word, user_input, decrypted, temp_key;
    vector<string> possible_keys, mostly_possible_keys;
    vector<int> user_indices, key_indices, moved_indices, l_vector, decrypted_indices;
    vector<float> indices_s;
    QMessageBox msgBox;

    ui->Accept_Key_Button->setEnabled(true);
    ui->Decrypt_Button->setEnabled(false);
    ui->Encrypt_Button->setEnabled(false);
    ui->Key_Field->setReadOnly(true);
    ui->Input_Field->setReadOnly(true);
    ui->Hack_Button->setEnabled(false);

    ui->comboBox->clear();
    ui->Key_Field->clear();
    ui->Output_Field->clear();

    user_input = ui->Input_Field->toPlainText().toStdString();

    if (!user_input.length()) {
        msgBox.setText("ERROR!!! Check the correctness of the entered data!");
        msgBox.exec();
        Vigenere_Window::on_Clear_Button_clicked();
        return;
    }

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

    ui->Key_Length_Monitor->display(l);

    ifstream vocabulary("f_word_list.txt");

    if (!vocabulary.is_open()) {

        msgBox.setText("ERROR!!! Vocabulary not found!");
        msgBox.exec();
        return;
    }


    while (getline(vocabulary, temp_key)) possible_keys.push_back(temp_key);

    vocabulary.close();

    for (int j = 0; j < possible_keys.size(); j ++) {

      decrypted_indices.clear();
      key_indices.clear();
      decrypted = "";

      for (int i = 0; i < alphabet_size; i ++) letter_count[i] = 0;

      if (possible_keys[j].size() == l) {
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

    for (int i = 0; i < mostly_possible_keys.size(); i ++) {
       ui->comboBox->addItem(QString::fromStdString(mostly_possible_keys[i]));
    }

    if (!mostly_possible_keys.size()) {
        msgBox.setText("ERROR!!! No Keys found");
        msgBox.exec();
        ui->Key_Length_Monitor->display(0);
        ui->Accept_Key_Button->setEnabled(false);
        ui->Decrypt_Button->setEnabled(true);
        ui->Encrypt_Button->setEnabled(true);
        ui->Key_Field->setReadOnly(false);
        ui->Input_Field->setReadOnly(false);
        ui->Hack_Button->setEnabled(true);
        return;
    }

    msgBox.setText("Choose the mostly possible key from drop-down list");
    msgBox.exec();

}


void Vigenere_Window::on_Accept_Key_Button_clicked() {

     string key, user_input;

     key = ui->comboBox->currentText().toStdString();
     user_input = ui->Input_Field->toPlainText().toStdString();

     ui->Output_Field->setText(QString::fromStdString(decrypt(user_input, key)));

}


void Vigenere_Window::on_Clear_Button_clicked() {

    ui->Accept_Key_Button->setEnabled(false);
    ui->Decrypt_Button->setEnabled(true);
    ui->Encrypt_Button->setEnabled(true);
    ui->Key_Field->setReadOnly(false);
    ui->Input_Field->setReadOnly(false);
    ui->Hack_Button->setEnabled(true);
    ui->Input_Field->clear();
    ui->Output_Field->clear();
    ui->comboBox->clear();
    ui->Key_Length_Monitor->display(0);
    return;

}


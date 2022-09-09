#include "vigenere_window.h"

#include <QApplication>

int main(int argc, char *argv[]) {

    QApplication a(argc, argv);
    Vigenere_Window w;
    w.show();
    return a.exec();

}

#ifndef VIGENERE_WINDOW_H
#define VIGENERE_WINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class Vigenere_Window; }
QT_END_NAMESPACE

class Vigenere_Window : public QMainWindow
{
    Q_OBJECT

public:
    Vigenere_Window(QWidget *parent = nullptr);
    ~Vigenere_Window();

private slots:
    void on_Encrypt_Button_clicked();

    void on_Decrypt_Button_clicked();

    void on_Hack_Button_clicked();

    void on_Accept_Key_Button_clicked();

    void on_Clear_Button_clicked();

private:
    Ui::Vigenere_Window *ui;
};
#endif // VIGENERE_WINDOW_H

/********************************************************************************
** Form generated from reading UI file 'vigenere_window.ui'
**
** Created by: Qt User Interface Compiler version 6.1.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_VIGENERE_WINDOW_H
#define UI_VIGENERE_WINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QLCDNumber>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Vigenere_Window
{
public:
    QWidget *centralwidget;
    QTextEdit *Input_Field;
    QLabel *label;
    QTextEdit *Output_Field;
    QLabel *label_3;
    QPushButton *Hack_Button;
    QPushButton *Decrypt_Button;
    QPushButton *Encrypt_Button;
    QTextEdit *Key_Field;
    QLabel *label_2;
    QLCDNumber *Key_Length_Monitor;
    QPushButton *Accept_Key_Button;
    QComboBox *comboBox;
    QPushButton *Exit_Button;
    QPushButton *Clear_Button;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *Vigenere_Window)
    {
        if (Vigenere_Window->objectName().isEmpty())
            Vigenere_Window->setObjectName(QString::fromUtf8("Vigenere_Window"));
        Vigenere_Window->resize(620, 585);
        Vigenere_Window->setMinimumSize(QSize(620, 585));
        Vigenere_Window->setMaximumSize(QSize(620, 585));
        centralwidget = new QWidget(Vigenere_Window);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        Input_Field = new QTextEdit(centralwidget);
        Input_Field->setObjectName(QString::fromUtf8("Input_Field"));
        Input_Field->setGeometry(QRect(20, 20, 581, 201));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(20, 0, 71, 21));
        label->setTextFormat(Qt::AutoText);
        Output_Field = new QTextEdit(centralwidget);
        Output_Field->setObjectName(QString::fromUtf8("Output_Field"));
        Output_Field->setGeometry(QRect(20, 310, 581, 201));
        Output_Field->setReadOnly(true);
        label_3 = new QLabel(centralwidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(20, 290, 71, 21));
        label_3->setTextFormat(Qt::AutoText);
        Hack_Button = new QPushButton(centralwidget);
        Hack_Button->setObjectName(QString::fromUtf8("Hack_Button"));
        Hack_Button->setGeometry(QRect(430, 270, 171, 31));
        Decrypt_Button = new QPushButton(centralwidget);
        Decrypt_Button->setObjectName(QString::fromUtf8("Decrypt_Button"));
        Decrypt_Button->setGeometry(QRect(520, 230, 80, 31));
        Encrypt_Button = new QPushButton(centralwidget);
        Encrypt_Button->setObjectName(QString::fromUtf8("Encrypt_Button"));
        Encrypt_Button->setGeometry(QRect(430, 230, 80, 31));
        Key_Field = new QTextEdit(centralwidget);
        Key_Field->setObjectName(QString::fromUtf8("Key_Field"));
        Key_Field->setGeometry(QRect(300, 230, 121, 31));
        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setEnabled(true);
        label_2->setGeometry(QRect(180, 230, 61, 21));
        Key_Length_Monitor = new QLCDNumber(centralwidget);
        Key_Length_Monitor->setObjectName(QString::fromUtf8("Key_Length_Monitor"));
        Key_Length_Monitor->setGeometry(QRect(240, 230, 51, 23));
        Accept_Key_Button = new QPushButton(centralwidget);
        Accept_Key_Button->setObjectName(QString::fromUtf8("Accept_Key_Button"));
        Accept_Key_Button->setEnabled(false);
        Accept_Key_Button->setGeometry(QRect(210, 280, 80, 21));
        comboBox = new QComboBox(centralwidget);
        comboBox->setObjectName(QString::fromUtf8("comboBox"));
        comboBox->setGeometry(QRect(300, 270, 121, 31));
        Exit_Button = new QPushButton(centralwidget);
        Exit_Button->setObjectName(QString::fromUtf8("Exit_Button"));
        Exit_Button->setGeometry(QRect(520, 520, 80, 21));
        Clear_Button = new QPushButton(centralwidget);
        Clear_Button->setObjectName(QString::fromUtf8("Clear_Button"));
        Clear_Button->setGeometry(QRect(20, 520, 80, 21));
        Vigenere_Window->setCentralWidget(centralwidget);
        menubar = new QMenuBar(Vigenere_Window);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setEnabled(false);
        menubar->setGeometry(QRect(0, 0, 620, 20));
        Vigenere_Window->setMenuBar(menubar);
        statusbar = new QStatusBar(Vigenere_Window);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        statusbar->setEnabled(false);
        Vigenere_Window->setStatusBar(statusbar);

        retranslateUi(Vigenere_Window);
        QObject::connect(Exit_Button, &QPushButton::clicked, Vigenere_Window, qOverload<>(&QMainWindow::close));

        QMetaObject::connectSlotsByName(Vigenere_Window);
    } // setupUi

    void retranslateUi(QMainWindow *Vigenere_Window)
    {
        Vigenere_Window->setWindowTitle(QCoreApplication::translate("Vigenere_Window", "Vigenere (Made by Borshch Dmytro)", nullptr));
        Input_Field->setPlaceholderText(QCoreApplication::translate("Vigenere_Window", "Copy your text here ", nullptr));
        label->setText(QCoreApplication::translate("Vigenere_Window", "Your text", nullptr));
        Output_Field->setPlaceholderText(QCoreApplication::translate("Vigenere_Window", "There will be result", nullptr));
        label_3->setText(QCoreApplication::translate("Vigenere_Window", "Result", nullptr));
        Hack_Button->setText(QCoreApplication::translate("Vigenere_Window", "Hack!", nullptr));
        Decrypt_Button->setText(QCoreApplication::translate("Vigenere_Window", "Decrypt", nullptr));
        Encrypt_Button->setText(QCoreApplication::translate("Vigenere_Window", "Encrypt", nullptr));
        Key_Field->setDocumentTitle(QCoreApplication::translate("Vigenere_Window", "Key word", nullptr));
        Key_Field->setPlaceholderText(QCoreApplication::translate("Vigenere_Window", "Key word", nullptr));
        label_2->setText(QCoreApplication::translate("Vigenere_Window", "Key length", nullptr));
        Accept_Key_Button->setText(QCoreApplication::translate("Vigenere_Window", "OK", nullptr));
        Exit_Button->setText(QCoreApplication::translate("Vigenere_Window", "Exit", nullptr));
        Clear_Button->setText(QCoreApplication::translate("Vigenere_Window", "Clear", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Vigenere_Window: public Ui_Vigenere_Window {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_VIGENERE_WINDOW_H

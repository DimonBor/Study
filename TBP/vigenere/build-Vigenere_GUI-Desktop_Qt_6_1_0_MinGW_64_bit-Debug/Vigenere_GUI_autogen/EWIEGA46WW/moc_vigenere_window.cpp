/****************************************************************************
** Meta object code from reading C++ file 'vigenere_window.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.1.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../Vigenere_GUI/vigenere_window.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'vigenere_window.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.1.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Vigenere_Window_t {
    const uint offsetsAndSize[14];
    char stringdata0[145];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Vigenere_Window_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Vigenere_Window_t qt_meta_stringdata_Vigenere_Window = {
    {
QT_MOC_LITERAL(0, 15), // "Vigenere_Window"
QT_MOC_LITERAL(16, 25), // "on_Encrypt_Button_clicked"
QT_MOC_LITERAL(42, 0), // ""
QT_MOC_LITERAL(43, 25), // "on_Decrypt_Button_clicked"
QT_MOC_LITERAL(69, 22), // "on_Hack_Button_clicked"
QT_MOC_LITERAL(92, 28), // "on_Accept_Key_Button_clicked"
QT_MOC_LITERAL(121, 23) // "on_Clear_Button_clicked"

    },
    "Vigenere_Window\0on_Encrypt_Button_clicked\0"
    "\0on_Decrypt_Button_clicked\0"
    "on_Hack_Button_clicked\0"
    "on_Accept_Key_Button_clicked\0"
    "on_Clear_Button_clicked"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Vigenere_Window[] = {

 // content:
       9,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   44,    2, 0x08,    0 /* Private */,
       3,    0,   45,    2, 0x08,    1 /* Private */,
       4,    0,   46,    2, 0x08,    2 /* Private */,
       5,    0,   47,    2, 0x08,    3 /* Private */,
       6,    0,   48,    2, 0x08,    4 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Vigenere_Window::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Vigenere_Window *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->on_Encrypt_Button_clicked(); break;
        case 1: _t->on_Decrypt_Button_clicked(); break;
        case 2: _t->on_Hack_Button_clicked(); break;
        case 3: _t->on_Accept_Key_Button_clicked(); break;
        case 4: _t->on_Clear_Button_clicked(); break;
        default: ;
        }
    }
    (void)_a;
}

const QMetaObject Vigenere_Window::staticMetaObject = { {
    QMetaObject::SuperData::link<QMainWindow::staticMetaObject>(),
    qt_meta_stringdata_Vigenere_Window.offsetsAndSize,
    qt_meta_data_Vigenere_Window,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Vigenere_Window_t

, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>


>,
    nullptr
} };


const QMetaObject *Vigenere_Window::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Vigenere_Window::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Vigenere_Window.stringdata0))
        return static_cast<void*>(this);
    return QMainWindow::qt_metacast(_clname);
}

int Vigenere_Window::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE

#ifndef SRC_EXECOS_H_
#define SRC_EXECOS_H_

#include <QProcess>
#include <QVariant>
// #include <QDebug>

class Execos : public QProcess {
    Q_OBJECT

   public:
    Execos(QObject *parent = 0) : QProcess(parent) {}
    Q_INVOKABLE void start(const QString &program,
                           const QVariantList &arguments) {
        QStringList args;
        // convert QVariantList from QML to QStringList for QProcess
        for (int i = 0; i < arguments.length(); i++)
            args << arguments[i].toString();
        /* qDebug() << program + " " + args.join(" "); */
        // start program detached:
        QProcess::startDetached(program, args);
    }

    Q_INVOKABLE QByteArray readAll() { return QProcess::readAll(); }
};

#endif  // SRC_EXECOS_H_

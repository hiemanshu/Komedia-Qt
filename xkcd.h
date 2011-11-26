#ifndef XKCD_H
#define XKCD_H

#include <QObject>
#include <QtWebKit/QWebView>

class Xkcd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString altText READ getAltText)

public:
    explicit Xkcd(QObject *parent = 0);
    Q_INVOKABLE void next();
    Q_INVOKABLE void prev();
    Q_INVOKABLE void random();
    QString getAltText();

private:
    QWebView *page;
    QString altText;

signals:
    void loadFailed();
    void loadComplete();
    void loadStarting();

public slots:
    void scrap(bool error);
    void emitLoadStarting();

};

#endif // XKCD_H

#ifndef XKCD_H
#define XKCD_H

#include <QObject>
#include <QtWebKit/QWebView>

class Xkcd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString altText READ getAltText NOTIFY altTextChanged)
    Q_PROPERTY(QString comicUrl READ getComicUrl NOTIFY comicUrlChanged)

public:
    explicit Xkcd(QObject *parent = 0);
    Q_INVOKABLE void next();
    Q_INVOKABLE void prev();
    Q_INVOKABLE void random();
    QString getAltText();
    QString getComicUrl();

private:
    QWebView *page;
    QString altText;
    QString comicUrl;
    quint16 latest;
    quint16 comicId;
    quint16 latestSet;

signals:
    void loadFailed();
    void loadComplete();
    void loadStarting();
    void comicUrlChanged();
    void altTextChanged();
    void enableButtons();

public slots:
    void scrap(bool error);
    void emitLoadStarting();

};

#endif // XKCD_H

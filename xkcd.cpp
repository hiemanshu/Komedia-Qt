#include <QtWebKit/QWebElement>
#include <QtWebKit/QWebPage>
#include <QtWebKit/QWebFrame>
#include <QtWebKit/QWebElementCollection>
#include <QtWebKit/QWebView>
#include <QDebug>
#include <QObject>
#include "xkcd.h"

Xkcd::Xkcd(QObject *parent) :
    QObject(parent)
{
    page = new QWebView();
    page->setUrl(QUrl("http://xkcd.org"));
    emit loadStarted();
    connect(page, SIGNAL(loadFinished(bool)), this, SLOT(scrap(bool)));
}

void Xkcd::next()
{
    qDebug() << "Next in C++ Class";
}

void Xkcd::prev()
{
    qDebug() << "Previous in C++ Class";
}

void Xkcd::random()
{
    qDebug() << "Random in C++ Class";
}

void Xkcd::scrap(bool error)
{
    if(error)
    {
        qDebug() << "no error";
    }
    else
    {
        qDebug() << "error";
        emit loadFailed();
    }
}

QString Xkcd::getAltText()
{
    qDebug() << "Requesting AltText";
    return QString("I just read a pop-science book by a respected author. One chapter, and much of the thesis, was based around wildly inaccurate data which traced back to ... Wikipedia. To encourage people to be on their toes, I&#39;m not going to say what book or author.");
}

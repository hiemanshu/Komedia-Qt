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
    comicUrl = "http://imgs.xkcd.com/comics/porn_folder.png";
    page->setUrl(QUrl("http://xkcd.org/981/"));
    latestSet = 0;
    connect(page, SIGNAL(loadStarted()), this, SLOT(emitLoadStarting()));
    connect(page, SIGNAL(loadFinished(bool)), this, SLOT(scrap(bool)));
}

void Xkcd::next()
{
    if(comicId != latest)
    {
        comicId += 1;
        page->setUrl(QVariant(QString("http://xkcd.org/%1/").arg(comicId)).toUrl());
    }
    else
    {
        qDebug() << "Latest comic!";
    }
}

void Xkcd::prev()
{
    if(comicId != 1)
    {
        comicId -= 1;
        page->setUrl(QVariant(QString("http://xkcd.org/%1/").arg(comicId)).toUrl());
    }
    else
    {
        qDebug() << "First comic!";
    }
}

void Xkcd::random()
{
    qDebug() << "Random in C++ Class";
    quint16 randomId = qrand() % ((latest + 1) - 1) + 1;
    page->setUrl(QString("http://xkcd.org/%1/").arg(randomId));
}

void Xkcd::scrap(bool error)
{
    if(error)
    {
        QWebElementCollection images = page->page()->mainFrame()->findAllElements("img");
        QWebElement comicImage = images.at(2);
        comicUrl = comicImage.attribute("src").toAscii();
        altText = comicImage.attribute("title");
        qDebug() << comicUrl;
        qDebug() << altText;
        emit comicUrlChanged();
        if (!latestSet)
        {
            latest = page->page()->mainFrame()->findFirstElement("h3").toPlainText().split("/").at(3).toInt();
            comicId = latest;
            latestSet = 1;
            qDebug() << latest;
            emit enableButtons();
        }
        emit loadComplete();
    }
    else
    {
        qDebug() << "error";
        emit loadFailed();
    }
}

QString Xkcd::getAltText()
{
    return altText;
}

void Xkcd::emitLoadStarting()
{
    emit loadStarting();
}

QString Xkcd::getComicUrl()
{
    return comicUrl;
}

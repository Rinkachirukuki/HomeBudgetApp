#include "blobimage.h"

BlobImage::BlobImage(QQuickPaintedItem *parent)
    : QQuickPaintedItem{parent}
{

}

void BlobImage::setImage(const QImage &image){
    m_image = image;
    emit imageChanged();
    update();
    setImplicitHeight(image.height());
    setImplicitWidth(image.width());
}

void BlobImage::paint(QPainter *painter){

    m_image = m_image.scaled(widthRescale, heightRescale, Qt::KeepAspectRatio);
    if(m_image.isNull()) return;
    painter->drawImage(0,0,m_image);
}

int BlobImage::getWidthRescale() const
{
    return widthRescale;
}

void BlobImage::setWidthRescale(int newWidthRescale)
{
    if (widthRescale == newWidthRescale)
        return;
    widthRescale = newWidthRescale;
    emit widthRescaleChanged();
}

int BlobImage::getHeightRescale() const
{
    return heightRescale;
}

void BlobImage::setHeightRescale(int newHeightRescale)
{
    if (heightRescale == newHeightRescale)
        return;
    heightRescale = newHeightRescale;
    emit heightRescaleChanged();
}

#ifndef BLOBIMAGE_H
#define BLOBIMAGE_H


#include <QObject>
#include <QPainter>
#include <QQuickPaintedItem>

class BlobImage : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QImage image READ image WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(int widthRescale READ getWidthRescale WRITE setWidthRescale NOTIFY widthRescaleChanged)
    Q_PROPERTY(int heightRescale READ getHeightRescale WRITE setHeightRescale NOTIFY heightRescaleChanged)
public:
    explicit BlobImage(QQuickPaintedItem *parent = nullptr);
    QImage image() const { return m_image;}
    void setImage(const QImage& image);
    void paint(QPainter *painter);
    int getWidthRescale() const;
    void setWidthRescale(int newWidthRescale);
    int getHeightRescale() const;
    void setHeightRescale(int newHeightRescale);

private:
    QImage m_image;
    int widthRescale = 75;
    int heightRescale = 75;

signals:
    void imageChanged();
    void widthRescaleChanged();
    void heightRescaleChanged();
};

#endif // BLOBIMAGE_H



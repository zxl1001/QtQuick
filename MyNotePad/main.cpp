#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("MyNotePad");
    QGuiApplication::setOrganizationName("QtProject");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty())
    {
        settings.setValue("style", style);
    }
    else
    {
        QQuickStyle::setStyle(settings.value("style").toString());
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());
    engine.load(QUrl("../qml/FrameWork.qml"));
    if (engine.rootObjects().isEmpty())
    {
        return -1;
    }

    return app.exec();
}

#include <QFile>

int main()
{
    if (QFile::exists("/tmp/a"))
        QFile::rename("/tmp/a", "/tmp/b");
    else
        QFile::rename("/tmp/b", "/tmp/a");
    return 0;
}

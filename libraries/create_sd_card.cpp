#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    ofstream file;
    short number = 12;

    file.open("sd_datafile", ios::out | ios::binary);

    for (int i = 0; i < 134217728; ++i)
    {
        file.write( (char *) &number, sizeof(number) );
    }

    return 0;
}
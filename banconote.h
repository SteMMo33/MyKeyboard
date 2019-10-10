#ifndef BANCONOTE_H
#define BANCONOTE_H


#define MAX_BANCONOTE   3


class Banconote
{
public:
    Banconote();
    int update(int, int);
    void reset();
    float val();


private:
    int banconota[MAX_BANCONOTE];
    int valore[MAX_BANCONOTE] = { 5, 10, 20 };
};

#endif // BANCONOTE_H

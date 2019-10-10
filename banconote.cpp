#include "banconote.h"


Banconote::Banconote()
{
    for (int i=0; i<MAX_BANCONOTE; i++)
        banconota[i] = 0;

    valore[0] = 5;
    valore[1] = 10;
    valore[2] = 20;
}

int Banconote::update(int index, int numero)
{
    banconota[index] = numero;
    return banconota[index]*valore[index];
}

float Banconote::val()
{
    int ret = 0;
    for (int i=0; i<MAX_BANCONOTE; i++)
        ret += banconota[i]*valore[i];
    return ret;
}


void Banconote::reset()
{
    for (int i=0; i<MAX_BANCONOTE; i++)
        banconota[i] = 0;
}

#!/bin/bash

tablero=(['0']=(['0']=' ' ['1']=' ' ['2']=' ') ['1']=(['0']=' ' ['1']=' ' ['2']=' ') ['2']=(['0']=' ' ['1']=' ' ['2']=' '))

echo "  1 2 3"
echo "a ${tablero[0][0]}|${tablero[0][1]}|${tablero[0][2]}"
echo "  -----"
echo "b ${tablero[1][0]}|${tablero[1][1]}|${tablero[1][2]}"
echo "  -----"
echo "c ${tablero[2][0]}|${tablero[2][1]}|${tablero[2][2]}"
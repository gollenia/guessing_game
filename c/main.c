#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "game.c"

int main() {

	char playAgain = 'y';

	while (playAgain == 'y') {
		
		printf("Welcome to the guessing game!\n");
		printf("I have a number between 1 and 100.\n");
		printf("Can you guess it?\n");

		game();

		printf("Do you want to play again? (y/n): ");
		scanf(" %c", &playAgain);
	}

	return 0;

 } 

 

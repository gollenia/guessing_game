int isNumber(const char *str) {
    while (*str) {
        if (!isdigit(*str)) return 0;
        str++;
    }
    return 1;
}

int game() {
	int secretNumber;
	char input[10];
	int guess = 0;
	int guessCount = 0;
	secretNumber = 1 + rand() % 100;
	guessCount = 0;
 	
	while (guess != secretNumber) {
 		guessCount++;
 		printf("Enter your guess: ");
 		scanf("%s", input);

		if (input[0] == 'q') { return 0; }

		if (!isNumber(input)) {
			printf("Invalid input! Enter a number or 'q'.\n");
			continue;
		}

		guess = atoi(input);
 	
		if (guess < secretNumber) {
			printf("Too low! Try again.\n");
		} 
		
		if (guess > secretNumber) {
			printf("Too high! Try again.\n");
		} 
 	}

	 printf("Congratulations! You guessed the number in %d tries.\n", guessCount);
	 return 0;
}

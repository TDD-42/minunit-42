################  COLORS	##################
L_RED			=			'\033[0;31m'
L_REDB			=			'\033[1;31m'
L_WHITE			=			'\033[0;37m'
L_WHITEB		=			'\033[1;37m'
L_YELLOW		=			'\033[0;33m'
L_YELLOWB		=			'\033[1;33m'
L_GREEN			=			'\033[0;32m'
L_GREENB		=			'\033[1;32m'
################ CONFIG		##################
DIR 			= 			../
LIB 			= 			libft.a
# Local do .c
SRCS 			= 			$(wildcard ./test/*.c)
HEADERS 		= 			minunit.h test.h
FLAGS 			= 			-Wall -Werror -Wextra
################ RULES		##################

all: 		$(SRCS:.c=.o)

%.o: 		%.c $(HEADERS) 
	@cd 		$(DIR) && $(MAKE)
	@cc 		-o $@ -c $< $(FLAGS)
	@gcc		$(FLAGS) $@ -I $(DIR) -L $(DIR) -lft
	@echo		"$(L_YELLOWB)"RUN TEST: $@ "$(L_WHITE)"
	@./a.out
	@sleep .5

norm:
	@cd 		$(DIR) && $(MAKE) $@

cleann:
	@rm 		-f tests_libft.o
	@rm			-f $(SRCS:.c=.o)
	

clean:		cleann
	@cd 		$(DIR) && $(MAKE) $@


fclean: 	cleann
	@rm 		-f run.exec
	@cd 		$(DIR) && $(MAKE) $@

re: fclean all

## Exemplo de test unico de função
ft_atoi:
	@cd 		$(DIR) && $(MAKE)
	@cc 		-o ./test/ft_atoi_test.o -c ./test/ft_atoi_test.c $(FLAGS)
	@gcc		$(FLAGS) ./test/ft_atoi_test.o -I $(DIR) -L $(DIR) -lft
	@echo		"$(L_YELLOWB)"RUN TEST: FT_ATOI "$(L_WHITE)"
	@./a.out
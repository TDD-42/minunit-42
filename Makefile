################  COLORS	##################
L_RED			=			\033[0;31m
L_REDB			=			\033[1;31m
L_WHITE			=			\033[0;37m
L_WHITEB		=			\033[1;37m
L_YELLOW		=			\033[0;33m
L_YELLOWB		=			\033[1;33m
L_GREEN			=			\033[0;32m
L_GREENB		=			\033[1;32m
################ CONFIG		##################
DIR_OUTS		=			./outs/
SRCS 			= 			$(wildcard ./*.c)
RUN				=			$(addprefix $(DIR_OUTS), $(srcs));
HEADERS_TEST 	= 			minunit.h
FLAGS 			= 			-Wall -Werror -Wextra
################ RULES		##################

all: 		$(SRCS:.c=.o) $(RUN) clean_outs

%.o: 		%.c $(HEADERS)
	@echo  "$(L_YELLOWB)[COMPILE $@]$(L_WHITE)"

$(RUN):
	@echo  "$(L_YELLOWB)[TEST $@]$(L_WHITE)"
	@$@
	@echo  "$(L_WHITEB)"*******************************************************************"$(L_WHITEB)"

norm:
	@cd 		$(DIR) && $(MAKE) $@

clean_outs:
	@rm 		-f $(DIR_OUTS)

cleant:
	@rm			-f $(SRCS:.c=.o)
	
clean:		cleant
	@cd 		$(DIR) && $(MAKE) $@

fclean: 	cleant
	@rm 		-f run.exec
	@cd 		$(DIR) && $(MAKE) $@

re: fclean clean clean_outs cleant all
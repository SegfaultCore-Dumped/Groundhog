##
## EPITECH PROJECT, 2020
## groundhog
## File description:
## Makefile
##

all:
	@cp groundhog.py groundhog
	@chmod +x groundhog

clean:

fclean:	clean
	@rm groundhog

re: fclean all

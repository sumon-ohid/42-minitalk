# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/16 20:34:16 by sumon             #+#    #+#              #
#    Updated: 2023/11/29 14:06:46 by msumon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAMEC		= client
NAMES		= server
SRCS		= ./srcs/server.c
SRCC		= ./srcs/client.c
OBJS		= ./srcs/server.o
OBJC		= ./srcs/client.o
CC			= cc
CFLAGS		= -Wall -Werror -Wextra
LIBFT		= ./libft/
GNL			= ./libft/get_next_line/
FTPRINTF	= ./libft/ft_printf/

GREEN		= $(shell tput -Txterm setaf 2)
BLUE		= $(shell tput -Txterm setaf 4)

all: libft gnl ftprintf compile

libft:
	@echo ${Q}${NL}${GREEN}======== libft ========${NC}${Q}
	@$(MAKE) -C $(LIBFT) all

gnl:
	@echo ${Q}${NL}${GREEN}======== get_next_line ========${NC}${Q}
	@$(MAKE) -C $(GNL) all

ftprintf:
	@echo ${Q}${NL}${GREEN}======== ft_printf ========${NC}${Q}
	@$(MAKE) -C $(FTPRINTF) all

%.o : %.c
	@$(CC) $(CFLAGS) -c $< -o $@

compile: $(NAMES) $(NAMEC)

$(NAMES): libft gnl ftprintf $(OBJS)
	@echo ${Q}${NL}${GREEN}======== Server Compiled! ========${NC}${Q}
	$(CC) $(CFLAGS) $(SRCS) $(LIBFT)libft.a $(GNL)gnl.a $(FTPRINTF)libftprintf.a -o $(NAMES)

$(NAMEC): libft gnl ftprintf $(OBJC)
	@echo ${Q}${NL}${GREEN}======== Client Compiled! ========${NC}${Q}
	$(CC) $(CFLAGS) $(SRCC) $(LIBFT)libft.a $(GNL)gnl.a $(FTPRINTF)libftprintf.a -o $(NAMEC)

clean:
	@$(MAKE) -C $(LIBFT) clean
	@$(MAKE) -C $(FTPRINTF) clean
	@$(MAKE) -C $(GNL) clean
	@rm -f $(OBJC)
	@rm -f $(OBJS)
	@echo ${Q}${NC}${BLUE}======== Cleaned! ========${NC}${Q}

fclean: clean
	@$(MAKE) -C $(LIBFT) fclean
	@$(MAKE) -C $(FTPRINTF) fclean
	@$(MAKE) -C $(GNL) fclean
	@rm -f $(NAMES)
	@rm -f $(NAMEC)
	@echo ${Q}${NC}${BLUE}======== Super Cleaned! ========${NC}${Q}

re: fclean all

.PHONY: all libft gnl ftprintf compile clean fclean re
.SILENT:
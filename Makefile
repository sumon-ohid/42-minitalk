# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/16 20:34:16 by sumon             #+#    #+#              #
#    Updated: 2023/11/28 14:51:56 by msumon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAMEC		= client
NAMES		= server
OBJS		= ./srcs/server.c
OBJC		= ./srcs/client.c
CC			= cc
CFLAGS		= -Wall -Werror -Wextra
LIBFT		= ./libft/
GNL			= ./libft/get_next_line/
FTPRINTF	= ./libft/ft_printf/
HEADERS		= -I libft -I get_next_line -I ft_printf -I includes

# Color codes
GREEN		= $(shell tput -Txterm setaf 2)
BLUE		= $(shell tput -Txterm setaf 4)
PURPLE		= $(shell tput -Txterm setaf 5)

all: libft gnl ftprintf server client compile

libft:
	@echo ${Q}${NL}${GREEN}======== libft ========${NC}${Q}
	@$(MAKE) -C $(LIBFT) all

gnl:
	@echo ${Q}${NL}${GREEN}======== get_next_line ========${NC}${Q}
	@$(MAKE) -C $(GNL) all

ftprintf:
	@echo ${Q}${NL}${GREEN}======== ft_printf ========${NC}${Q}
	@$(MAKE) -C $(FTPRINTF) all

server:
	@echo ${Q}${NL}${GREEN}======== Server ========${NC}${Q}
	$(CC) $(CFLAGS) $(OBJS) -o $(NAMES)

client:
	@echo ${Q}${NL}${GREEN}======== Client ========${NC}${Q}
	$(CC) $(CFLAGS) $(OBJC) -o $(NAMEC)

%.o : %.c
	@$(CC) $(CFLAGS) -c $< -o $@

compile: $(NAMES) $(NAMEC)

$(NAMES): libft gnl ftprintf
	@echo ${Q}${NL}${BLUE}======== Server Compiled! ========${NC}${Q}
	$(CC) $(CFLAGS) $(OBJS) $(HEADERS) $(LIBFT)libft.a $(GNL)gnl.a $(FTPRINTF)libftprintf.a -o $(NAMES)

$(NAMEC): libft gnl ftprintf
	@echo ${Q}${NL}${BLUE}======== Client Compiled! ========${NC}${Q}
	$(CC) $(CFLAGS) $(OBJC) $(HEADERS) $(LIBFT)libft.a $(GNL)gnl.a $(FTPRINTF)libftprintf.a -o $(NAMEC)

clean:
	@$(MAKE) -C $(LIBFT) clean
	@$(MAKE) -C $(FTPRINTF) clean
	@$(MAKE) -C $(GNL) clean
	@rm -f $(NAMES)
	@rm -f $(NAMEC)
	@echo ${Q}${NC}${BLUE}======== Cleaned! ========${NC}${Q}

fclean: clean
	@$(MAKE) -C $(LIBFT) fclean
	@$(MAKE) -C $(FTPRINTF) fclean
	@$(MAKE) -C $(GNL) fclean
	@rm -f $(NAMES)
	@rm -f $(NAMEC)
	@echo ${Q}${NC}${BLUE}======== Super Cleaned! ========${NC}${Q}

re: fclean all

.PHONY: all server client libft gnl ftprintf compile clean fclean re

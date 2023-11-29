/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/28 14:05:07 by msumon            #+#    #+#             */
/*   Updated: 2023/11/29 11:39:14 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

void	welcome_text(void)
{
	ft_printf("\n");
	ft_printf("░█──░█ █▀▀ █── █▀▀ █▀▀█ █▀▄▀█ █▀▀\n");
	ft_printf("░█░█░█ █▀▀ █── █── █──█ █─▀─█ █▀▀\n");
	ft_printf("░█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀───▀ ▀▀▀ \n");
	ft_printf("	▀▀█▀▀ █▀▀█\n");
	ft_printf("	──█── █──█\n");
	ft_printf("	──▀── ▀▀▀▀\n");
	ft_printf("█▀▄▀█ █ █▄░█ █ ▀█▀ ▄▀█ █░░ █▄▀\n");
	ft_printf("█░▀░█ █ █░▀█ █ ░█░ █▀█ █▄▄ █░█\n");
}

void	ft_btoa(int sig)
{
	static int	bit;
	static int	i;
	char		c;

	if (sig == SIGUSR1)
		i |= (1 << bit);
	bit++;
	if (bit == 8)
	{
		c = i;
		ft_printf("%c", i);
		bit = 0;
		i = 0;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	(void)argv;
	if (argc != 1)
	{
		ft_printf("Error\nToo many arguments.\n");
		return (1);
	}
	pid = getpid();
	welcome_text();
	ft_printf("PID : %d\n", pid);
	while (argc == 1)
	{
		signal(SIGUSR1, ft_btoa);
		signal(SIGUSR2, ft_btoa);
		pause();
	}
	return (0);
}

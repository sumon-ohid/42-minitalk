/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/28 14:03:53 by msumon            #+#    #+#             */
/*   Updated: 2023/11/29 14:23:35 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

int	ft_atob(int pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((c & (1 << bit)))
		{
			if (kill(pid, SIGUSR1) == -1)
				return (0);
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
				return (0);
		}
		usleep(500);
		bit++;
	}
	return (1);
}

void	pid_check(char *str)
{
	int	j;

	j = 0;
	while (str[j] != '\0')
	{
		if (!ft_isdigit(str[j]))
		{
			error_msg("PID should only contain digits.\n");
		}
		j++;
	}
}

void	error_msg(char *str)
{
	ft_printf("Error!!\n%s", str);
	exit(1);
}

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	i = 0;
	if (argc == 3)
	{
		pid_check(argv[1]);
		pid = ft_atoi(argv[1]);
		while (argv[2][i] != '\0')
		{
			if (!ft_atob(pid, argv[2][i]))
				error_msg("Failed to send signal\n");
			i++;
		}
		if (!ft_atob(pid, '\n'))
			error_msg("Failed to send signal\n");
		ft_printf("Message sent successfully!\n");
	}
	else
	{
		error_msg("Need 2 arguments.\n");
		error_msg("HINT: ./client [PID] [Message]\n");
		return (1);
	}
	return (0);
}

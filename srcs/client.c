/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/28 14:03:53 by msumon            #+#    #+#             */
/*   Updated: 2023/11/29 12:01:09 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

void	ft_atob(int pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((c & (1 << bit)))
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(500);
		bit++;
	}
}

void	pid_check(char *str)
{
	int	j;

	j = 0;
	while (str[j] != '\0')
	{
		if (!ft_isdigit(str[j]))
		{
			printf("Error!!\nPID should only contain digits.\n");
			return ;
		}
		j++;
	}
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
			ft_atob(pid, argv[2][i]);
			i++;
		}
		ft_atob(pid, '\n');
	}
	else
	{
		ft_printf("Error!!\nNeed 2 arguments.\n");
		ft_printf("HINT: ./client [PID] [Message]\n");
		return (1);
	}
	return (0);
}

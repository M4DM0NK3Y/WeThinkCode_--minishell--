/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   min_cmd_setenv.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cterblan <cterblan@student.wethinkcode>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/09/16 10:06:05 by cterblan          #+#    #+#             */
/*   Updated: 2018/09/16 13:00:59 by cterblan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int		min_cmd_setenv(int ac, char **av, char **env)
{
	int		i;
	char	*tmp;
	char	*var;
	char	**fre;

	i = 1;
	if (ac <= 1)
		ft_printf("\e[91mUsage:\n\tsetenv [VARIABLE] [VALUE]\e[96m\n");
	else if (ac > 1)
	{
		var = min_env_get_var(av[0]);
		tmp = var;
		if (min_env_check_var(env, var))
			min_env_set_val(env, var, av[1]);
		else
		{
			fre = env;
			env = min_env_add_var(env, var);
			min_env_set_val(env, var, av[1]);
			free(fre);
		}
		free(tmp);
	}
	return (0);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   min_welcome.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cterblan <cterblan@student.wethinkcode>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/09/15 10:56:38 by cterblan          #+#    #+#             */
/*   Updated: 2018/09/17 07:24:59 by cterblan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int		min_welcome(void)
{
	ft_printf("\033[32m\n");
	ft_printf("************************************************************\n");
	ft_printf("*            Welcome To Minishell by:cterblan              *\n");
	ft_printf("************************************************************\n");
	min_cmd_help();
	ft_printf("\n\e[0m");
	return (0);
}

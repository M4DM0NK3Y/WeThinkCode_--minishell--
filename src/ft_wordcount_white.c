/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_wordcount_white.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cterblan <cterblan@student.wethinkcode>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/06/08 13:07:50 by cterblan          #+#    #+#             */
/*   Updated: 2018/09/19 10:39:23 by cterblan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int		ft_wordcount_white(const char *s)
{
	unsigned int	words;
	unsigned int	i;

	words = 0;
	i = 0;
	if (!s)
		return (0);
	if (!(ft_isspace(s[i])))
		words++;
	while (s[i] != '\0')
	{
		if (ft_isspace(s[i]))
		{
			while (ft_isspace(s[i]))
				i++;
			if ((!ft_isspace(s[i])) && (s[i] != '\0'))
				words++;
		}
		i++;
	}
	return (words);
}

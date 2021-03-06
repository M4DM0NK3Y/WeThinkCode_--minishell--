# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cterblan <cterblan@student.wethinkcode>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/07 10:04:12 by cterblan          #+#    #+#              #
#    Updated: 2018/09/20 08:16:10 by cterblan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#								NAME
################################################################################
AUTHOR := cterblan
#AUTHOR NAME^^^

NAME := minishell
#PROJECT OUTPUT FILE NAME ^^^
################################################################################
#								DIRECTORIES
################################################################################
INC_DIR := inc
#INCLUDES DIRECTORY ^^^
SRC_DIR := src
#SOURCES DIRECTORY ^^^
OBJ_DIR := obj
#OBJECTS DIRECTORY ^^^
LIB_DIR := lib
#LIBRARY DIRECTORY ^^^
################################################################################
#								FILES
################################################################################
#SRC:= ft_function.c
SRC :=	ft_free2d_char.c\
		ft_isdir.c\
		ft_sizeof2d_char.c\
		ft_strsplit_white.c\
		ft_wordcount_white.c\
		get_next_line.c\
		min_cmd_builtin.c\
		min_cmd_cd.c\
		min_cmd_echo.c\
		min_cmd_env.c\
		min_cmd_exe_select.c\
		min_cmd_exe.c\
		min_cmd_exit.c\
		min_cmd_get.c\
		min_cmd_help.c\
		min_cmd_path_exe.c\
		min_cmd_pwd.c\
		min_cmd_setenv.c\
		min_cmd_unsetenv.c\
		min_env_add_var.c\
		min_env_check_var.c\
		min_env_get_val.c\
		min_env_get_var.c\
		min_env_get.c\
		min_env_set_path.c\
		min_env_set_val.c\
		min_env_unset.c\
		min_main.c\
		min_shell_path.c\
		min_shell_var.c\
		min_sys_scan_dir.c\
		min_sys_scan_path.c\
		min_sys_set_path.c\
		min_welcome.c\
#ADD SOURCE FILES HERE ^^^
OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:%.c=%.o))
################################################################################
#								LIBRARIES
################################################################################
#NAME_DIR := $(LIBDIR)/{library}
PRINTF_DIR := $(LIB_DIR)/ft_printf
#ADD ADDITIONAL LIBRARIES HERE ^^^
LIB_FLAG := -lftprintf
################################################################################
#								COMPILER
################################################################################
CFLAGS := -Wall -Werror -Wextra -g
#ADD ADDITIONAL FLAGS HERE ^^^
CC := gcc $(CFLAGS)
################################################################################
#								RULES
################################################################################

all: $(NAME)

$(NAME): $(OBJ)
	@make all -C $(PRINTF_DIR)/
	@echo "\033[35m\t\t[COMPILING] $@\033"
	@$(CC) -o $@ $(OBJ) -I $(INC_DIR) -L $(PRINTF_DIR)/ $(LIB_FLAG)
	@#COMPILE EXECUTABLE ^^^^^
	@#ar rcs $(NAME).a $(OBJ) $(PRINTF_DIR)/obj/*.o
	@#COMPILE LIBRARY ^^^^^^^
	@echo "\033[32m\t\t[COMPILED SUCCESSFULLY]\033"
	@#DON'T TOUCH ^^^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "\033[36m\t\t[Building]\033[0m $@"
	@mkdir -p $(OBJ_DIR)
	@$(CC) -I $(INC_DIR) -o $@ -c $<
	@echo "\033[33m\t\t[SUCCESS]\033[0m"
	@#DON'T TOUCH ^^^

clean: cleanlib
	@echo "\033[33m\t\t[FT_LS]\033[0m"
	@echo "\033[31m\t\t[CLEANING]\t$(OBJ_DIR)\033[0m"
	@rm -rf $(OBJ_DIR)
	@#DON'T TOUCH ^^^

cleanlib:
	@echo "\033[31m\t\t[CLEANING]\t$(LIB_DIR)\033[0m"
	@make clean -C $(PRINTF_DIR)
	@#ADD ADDITIONAL LIBRARIES HERE ^^^

fclean: clean fcleanlib
	@echo "\033[33m\t\t[FT_LS]\033[0m"
	@echo "\033[31m\t\t[FCLEAN]\t$(NAME)\033[0m"
	@rm -f $(NAME)
	@#ADD ADDITIONAL NAME FILES HERE ^^^

fcleanlib:
	@echo "\033[31m\t\t[FCLEAN]\t$(LIB_DIR)\033[0m"
	@make fclean -C $(PRINTF_DIR)
	@#ADD ADDITIONAL LIBRARIES HERE ^^^

re: fclean all

workspace:
	@echo "\033[36m\t\t[Building $@]\033[0m"
	@mkdir -p $(INC_DIR)
	@mkdir -p $(SRC_DIR)
	@mkdir -p $(LIB_DIR)
	@touch author
	@echo $(AUTHOR) > author
################################################################################
#								SPECIAL
################################################################################

.PHONEY := all clean fclean re workspace
#ADD PHONEY HERE ^^^

.SILENT:
#DON'T TOUCH ^^^

.PRECIOUS := author
#ADD PRECIOUS HERE ^^^

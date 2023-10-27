
from enum import Enum
from functools import partial


class Color(Enum):

    RESET = "\033[0m"  # Text Reset

    # Regular Colors
    BLACK = "\033[0;30m";   # BLACK
    RED = "\033[0;31m";     # RED
    GREEN = "\033[0;32m";   # GREEN
    YELLOW = "\033[0;33m"  # YELLOW
    BLUE = "\033[0;34m";    # BLUE
    PURPLE = "\033[0;35m"  # PURPLE
    CYAN = "\033[0;36m";    # CYAN
    WHITE = "\033[0;37m";   # WHITE

    # Bold
    BLACK_BOLD = "\033[1;30m"  # BLACK
    RED_BOLD = "\033[1;31m";    # RED
    GREEN_BOLD = "\033[1;32m"  # GREEN
    YELLOW_BOLD = "\033[1;33m"; # YELLOW
    BLUE_BOLD = "\033[1;34m";   # BLUE
    PURPLE_BOLD = "\033[1;35m"; # PURPLE
    CYAN_BOLD = "\033[1;36m";   # CYAN
    WHITE_BOLD = "\033[1;37m"  # WHITE

    # Underline
    BLACK_UNDERLINED = "\033[4;30m"  # BLACK
    RED_UNDERLINED = "\033[4;31m";    # RED
    GREEN_UNDERLINED = "\033[4;32m"  # GREEN
    YELLOW_UNDERLINED = "\033[4;33m"; # YELLOW
    BLUE_UNDERLINED = "\033[4;34m";   # BLUE
    PURPLE_UNDERLINED = "\033[4;35m"; # PURPLE
    CYAN_UNDERLINED = "\033[4;36m";   # CYAN
    WHITE_UNDERLINED = "\033[4;37m"  # WHITE

    # Background
    BLACK_BACKGROUND = "\033[40m"  # BLACK
    RED_BACKGROUND = "\033[41m";    # RED
    GREEN_BACKGROUND = "\033[42m"  # GREEN
    YELLOW_BACKGROUND = "\033[43m"; # YELLOW
    BLUE_BACKGROUND = "\033[44m";   # BLUE
    PURPLE_BACKGROUND = "\033[45m"; # PURPLE
    CYAN_BACKGROUND = "\033[46m";   # CYAN
    WHITE_BACKGROUND = "\033[47m"  # WHITE

    # High Intensity
    BLACK_BRIGHT = "\033[0;90m"  # BLACK
    RED_BRIGHT = "\033[0;91m";    # RED
    GREEN_BRIGHT = "\033[0;92m"  # GREEN
    YELLOW_BRIGHT = "\033[0;93m"; # YELLOW
    BLUE_BRIGHT = "\033[0;94m";   # BLUE
    PURPLE_BRIGHT = "\033[0;95m"; # PURPLE
    CYAN_BRIGHT = "\033[0;96m";   # CYAN
    WHITE_BRIGHT = "\033[0;97m"  # WHITE

    # Bold High Intensity
    BLACK_BOLD_BRIGHT = "\033[1;90m"; # BLACK
    RED_BOLD_BRIGHT = "\033[1;91m";   # RED
    GREEN_BOLD_BRIGHT = "\033[1;92m"; # GREEN
    YELLOW_BOLD_BRIGHT = "\033[1;93m";# YELLOW
    BLUE_BOLD_BRIGHT = "\033[1;94m"  # BLUE
    PURPLE_BOLD_BRIGHT = "\033[1;95m";# PURPLE
    CYAN_BOLD_BRIGHT = "\033[1;96m"  # CYAN
    WHITE_BOLD_BRIGHT = "\033[1;97m"; # WHITE

    # High Intensity backgrounds
    BLACK_BACKGROUND_BRIGHT = "\033[0;100m";# BLACK
    RED_BACKGROUND_BRIGHT = "\033[0;101m";# RED
    GREEN_BACKGROUND_BRIGHT = "\033[0;102m";# GREEN
    YELLOW_BACKGROUND_BRIGHT = "\033[0;103m";# YELLOW
    BLUE_BACKGROUND_BRIGHT = "\033[0;104m";# BLUE
    PURPLE_BACKGROUND_BRIGHT = "\033[0;105m"; # PURPLE
    CYAN_BACKGROUND_BRIGHT = "\033[0;106m"  # CYAN
    WHITE_BACKGROUND_BRIGHT = "\033[0;107m";   # WHITE

    # RESET = "\u001B[0m";
    # BLACK = "\u001B[30m";
    # RED = "\u001B[31m";
    # GREEN = "\u001B[32m";
    # YELLOW = "\u001B[33m";
    # BLUE = "\u001B[34m";
    # PURPLE = "\u001B[35m";
    # CYAN = "\u001B[36m";
    # WHITE = "\u001B[37m";

    # BLACK_BG = "\u001B[40m";
    # RED_BG = "\u001B[41m";
    # GREEN_BG = "\u001B[42m";
    # YELLOW_BG = "\u001B[43m";
    # BLUE_BG = "\u001B[44m";
    # PURPLE_BG = "\u001B[45m";
    # CYAN_BG = "\u001B[46m";
    # WHITE_BG = "\u001B[47m";

#     GRAY = "\x1b[38;20m"
#     YELLOW = "\x1b[33;20m"
#     CYAN = "\x1b[36;20m"
#     RED = "\x1b[31;20m"  "\u001B[31m"  
#     RED_BOLD = "\x1b[31;1m"  "\033[1;31m"  "\033[4;31m"
#     RESET = "\x1b[0m"  # "\033[0;0m"

# ANSI_RESET = "\u001B[0m";
# ANSI_BLACK = "\u001B[30m";
# ANSI_RED = "\u001B[31m";
# ANSI_GREEN = "\u001B[32m";
# ANSI_YELLOW = "\u001B[33m";
# ANSI_BLUE = "\u001B[34m";
# ANSI_PURPLE = "\u001B[35m";
# ANSI_CYAN = "\u001B[36m";
# ANSI_WHITE = "\u001B[37m";

# ANSI_BLACK_BACKGROUND = "\u001B[40m";
# ANSI_RED_BACKGROUND = "\u001B[41m";
# ANSI_GREEN_BACKGROUND = "\u001B[42m";
# ANSI_YELLOW_BACKGROUND = "\u001B[43m";
# ANSI_BLUE_BACKGROUND = "\u001B[44m";
# ANSI_PURPLE_BACKGROUND = "\u001B[45m";
# ANSI_CYAN_BACKGROUND = "\u001B[46m";
# ANSI_WHITE_BACKGROUND = "\u001B[47m";

# RESET = "\033[0m"  # Text Reset

# # Regular Colors
# BLACK = "\033[0;30m";   # BLACK
# RED = "\033[0;31m";     # RED
# GREEN = "\033[0;32m";   # GREEN
# YELLOW = "\033[0;33m"  # YELLOW
# BLUE = "\033[0;34m";    # BLUE
# PURPLE = "\033[0;35m"  # PURPLE
# CYAN = "\033[0;36m";    # CYAN
# WHITE = "\033[0;37m";   # WHITE

# # Bold
# BLACK_BOLD = "\033[1;30m"  # BLACK
# RED_BOLD = "\033[1;31m";    # RED
# GREEN_BOLD = "\033[1;32m"  # GREEN
# YELLOW_BOLD = "\033[1;33m"; # YELLOW
# BLUE_BOLD = "\033[1;34m";   # BLUE
# PURPLE_BOLD = "\033[1;35m"; # PURPLE
# CYAN_BOLD = "\033[1;36m";   # CYAN
# WHITE_BOLD = "\033[1;37m"  # WHITE

# # Underline
# BLACK_UNDERLINED = "\033[4;30m"  # BLACK
# RED_UNDERLINED = "\033[4;31m";    # RED
# GREEN_UNDERLINED = "\033[4;32m"  # GREEN
# YELLOW_UNDERLINED = "\033[4;33m"; # YELLOW
# BLUE_UNDERLINED = "\033[4;34m";   # BLUE
# PURPLE_UNDERLINED = "\033[4;35m"; # PURPLE
# CYAN_UNDERLINED = "\033[4;36m";   # CYAN
# WHITE_UNDERLINED = "\033[4;37m"  # WHITE

# # Background
# BLACK_BACKGROUND = "\033[40m"  # BLACK
# RED_BACKGROUND = "\033[41m";    # RED
# GREEN_BACKGROUND = "\033[42m"  # GREEN
# YELLOW_BACKGROUND = "\033[43m"; # YELLOW
# BLUE_BACKGROUND = "\033[44m";   # BLUE
# PURPLE_BACKGROUND = "\033[45m"; # PURPLE
# CYAN_BACKGROUND = "\033[46m";   # CYAN
# WHITE_BACKGROUND = "\033[47m"  # WHITE

# # High Intensity
# BLACK_BRIGHT = "\033[0;90m"  # BLACK
# RED_BRIGHT = "\033[0;91m";    # RED
# GREEN_BRIGHT = "\033[0;92m"  # GREEN
# YELLOW_BRIGHT = "\033[0;93m"; # YELLOW
# BLUE_BRIGHT = "\033[0;94m";   # BLUE
# PURPLE_BRIGHT = "\033[0;95m"; # PURPLE
# CYAN_BRIGHT = "\033[0;96m";   # CYAN
# WHITE_BRIGHT = "\033[0;97m"  # WHITE

# # Bold High Intensity
# BLACK_BOLD_BRIGHT = "\033[1;90m"; # BLACK
# RED_BOLD_BRIGHT = "\033[1;91m";   # RED
# GREEN_BOLD_BRIGHT = "\033[1;92m"; # GREEN
# YELLOW_BOLD_BRIGHT = "\033[1;93m";# YELLOW
# BLUE_BOLD_BRIGHT = "\033[1;94m"  # BLUE
# PURPLE_BOLD_BRIGHT = "\033[1;95m";# PURPLE
# CYAN_BOLD_BRIGHT = "\033[1;96m"  # CYAN
# WHITE_BOLD_BRIGHT = "\033[1;97m"; # WHITE

# # High Intensity backgrounds
# BLACK_BACKGROUND_BRIGHT = "\033[0;100m";# BLACK
# RED_BACKGROUND_BRIGHT = "\033[0;101m";# RED
# GREEN_BACKGROUND_BRIGHT = "\033[0;102m";# GREEN
# YELLOW_BACKGROUND_BRIGHT = "\033[0;103m";# YELLOW
# BLUE_BACKGROUND_BRIGHT = "\033[0;104m";# BLUE
# PURPLE_BACKGROUND_BRIGHT = "\033[0;105m"; # PURPLE
# CYAN_BACKGROUND_BRIGHT = "\033[0;106m"  # CYAN
# WHITE_BACKGROUND_BRIGHT = "\033[0;107m";   # WHITE



def colored_formatter(text: str, color: Color):
    return f"{color.value}{text}{Color.RESET.value}"

gray = partial(colored_formatter, color=Color.GRAY)
yellow = partial(colored_formatter, color=Color.YELLOW)
cyan = partial(colored_formatter, color=Color.CYAN)
green = partial(colored_formatter, color=Color.GREEN)
green_bright = partial(colored_formatter, color=Color.GREEN_BRIGHT)
red = partial(colored_formatter, color=Color.RED)
red_bold = partial(colored_formatter, color=Color.RED_BOLD)


def mark(text: str):
    return f"{Color.CYAN.value}{Color.YELLOW_BACKGROUND_BRIGHT}{text}{Color.RESET.value}"


print(f"{cyan('Color')} is {green_bright('imported')}{red_bold('!')}")

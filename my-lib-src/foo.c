#define VALID 1
#define INVALID 0

enum PAREN_CLASS {
    UNDEFINED = 0,
    ROUND,
    SQUARE,
    CURLY,
};

/* returns true if all parentheses in the string are valid, returns false if not */
int CheckParen(const char *str)
{
    int roundparen_count = 0;
    int squareparen_count = 0;
    int squigglyparen_count = 0;
    enum PAREN_CLASS opening_paren = UNDEFINED;
    enum PAREN_CLASS closing_paren = UNDEFINED;

    /* null pointer exception */
    if (!str) {
        return INVALID;
    }

    while (*str) {
        switch (*str) {
        case '(':
            opening_paren = ROUND;
            roundparen_count++;
            break;
        case ')':
            closing_paren = ROUND;
            roundparen_count--;
            break;
        case '[':
            opening_paren = SQUARE;
            squareparen_count++;
            break;
        case ']':
            closing_paren = SQUARE;
            squareparen_count--;
            break;
        case '{':
            opening_paren = CURLY;
            squigglyparen_count++;
            break;
        case '}':
            closing_paren = CURLY;
            squigglyparen_count--;
            break;
        default:
            break;
        }

        /* if both opening and closing characters have been assigned */
        if ((opening_paren != UNDEFINED) && (closing_paren != UNDEFINED)) {
            if (opening_paren == closing_paren) {
                opening_paren = UNDEFINED;
                closing_paren = UNDEFINED;
            }
            else {
                return INVALID;
            }
        }

        str++;
    }

    /* all counters must equal zero at the end */
    if (!roundparen_count && !squareparen_count && !squigglyparen_count) {
        return VALID;
    }
    else {
        return INVALID;
    }
}

# 1) Fiind data o functie f , introdusa de utilizator, determinarea unei constante de
# normalizare k. In cazul in care o asemenea constanta nu exista, afisarea unui mesaj
# corespunzator catre utilizator.

find_normalizing_constant <- function(func) {
    tryCatch(
        {
            if (!is.function(func)) stop("Parameter func has to be a function.")
            # formula for normalizing constant
            integral <- integrate(func, lower = -Inf, upper = Inf)$value
            return(1 / integral)
        },
        error = function(e) {
            warning("Normalizing constant not found")
            warning(e$message)
            return(NULL)
        }
    )
}


# EX:
#  1 / sqrt(2 * pi)
# f <- function(x) {
#     exp((-x^2) / 2)
# }


# find_normalizing_constant(f)
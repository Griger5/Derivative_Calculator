# Derivative Calculator

### How to start
Download [SWI-Prolog](https://www.swi-prolog.org/) or simply open [SWISH](https://swish.swi-prolog.org/). Open this program, and in the query type
> main.


and press ctrl+enter.
The calculator understands trigonometric, cyclometric and hyperbolic functions as well as logarithms. It can also work out complicated composite derivatives. Unfortunately, the output isn't simplified. 
\
<sub>(automatic simplification may be added in the future)</sub>

### Guidelines
To ensure that the program understands your input function correctly, please follow these guidelines:
- Your only variable should be **x**
- Use __*__ for multiplication, **/** for division and **^** for powers
- _Always_ use __*__ with constant terms, write __3*x__ instead of 3x
- Use **tg(x)** and **ctg(x)** for tangent and cotangent (likewise with cyclometric and hyperbolic functions)
- Use **log(a, x)** for logarithm base a of x, you can also use **ln(x)** for natural logarithm
- When rising x or a function of x to a fractional power, use brackets, e.g. **x^(1/3)** instead of x^1/3
- Use brackets when dividing long formulas, __x/cos(x)*sin(x)__ is equal to __(x*sin(x))/cos(x)__, not __x/(sin(x)*cos(x))__
- Likewise, use brackets when rising something to a composite exponent, e.g. __2^(sin(x)*x)__ instead of 2^sin(x)*x 

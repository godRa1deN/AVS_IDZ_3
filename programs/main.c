#include <stdio.h>

double f(double x) {
    double t = 0.5;
    return x*x*x-t*x*x+0.2*x-4;
}

int main() {
    double left, right, c, e;
    left = 1.0, right = 3.0;
    scanf("%lf", &e);
    while (right - left > e){
        c = (left + right) / 2;
        if(f(right) * f(c) < 0)
            left = c;
        else
            right = c;
    }
    printf("%.8lf", (left + right) / 2);
    return 0;
}
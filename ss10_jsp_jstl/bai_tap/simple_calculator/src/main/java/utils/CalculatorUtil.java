package utils;

import java.io.InvalidObjectException;

public class CalculatorUtil {
    public static Double calculate(double num1, double num2, String operator) throws InvalidObjectException {
        Double result = null;
        switch (operator) {
            case "+":
                result = num1 + num2;
                break;
            case "-":
                result = num1 - num2;
                break;
            case "*":
                result = num1 * num2;
                break;
            case "/":
                if (num2 == 0) {
                    throw new ArithmeticException();
                }
                result = num1 / num2;
                break;
            default:
                throw new InvalidObjectException("");
        }
        return result;
    }
}

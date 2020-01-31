// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#include "ANSICBasics.h"

enum ConversionType {
    CelsiusToFahrenheit,
    FahrenheitToCelsius
};

typedef enum ConversionType ConversionType;

float ConvertTemperature(float temperature, ConversionType type);
void ShowConversion(float temperature, ConversionType type);

void RunANSICBasics02(void)
{
    printf("\n%s----------\n", __func__);
    ShowConversion(23.0, CelsiusToFahrenheit);
    ShowConversion(0.0, CelsiusToFahrenheit);
    ShowConversion(123.0, FahrenheitToCelsius);
    ShowConversion(-23.0, FahrenheitToCelsius);
}

float ConvertTemperature(float temperature, ConversionType type)
{
    return (type == CelsiusToFahrenheit ? temperature * F_SCALE / C_SCALE + F_FREEZING_POINT: (temperature - F_FREEZING_POINT) * C_SCALE / F_SCALE);
}

void ShowConversion(float temperature, ConversionType type)
{
    printf("%.1f %s is %.1f %s\n", temperature,
           (type == CelsiusToFahrenheit ? "℃" : "℉"),
           ConvertTemperature(temperature, type),
           (type == FahrenheitToCelsius ? "℃" : "℉"));
}

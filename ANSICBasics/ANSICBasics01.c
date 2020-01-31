// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#include "ANSICBasics.h"

float ConvertToFahrenheit(float celsiusTemperature);
void ShowFahrenheitConversion(float celsiusTemperature);

void RunANSICBasics01(void)
{
    printf("\n%s----------\n", __func__);
    ShowFahrenheitConversion(23.0);
    ShowFahrenheitConversion(0.0);
    ShowFahrenheitConversion(123.0);
    ShowFahrenheitConversion(-23.0);
    
}

float ConvertToFarenheit(float celsiusTemperature)
{
    return celsiusTemperature * (F_SCALE / C_SCALE) + F_FREEZING_POINT;
}

void ShowFahrenheitConversion(float celsiusTemperature)
{
    printf("%.1f ℃ is %.1f ℉\n", celsiusTemperature, ConvertToFarenheit(celsiusTemperature));
}


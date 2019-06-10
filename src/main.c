#include "stm32l4xx.h"

// GOAL: turn on red LED on PB2
int main(void) {
    // Enable GPIO port b
    SET_BIT(RCC->AHB2ENR, RCC_AHB2ENR_GPIOBEN);

    // Set B, 2 to output mode (b01)
    CLEAR_BIT(GPIOB->MODER, GPIO_MODER_MODE2_1);
    SET_BIT(GPIOB->MODER, GPIO_MODER_MODE2_0);

    // Turn set 2nd pin to on
    GPIOB->BSRR = GPIO_BSRR_BS2;

    while(1);

    return 0;
}

// to vendor
// startup
// system

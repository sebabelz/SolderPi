
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */

#include <iostream>
#include "SolderingIron.h"
#include "main.h"

SolderingIron solderingIron;

uint16_t setPoint = 350;

uint32_t pwmOutput = 0;

AD7995 adConverter;

#ifdef __cplusplus
extern "C" {
#endif

#include "ssd1306.h"
#include <cstdio>

void SystemClock_Config();
int __io_putchar(int ch);

#ifdef __cplusplus
}
#endif

/**
  * @brief  The application entry point.
  * @retval int
  */
int main()
{
    HAL_Init();

    SystemClock_Config();

    MX_GPIO_Init();
    MX_USART2_UART_Init();
    MX_I2C1_Init();
    MX_FMPI2C1_Init();
    MX_TIM3_Init();
    MX_TIM5_Init();
    MX_TIM7_Init();

    ssd1306_Init();
    HAL_TIM_Encoder_Start_IT(&htim3, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim5, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim5, TIM_CHANNEL_2);
    HAL_TIM_OC_Start_IT(&htim5, TIM_CHANNEL_3);

    HAL_TIM_Base_Start_IT(&htim7);

    solderingIron.configADConverter(&hfmpi2c1);
    solderingIron.setOutput(&pwmOutput);
    solderingIron.setSetPoint(setPoint);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma ide diagnostic ignored "EndlessLoop"
    while (true)
    {
        HAL_GPIO_TogglePin(LD2_GPIO_Port, LD2_Pin);
        ssd1306_PrintValues(setPoint, static_cast<int>(solderingIron.getTipTemperature()));
        HAL_Delay(25);
    }
#pragma clang diagnostic pop
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
    RCC_OscInitTypeDef RCC_OscInitStruct = {0};
    RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
    RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};

    /** Configure the main internal regulator output voltage
    */
    __HAL_RCC_PWR_CLK_ENABLE();
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);
    /** Initializes the CPU, AHB and APB busses clocks
    */
    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
    RCC_OscInitStruct.PLL.PLLM = 8;
    RCC_OscInitStruct.PLL.PLLN = 84;
    RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
    RCC_OscInitStruct.PLL.PLLQ = 2;
    RCC_OscInitStruct.PLL.PLLR = 2;
    if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
    {
        Error_Handler();
    }
    /** Initializes the CPU, AHB and APB busses clocks
    */
    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
                                  | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
    {
        Error_Handler();
    }
    PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_FMPI2C1;
    PeriphClkInitStruct.Fmpi2c1ClockSelection = RCC_FMPI2C1CLKSOURCE_APB;
    if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
    {
        Error_Handler();
    }
}

int __io_putchar(int ch)
{
    uint8_t c[1];
    c[0] = ch & 0x00FF; // NOLINT(hicpp-signed-bitwise)
    HAL_UART_Transmit(&huart2, &*c, 1, 1);
    return ch;
}

void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM5)
    {
        solderingIron.processControl();
        __HAL_TIM_SET_COMPARE(&htim5, TIM_CHANNEL_2, pwmOutput);
    }
}

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM1 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM1)
    {
        HAL_IncTick();
    }
}

/**
  * @brief EXTI line detection callbacks
  * @param GPIO_Pin: Specifies the pins connected EXTI line
  * @retval None
  */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == BTN_Pin)
    {
        std::cout << "pressed" << std::endl;
        solderingIron.toggle();
    }
    if (GPIO_Pin == ENC_CH_A_Pin)
    {
        if (HAL_GPIO_ReadPin(ENC_CH_B_GPIO_Port, ENC_CH_B_Pin))
        {
            setPoint = solderingIron.increaseSetPoint();
        }
        else
        {
            setPoint = solderingIron.decreaseSetPoint();
        }
    }
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
    /* USER CODE BEGIN Error_Handler_Debug */
    /* User can add his own implementation to report the HAL error return state */

    /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

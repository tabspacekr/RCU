# RTC (Real Time Clock) Module

DS1307은 외부 온도에 의해 쉽게 영향을 받음. 한달에 5분정도 시간 뒤틀림

DS3231은 온도에 영향을 받지 않고, 1년에 몇분이내의 오차만 가짐

따라서 DS3231을 추천함

The main difference between the DS3231 and DS1370 is the accuracy of time-keeping.

DS1307 comes with an external 32kHz crystal for time-keeping whose oscillation frequency is easily affected by external temperature. This usually results with the clock being off by around five or so minutes per month.

However, the DS3231 is much more accurate, as it comes with an internal Temperature Compensated Crystal Oscillator(TCXO) which isn’t affected by temperature, making it accurate down to a few minutes per year at the most.

DS1307 is still a great value RTC and serves you well, but for projects that require more accurate time-keeping, DS3231 is recommended.


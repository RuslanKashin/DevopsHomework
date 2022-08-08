package main

import "fmt"

func main() {
	fmt.Print("Введите значение в метрах: ")
	var meters float64
	fmt.Scanf("%f", &meters)
	futs := meters / 0.3048
	fmt.Printf("Это составляет %.4f футов\n", futs)
}

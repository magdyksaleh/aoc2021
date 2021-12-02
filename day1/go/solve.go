package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	dat, _ := os.ReadFile("../data.txt")
	speedData := strings.Split(string(dat), "\n")
	numIncreases := 0
	prev := 0
	for i, speed := range speedData {
		cur, _ := strconv.Atoi(speed)
		if i >= 1 {
			if cur > prev {
				numIncreases += 1
			}
		}
		prev = cur
	}
	fmt.Println("Num Single increase", numIncreases)

	numTripleIncreases := 0
	for i, speed := range speedData {
		cur, _ := strconv.Atoi(speed)
		if i >= 3 {
			s4, _ := strconv.Atoi(speedData[i])
			s3, _ := strconv.Atoi(speedData[i-1])
			s2, _ := strconv.Atoi(speedData[i-2])
			s1, _ := strconv.Atoi(speedData[i-3])
			cur := s4 + s3 + s2
			prev := s3 + s2 + s1
			if cur > prev {
				numTripleIncreases += 1
			}
		}
		prev = cur
	}
	fmt.Println("Num Triple increase", numTripleIncreases)
}

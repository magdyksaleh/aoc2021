package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	dat, _ := os.ReadFile("../data.txt")
	dirData := strings.Split(string(dat), "\n")
	xpos, ypos, aim := 0, 0, 0
	for i, elem := range dirData {
		if i < 1000 {
			command := strings.Split(elem, " ")
			mag, _ := strconv.Atoi(command[1])
			switch command[0] {
			case "forward":
				xpos += mag
				ypos += aim * mag
			case "up":
				aim -= mag
			case "down":
				aim += mag
			}
		}
	}
	fmt.Println(xpos, ypos, xpos*ypos)
}

package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/sixfwa/fiber-api/Database"
	"github.com/sixfwa/fiber-api/Models"
)

type Readings struct {
	V1 float64 `json:"v1"`
	V2  float64 `json:"v2"`
}

func CreateResponseData(userModel models.Readings) Readings {
	return Readings{V1: userModel.V1, V2: userModel.V2}
}

func CreateData(c *fiber.Ctx) error {
	var data models.Readings

	if err := c.BodyParser(&data); err != nil {
		return c.Status(400).JSON(err.Error())
	}

	database.Database.Db.Create(&data)
	responseUser := CreateResponseData(data)

	return c.Status(200).JSON(responseUser)
}

func GetReadings(c *fiber.Ctx) error {
	readings := []models.Readings{}

	database.Database.Db.Find(&readings)
	responseUsers := []Readings{}
	for _, user := range readings {
		responseUser := CreateResponseData(user)
		responseUsers = append(responseUsers, responseUser)
	}

	return c.Status(200).JSON(responseUsers)
}

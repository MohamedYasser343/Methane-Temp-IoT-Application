package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
	"github.com/sixfwa/fiber-api/Database"
	"github.com/sixfwa/fiber-api/Routes"
)

func setupRoutes(app *fiber.App) {
	// User endpoints
	app.Post("/sensorData", routes.CreateData)
	app.Get("/sensorData", routes.GetReadings)
}

func main() {
	database.ConnectDb()
	app := fiber.New()

	setupRoutes(app)

	log.Fatal(app.Listen(":3535"))
}

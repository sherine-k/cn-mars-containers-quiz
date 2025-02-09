package main

import (
	"fmt"
	"log"

	"github.com/go-openapi/loads"
	"github.com/go-openapi/runtime/middleware"
	"github.com/scraly/gophers-api/pkg/swagger/server/models"
	"github.com/scraly/gophers-api/pkg/swagger/server/restapi"

	"github.com/scraly/gophers-api/pkg/swagger/server/restapi/operations"
)

func main() {

	// Initialize Swagger
	swaggerSpec, err := loads.Analyzed(restapi.SwaggerJSON, "")
	if err != nil {
		log.Fatalln(err)
	}

	api := operations.NewGophersAPIAPI(swaggerSpec)
	server := restapi.NewServer(api)

	defer func() {
		if err := server.Shutdown(); err != nil {
			// error handle
			log.Fatalln(err)
		}
	}()

	server.Port = 8080

	api.CheckHealthHandler = operations.CheckHealthHandlerFunc(Health)

	api.GetGophersHandler = operations.GetGophersHandlerFunc(GetGophers)

	api.GetGopherHandler = operations.GetGopherHandlerFunc(GetGopherByName)

	api.PostGopherHandler = operations.PostGopherHandlerFunc(CreateGopher)

	api.DeleteGopherHandler = operations.DeleteGopherHandlerFunc(DeleteGopher)

	api.PutGopherHandler = operations.PutGopherHandlerFunc(UpdateGopher)

	// Start server which listening
	if err := server.Serve(); err != nil {
		log.Fatalln(err)
	}
}

type gopher struct {
	Name        string `json:"name"`
	Displayname string `json:"displayname"`
	URL         string `json:"url"`
}

type allGophers []gopher

var gophers = allGophers{
	{
		Name:        "5th-element",
		Displayname: "5th Element",
		URL:         "https://raw.githubusercontent.com/scraly/gophers/main/5th-element.png",
	},
}

// Health route returns OK
func Health(operations.CheckHealthParams) middleware.Responder {
	fmt.Println("[Health] Call method")
	return operations.NewCheckHealthOK().
		WithPayload("OK").
		WithAccessControlAllowOrigin("*")
}

// Returns a a list of Gophers
func GetGophers(gopher operations.GetGophersParams) middleware.Responder {
	fmt.Println("[GetGophers] Call method")

	var gophersList []*models.Gopher

	// Get all existing Gophers
	for _, myGopher := range gophers {
		gophersList = append(gophersList, &models.Gopher{Name: myGopher.Name, Displayname: myGopher.Displayname, URL: myGopher.URL})
	}

	return operations.NewGetGophersOK().
		WithPayload(gophersList).
		WithAccessControlAllowOrigin("*")
}

// Returns an object of type Gopher with a given name
func GetGopherByName(gopherParam operations.GetGopherParams) middleware.Responder {
	fmt.Println("[GetGopherByName] Call method")

	for _, myGopher := range gophers {
		if myGopher.Name == gopherParam.Name {
			fmt.Println("Gopher", gopherParam.Name, "found in DB")

			return operations.NewGetGopherOK().WithPayload(
				&models.Gopher{
					Name:        myGopher.Name,
					Displayname: myGopher.Displayname,
					URL:         myGopher.URL}).
				WithAccessControlAllowOrigin("*")
		}
	}

	//If gopher have not been found, returns a 404 HTTP Error Code
	return operations.
		NewGetGopherNotFound().
		WithAccessControlAllowOrigin("*")
}

// TODO: to finish
func getGopher(gopherName string) gopher {
	for _, myGopher := range gophers {
		if myGopher.Name == gopherName {
			return myGopher
		}
	}

	return gopher{}
}

func gopherExists(gopherName string) bool {
	for _, myGopher := range gophers {
		if myGopher.Name == gopherName {
			return true
		}
	}

	return false
}

// Add a new Gopher
func CreateGopher(gopherParam operations.PostGopherParams) middleware.Responder {
	fmt.Println("[CreateGopher] Call method")

	name := gopherParam.Gopher.Name
	displayname := gopherParam.Gopher.Displayname
	url := gopherParam.Gopher.URL

	fmt.Println("Try to create a Gopher with the parameters:", *name, *displayname, *url)

	// Check if a gopher not already exists
	if !gopherExists(*name) {
		// Add new gopher in the list of existing Gophers
		gophers = append(gophers, gopher{*name, *displayname, *url})

		fmt.Println("Gopher", *name, "created!")

		return operations.NewPostGopherCreated().WithPayload(&models.Gopher{Name: *name, Displayname: *displayname, URL: *url})
	} else {
		return operations.NewPostGopherConflict()
	}
}

// Delete a Gopher with a given name
func DeleteGopher(gopherParam operations.DeleteGopherParams) middleware.Responder {
	fmt.Println("[DeleteGopher] Call method")

	for i, myGopher := range gophers {
		if myGopher.Name == gopherParam.Name {
			fmt.Println("Gopher", gopherParam.Name, "found in DB, try to delete it")

			gophers = append(gophers[:i], gophers[i+1:]...)

			fmt.Println("Gopher", gopherParam.Name, "deleted!")

			return operations.NewDeleteGopherOK()
		}
	}

	fmt.Println("[DeleteGopher] End of the method")

	//If gopher have not been found, returns a 404 HTTP Error Code
	return operations.NewDeleteGopherNotFound()
}

// Update the displayname and the URL of an existing Gopher
func UpdateGopher(gopherParam operations.PutGopherParams) middleware.Responder {
	fmt.Println("[UpdateGopher] Call method")

	fmt.Println("Updating", *gopherParam.Gopher.Name, "with new values")

	for i := range gophers {
		if gophers[i].Name == *gopherParam.Gopher.Name {
			gophers[i].Displayname = *gopherParam.Gopher.Displayname
			gophers[i].URL = *gopherParam.Gopher.URL

			fmt.Println("Gopher updated!")

			return operations.NewPostGopherCreated().WithPayload(&models.Gopher{
				Name:        *gopherParam.Gopher.Name,
				Displayname: *gopherParam.Gopher.Displayname,
				URL:         *gopherParam.Gopher.URL})
		}
	}

	fmt.Println("[UpdateGopher] End of the method")

	return operations.NewPutGopherOK()
}

//TODO: Create Helper function in order to create a JSON with full existing Gophers in github.com/scraly/gophers
// /*
// *
// Get Gophers List from Scraly repository
// */
// func GetGophersList() []*models.Gopher {

// 	client := github.NewClient(nil)

// 	// list public repositories for org "github"
// 	ctx := context.Background()
// 	// list all repositories for the authenticated user
// 	_, directoryContent, _, err := client.Repositories.GetContents(ctx, "scraly", "gophers", "/", nil)
// 	if err != nil {
// 		fmt.Println(err)
// 	}

// 	var arr []*models.Gopher

// 	for _, c := range directoryContent {
// 		if *c.Name == ".gitignore" || *c.Name == "README.md" {
// 			continue
// 		}

// 		var name string = strings.Split(*c.Name, ".")[0]

// 		arr = append(arr, &models.Gopher{name, *c.Displayname, *c.DownloadURL})

// 	}

// 	return arr
// }

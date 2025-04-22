* [ASP.NET Core WebApi Sample with HATEOAS, Versioning &amp; Swagger](#aspnet-core-webapi-sample-with-hateoas-versioning--swagger)
   * [Versions](#versions)
   * [GET all Foods](#get-all-foods)
   * [GET single food](#get-single-food)
   * [POST a foodItem](#post-a-fooditem)
   * [PUT a foodItem](#put-a-fooditem)
   * [PATCH a foodItem](#patch-a-fooditem)
   * [DELETE a foodItem](#delete-a-fooditem)
* [Report](#report)
   * [Description](#description)
   * [how to start](#how-to-start)
   * [Screenshots](#screenshots)

# ASP.NET Core WebApi Sample with HATEOAS, Versioning & Swagger

In this repository I want to give a plain starting point at how to build a WebAPI with ASP.NET Core.

This repository contains a controller which is dealing with FoodItems. You can GET/POST/PUT/PATCH and DELETE them.

Hope this helps.

See the examples here: 

## Versions

``` http://localhost:29435/swagger ```

![ASPNETCOREWebAPIVersions](./.github/versions.jpg)

## GET all Foods

``` http://localhost:29435/api/v1/foods ```

![ASPNETCOREWebAPIGET](./.github/get.jpg)

## GET single food

``` http://localhost:29435/api/v1/foods/2 ```

![ASPNETCOREWebAPIGET](./.github/getSingle.jpg)

## POST a foodItem

``` http://localhost:29435/api/v1/foods ```

```javascript
  {
      "name": "Lasagne",
      "type": "Main",
      "calories": 3000,
      "created": "2017-09-16T17:50:08.1510899+02:00"
  }
```

![ASPNETCOREWebAPIGET](./.github/post.jpg)

## PUT a foodItem

``` http://localhost:29435/api/v1/foods/5 ```

``` javascript
{
    "name": "Lasagne2",
    "type": "Main",
    "calories": 3000,
    "created": "2017-09-16T17:50:08.1510899+02:00"
}
```

![ASPNETCOREWebAPIGET](./.github/put.jpg)


## PATCH a foodItem

``` http://localhost:29435/api/v1/foods/5 ```

``` javascript
[
  { "op": "replace", "path": "/name", "value": "mynewname" }
]
```

![ASPNETCOREWebAPIGET](./.github/patch.jpg)

## DELETE a foodItem

``` http://localhost:29435/api/v1/foods/5 ```


![ASPNETCOREWebAPIGET](./.github/delete.jpg)

# Report

## Description
For this project, I created a docker file and a compouse docker, then I added the build to GitHub Actions and pushed the image to Docker Hub. Next, I created the infrastructure to launch the application via Azure App service. I also added Azure DevOps for terraform.

## how to start

```bash
terraform init
terraform apply \
  -target=azurerm_resource_group.rg \
  -target=azurerm_storage_account.tfstate \
  -target=azurerm_storage_container.tfstate
terraform init   # with backend
```
## Screenshots

![Terraform-init](.github/Report_image/t-init.png)
  <p align="center">Terraform init</p>

![Terraform-apply](.github/Report_image/t-apply.png)
  <p align="center">Terraform apply</p>

![Terraform-bk](.github/Report_image/t-init-bk.png)
  <p align="center">Terraform init backend</p>

![GitHub](.github/Report_image/gh-build.png)
  <p align="center">GitHub Action Build</p>

![Azure](.github/Report_image/A-pipeline.png)
  <p align="center">Azure build apply</p>

![GitHub](.github/Report_image/Check-passed.png)
  <p align="center">Check passed</p>

![Azure](.github/Report_image/A-res-group.png)
  <p align="center">Azure resurse group</p>

![Azure](.github/Report_image/Swagger.png)
  <p align="center">Worked Swagger</p>

![Azure](.github/Report_image/Swagger-v2.png)
  <p align="center">Worked Swagger v2</p>
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create DynamoDB Table
resource "aws_dynamodb_table" "pl_table" {
  name         = "PremierLeagueTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TeamName"

  attribute {
    name = "TeamName"
    type = "S"
  }

  tags = {
    Environment = "Dev"
    Project     = "PremierLeagueDB"
  }
}

#ADD 20 PL TEAMS INTO THE TABLE

locals {
  pl_teams = {
    "Arsenal"          = { Points = 78, BestPlayer = "Bukayo Saka" }
    "Manchester City"  = { Points = 81, BestPlayer = "Erling Haaland" }
    "Manchester United"= { Points = 65, BestPlayer = "Bruno Fernandes" }
    "Liverpool"        = { Points = 70, BestPlayer = "Mohamed Salah" }
    "Chelsea"          = { Points = 60, BestPlayer = "Mason Mount" }
    "Tottenham"        = { Points = 62, BestPlayer = "Harry Kane" }
    "Newcastle"        = { Points = 55, BestPlayer = "Callum Wilson" }
    "Brighton"         = { Points = 53, BestPlayer = "Leandro Trossard" }
    "Aston Villa"      = { Points = 50, BestPlayer = "Emiliano Buendia" }
    "West Ham"         = { Points = 48, BestPlayer = "Declan Rice" }
    "Leicester"        = { Points = 47, BestPlayer = "James Maddison" }
    "Crystal Palace"   = { Points = 45, BestPlayer = "Wilfried Zaha" }
    "Wolves"           = { Points = 44, BestPlayer = "Ruben Neves" }
    "Everton"          = { Points = 42, BestPlayer = "Dominic Calvert-Lewin" }
    "Southampton"      = { Points = 41, BestPlayer = "James Ward-Prowse" }
    "Bournemouth"      = { Points = 40, BestPlayer = "Philip Billing" }
    "Nottingham Forest"= { Points = 38, BestPlayer = "Brennan Johnson" }
    "Fulham"           = { Points = 36, BestPlayer = "Aleksandar Mitrovic" }
    "Burnley"          = { Points = 34, BestPlayer = "Maxwel Cornet" }
    "Sheffield Utd"    = { Points = 32, BestPlayer = "Sander Berge" }
  }
}

resource "aws_dynamodb_table_item" "pl_teams" {
  for_each   = local.pl_teams
  table_name = aws_dynamodb_table.pl_table.name
  hash_key   = "TeamName"

  item = jsonencode({
    TeamName   = { S = each.key }
    Points     = { N = tostring(each.value.Points) }
    BestPlayer = { S = each.value.BestPlayer }
  })
}


import boto3
from decimal import Decimal

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table('PremierLeagueTable')

response = table.scan()
teams = response['Items']

# Convert Decimal to int
winner = max(teams, key=lambda x: int(x['Points']))

print(f"Predicted Premier League Winner: {winner['TeamName']} with {int(winner['Points'])} points")

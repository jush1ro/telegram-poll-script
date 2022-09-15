import requests
import json

base_url = 'https://api.telegram.org/botID/sendPoll'

parameters = {
	"chat_id" : "chatID",
	"is_anonymous" : "False",
	"question" : 'Настроение ок?',
	"options" : json.dumps(["Да" , "Нет"]),
}

resp = requests.get(base_url, data = parameters)
print(resp.text)

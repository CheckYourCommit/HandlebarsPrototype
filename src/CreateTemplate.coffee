Handlebars = require 'handlebars'
fs = require 'fs'
pdf = require 'html-pdf'


source = fs.readFileSync("release/src/templates/Invoice.html", 'utf8')
template = Handlebars.compile(source)

context = 
	Company:
		Name: 'Snowflake LLC'
		StreetAddress: '6654 East 23rd Terrace'
		City: 'TellTale'
		Province: 'Northington'
		Country: 'Norway'
	Invoice:
		Account: 12342
		Number: 123332
		Date: '12/16/2016'
	Customer:
		Name: 'Snowball Inc.'
		StreetAddress: '6654 East 23rd Terrace'
		City: 'Quoth'
		Province: 'Southington'
		Country: 'Denmark'
	Items: [
		{
			description: 'Truck'
			Total: 1400
		}
		{
			description: 'Car'
			Total: 1600
		}
		{
			description: 'Hat'
			Total: 11
		}
	]

html = template(context)

console.log html

pdf.create(html).toFile 'release/pdfs/test.pdf', (err, res) ->
	if err
		return console.log(err)
	console.log res
	# { filename: './test.pdf' } 
	return

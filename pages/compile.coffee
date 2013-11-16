gaze = require 'gaze'
path = require 'path'
fs = require 'fs'
jade = require 'jade'

files = []

addFiles = (files) ->

	for file in files

		addFile file

	return

addFile = (file) ->

	basename = path.basename file

	# return if basename[0] is '_'

	return if path.extname(file) isnt '.jade'

	return if files.indexOf(file) isnt -1

	console.log 'Added ' + file

	files.push file

refreshAll = ->

	console.log "\n\n" + 'refreshing' + "\n"

	for file in files

		continue if path.basename(file)[0] is '_'

		try

			html = jade.renderFile file,

				pretty: yes

			write file, html

		catch e

			`console.log("\007")`

			console.log "\n\n Error:"

			console.log 'file: ' + file

			console.log '    ' + e.message
			console.log '    Stack:' + e.stack

			console.log "\n\n"


	return

write = (file, hm) ->

	htmlFile = file.replace('\\jade\\', '\\html\\').replace '.jade', '.html'

	fs.writeFileSync htmlFile, hm

	console.log "\n" + 'Recompiled ', file

gaze './jade/**', (err, watcher) ->

	watched = @watched()

	for p of watched

		addFiles watched[p]

	do refreshAll

	@on 'added', (p) ->

		addFile [p]

		do refreshAll

	@on 'changed', ->

		do refreshAll

	return
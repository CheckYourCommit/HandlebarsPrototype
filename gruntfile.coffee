module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')
		coffee: coffee_to_js:
			expand: true
			cwd: 'src'
			src: '**/*.coffee'
			dest: 'release/src'
			ext: '.js'
		copy: main:
			expand: true
			src: 'src/**/*.html'
			dest: 'release'
		clean: ['release']
		run: target:
			cmd: 'node'
			args: ['./release/src/CreateTemplate.js']


	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-run'

	grunt.registerTask 'compile', [ 'coffee', 'copy' ]
	grunt.registerTask 'create', ['run']
	
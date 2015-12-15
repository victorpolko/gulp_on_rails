desc 'compile assets using Gulp'
task 'assets:precompile' do
  `node_modules/.bin/gulp --gulpfile app/frontend/gulpfile.coffee deploy`
end

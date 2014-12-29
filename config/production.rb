#added per https://devcenter.heroku.com/articles/rails-4-asset-pipeline  https://medium.com/self-directed-learning/rails-4-heroku-the-asset-pipeline-quandary-9ba1f595102a. trying to get asset files to not encounter 404 on heroku.
config.serve_static_assets = true 
config.action_dispatch.x_sendfile_header = ‘X-Accel-Redirect’

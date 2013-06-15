# Load in DataMapper
# Change the setup to meet your DB needs
require 'data_mapper'
require 'dm-types'
DataMapper.setup(:default, 'abstract::')

# API objects
require 'cloudsdale/version'
require 'cloudsdale/api/api'
require 'cloudsdale/client'

# Models
require 'cloudsdale/models/user'
require 'cloudsdale/models/cloud'
require 'cloudsdale/models/avatar'
require 'cloudsdale/models/ban'
require 'cloudsdale/models/chat'

# Finalize DataMapper so the models Load
DataMapper.finalize
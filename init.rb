# Make sure that ActiveScaffold has already been included
ActiveScaffold rescue throw "should have included ActiveScaffold plug in first.  Please make sure that this overwrite plugging comes alphabetically after the ActiveScaffold plug in"

# Load our overrides
load 'actions/export.rb'
load 'config/export.rb'
load 'config/core.rb'
load 'helpers/view_helpers.rb'
load 'helpers/export_helpers.rb'

##
## Run the install script, too, just to make sure
##
require File.dirname(__FILE__) + '/install'

# Add the csv mime type
Mime::Type.register 'text/csv', :csv

# Register our helper methods
ActionView::Base.send(:include, ActiveScaffold::Helpers::ExportHelpers)
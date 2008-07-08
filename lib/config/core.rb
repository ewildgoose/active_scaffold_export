module ActiveScaffold::Config
  class Core
    cattr_accessor :export_show_form, :export_allow_full_download,
      :export_force_quotes, :export_default_full_download,
      :export_default_delimiter, :export_default_skip_header
    @@export_show_form = true
    @@export_allow_full_download = true
    @@export_default_full_download = true
    @@export_force_quotes = false
    @@export_default_skip_header = false
    @@export_default_delimiter = ','

    ActionController::Resources::Resource::ACTIVE_SCAFFOLD_ROUTING[:collection][:show_export] = :get
  end
end

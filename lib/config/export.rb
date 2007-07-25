module ActiveScaffold::Config
  class Export < Base
    self.crud_type = :read

    def initialize(core_config)
      @core = core_config
    end

    # global level configuration
    # --------------------------
    # the ActionLink for this action
    cattr_accessor :link
    @@link = ActiveScaffold::DataStructures::ActionLink.new('show_export', :label => 'Export', :type => :table, :security_method => :export_authorized?)

    
    # instance-level configuration
    # ----------------------------

    attr_writer :show_form, :allow_full_download, :force_quotes, :default_full_download, :default_delimiter, :default_skip_header, :default_deselected_columns
    def show_form
      self.show_form = @core.export_show_form unless @show_form
      @show_form
    end
    def allow_full_download
      self.allow_full_download = @core.export_allow_full_download unless @allow_full_download
      @allow_full_download
    end
    def force_quotes
      self.force_quotes = @core.export_force_quotes unless @force_quotes
      @force_quotes
    end
    def default_full_download
      self.default_full_download = @core.export_default_full_download unless @default_full_download
      @default_full_download
    end
    def default_delimiter
      self.default_delimiter = @core.export_default_delimiter unless @default_delimiter
      @default_delimiter
    end
    def default_skip_header
      self.default_skip_header = @core.export_default_skip_header unless @default_skip_header
      @default_skip_header
    end
    def default_deselected_columns
      self.default_deselected_columns = [] unless @default_deselected_columns
      @default_deselected_columns
    end

    # provides access to the list of columns specifically meant for this action to use
    def columns
      self.columns = @core.columns._inheritable unless @columns
      @columns
    end
    def columns=(val)
      @columns = ActiveScaffold::DataStructures::ActionColumns.new(*val)
      @columns.action = self
    end
  end
end

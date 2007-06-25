module ActionView::Helpers
  module ActiveScaffoldListHelpers
    
    ##
    ## Table cell formatting methods
    ##

    def render_csv_column(record, column)
      # check for an override helper
      
      value = record.send(column.name)
      if column.association.nil? or column_empty?(value)
        formatted_value = clean_column_value(format_column(value))
      else
        case column.association.macro
          when :has_one, :belongs_to
            formatted_value = clean_column_value(format_column(value.to_label))

          when :has_many, :has_and_belongs_to_many
            firsts = value.first(4).collect { |v| v.to_label }
            firsts[3] = '...' if firsts.length == 4
            formatted_value = clean_column_value(format_column(firsts.join(', ')))
        end
      end

      formatted_value
    end

    
  end
end

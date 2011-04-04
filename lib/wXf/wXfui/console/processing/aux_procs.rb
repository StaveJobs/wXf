#
# Contains the name of the class being stacked and available commands
#

module WXf
module WXfui
module Console
module Processing
  
  class AuxiliaryProcs 
    
    attr_accessor :opts
    
    include WXf::WXfui::Console::Operations::ModuleCommandOperator


    
    def name
      "Auxiliary" 
    end
  
    
    #
    # Available arguments
    #
    def avail_args; {"run" => "Runs the module"}; end
    
    
        
    #
    # This method determines if an lfile option has been set
    #      
    def lfile_check(activity)
      return unless activity.respond_to?('datahash')
        val = nil
          if activity.datahash.has_key?('LFILE')
            val = activity.datahash['LFILE']
          else
            val = nil   
          end
        if !val.nil?
          lfile_translation(activity, val)
        end
    end  
    
    
    #
    # Method to translate lfile to real LFILE
    #
    def lfile_translation(activity, val=nil)
      inst = val
      self.opts['LFILE'] = val
        if control.framework.modules.lfile_load_list.has_key?(inst)        
          name = control.framework.modules.lfile_load_list[inst]
          activity.datahash['LFILE'] = name
        end
    end
    
    
    #
    # We need to reset the lfile appearance (think - show options)
    #
    def lfile_reset(activity)
      return unless activity.respond_to?('datahash')
        if activity.datahash.has_key?('LFILE') and self.opts.has_key?('LFILE')
          activity.datahash['LFILE'] = self.opts['LFILE']
        end  
    end
        
    #
    # Checks and error handling, nm at the moment tho :-)
    #
    def arg_run(*cmd)
      self.opts = {}
      lfile_check(activity)
        begin
          activity.run
        rescue => $!
          print("The following error occurred: #{$!}" + "\n")
        end
      lfile_reset(activity)     
    end  
     
  end
  
end end end end    
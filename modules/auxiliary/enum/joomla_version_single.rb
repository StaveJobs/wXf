class WebXploit < WXf::WXfmod_Factory::Auxiliary   
  
  include WXf::WXfassists::Auxiliary::Joomla
  
  def initialize
    super(

            'Name'        => 'Joomla Version Scanner',
            'Description' => %q{
             This is a basic Joomla version detection module. It takes advantage of the Joomla auxiliary assist library.
             The module is meant to be used on one host only.                                    
            },           
            'Author'      => [ 'CKTRICKY',],
            'License'     => WXF_LICENSE
  
    )
     
  end
  
  def run
    version = detect_version_single
    if version.empty?
      prnt_err("No Joomla Version detected, sorry :-(")
    else
      prnt_plus("The Joomla Version detected was version: #{version}")
    end
  end

end

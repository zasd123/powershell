﻿Program prints "Hello World" to STDOUT and STDERR
TODO:

#>

cls

#function takes an array as an arg and returns nothing
function Display-Message{
    $input = $args[0]
    for ($x = 0;$x -lt $input.Length;$x++){
        Write-Host($input[$x])
        start-sleep -s 1
    }
}

function Display-Error{
    $input = $args[0]
    for ($x = 0;$x -lt $input.Length;$x++){
        Write-Error -Message $input[$x]
        start-sleep -s 1
    }
}


#function takes no args and returns an array of strings
function Build-Array{
    [string []] $output = @()
    $output+= "          _____                    _____                    _____            _____           _______                 
         /\    \                  /\    \                  /\    \          /\    \         /::\    \                
        /::\____\                /::\    \                /::\____\        /::\____\       /::::\    \               
       /:::/    /               /::::\    \              /:::/    /       /:::/    /      /::::::\    \              
      /:::/    /               /::::::\    \            /:::/    /       /:::/    /      /::::::::\    \             
     /:::/    /               /:::/\:::\    \          /:::/    /       /:::/    /      /:::/~~\:::\    \            
    /:::/____/               /:::/__\:::\    \        /:::/    /       /:::/    /      /:::/    \:::\    \           
   /::::\    \              /::::\   \:::\    \      /:::/    /       /:::/    /      /:::/    / \:::\    \          
  /::::::\    \   _____    /::::::\   \:::\    \    /:::/    /       /:::/    /      /:::/____/   \:::\____\         
 /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \  /:::/    /       /:::/    /      |:::|    |     |:::|    |        
/:::/  \:::\    /::\____\/:::/__\:::\   \:::\____\/:::/____/       /:::/____/       |:::|____|     |:::|    |        
\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /\:::\    \       \:::\    \        \:::\    \   /:::/    /         
 \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/  \:::\    \       \:::\    \        \:::\    \ /:::/    /          
          \::::::/    /    \:::\   \:::\    \       \:::\    \       \:::\    \        \:::\    /:::/    /           
           \::::/    /      \:::\   \:::\____\       \:::\    \       \:::\    \        \:::\__/:::/    /            
           /:::/    /        \:::\   \::/    /        \:::\    \       \:::\    \        \::::::::/    /             
          /:::/    /          \:::\   \/____/          \:::\    \       \:::\    \        \::::::/    /              
         /:::/    /            \:::\    \               \:::\    \       \:::\    \        \::::/    /               
        /:::/    /              \:::\____\               \:::\____\       \:::\____\        \::/____/                
        \::/    /                \::/    /                \::/    /        \::/    /         ~~                      
         \/____/                  \/____/                  \/____/          \/____/                                  
                                                                                                                      "
    $output += "          _____                   _______                   _____                    _____            _____          
         /\    \                 /::\    \                 /\    \                  /\    \          /\    \         
        /::\____\               /::::\    \               /::\    \                /::\____\        /::\    \        
       /:::/    /              /::::::\    \             /::::\    \              /:::/    /       /::::\    \       
      /:::/   _/___           /::::::::\    \           /::::::\    \            /:::/    /       /::::::\    \      
     /:::/   /\    \         /:::/~~\:::\    \         /:::/\:::\    \          /:::/    /       /:::/\:::\    \     
    /:::/   /::\____\       /:::/    \:::\    \       /:::/__\:::\    \        /:::/    /       /:::/  \:::\    \    
   /:::/   /:::/    /      /:::/    / \:::\    \     /::::\   \:::\    \      /:::/    /       /:::/    \:::\    \   
  /:::/   /:::/   _/___   /:::/____/   \:::\____\   /::::::\   \:::\    \    /:::/    /       /:::/    / \:::\    \  
 /:::/___/:::/   /\    \ |:::|    |     |:::|    | /:::/\:::\   \:::\____\  /:::/    /       /:::/    /   \:::\ ___\ 
|:::|   /:::/   /::\____\|:::|____|     |:::|    |/:::/  \:::\   \:::|    |/:::/____/       /:::/____/     \:::|    |
|:::|__/:::/   /:::/    / \:::\    \   /:::/    / \::/   |::::\  /:::|____|\:::\    \       \:::\    \     /:::|____|
 \:::\/:::/   /:::/    /   \:::\    \ /:::/    /   \/____|:::::\/:::/    /  \:::\    \       \:::\    \   /:::/    / 
  \::::::/   /:::/    /     \:::\    /:::/    /          |:::::::::/    /    \:::\    \       \:::\    \ /:::/    /  
   \::::/___/:::/    /       \:::\__/:::/    /           |::|\::::/    /      \:::\    \       \:::\    /:::/    /   
    \:::\__/:::/    /         \::::::::/    /            |::| \::/____/        \:::\    \       \:::\  /:::/    /    
     \::::::::/    /           \::::::/    /             |::|  ~|               \:::\    \       \:::\/:::/    /     
      \::::::/    /             \::::/    /              |::|   |                \:::\    \       \::::::/    /      
       \::::/    /               \::/____/               \::|   |                 \:::\____\       \::::/    /       
        \::/____/                 ~~                      \:|   |                  \::/    /        \::/____/        
         ~~                                                \|___|                   \/____/          ~~              
  
                                                                                                                    "
    $output += "         _       _    _            _             _             _       
        / /\    / /\ /\ \         _\ \          _\ \          /\ \     
       / / /   / / //  \ \       /\__ \        /\__ \        /  \ \    
      / /_/   / / // /\ \ \     / /_ \_\      / /_ \_\      / /\ \ \   
     / /\ \__/ / // / /\ \_\   / / /\/_/     / / /\/_/     / / /\ \ \  
    / /\ \___\/ // /_/_ \/_/  / / /         / / /         / / /  \ \_\ 
   / / /\/___/ // /____/\    / / /         / / /         / / /   / / / 
  / / /   / / // /\____\/   / / / ____    / / / ____    / / /   / / /  
 / / /   / / // / /______  / /_/_/ ___/\ / /_/_/ ___/\ / / /___/ / /   
/ / /   / / // / /_______\/_______/\__\//_______/\__\// / /____\/ /    
\/_/    \/_/ \/__________/\_______\/    \_______\/    \/_________/     
                                                                       "
    $output += "        _             _            _           _           _         
       / /\      _   /\ \         /\ \        _\ \        /\ \       
      / / /    / /\ /  \ \       /  \ \      /\__ \      /  \ \____  
     / / /    / / // /\ \ \     / /\ \ \    / /_ \_\    / /\ \_____\ 
    / / /_   / / // / /\ \ \   / / /\ \_\  / / /\/_/   / / /\/___  / 
   / /_//_/\/ / // / /  \ \_\ / / /_/ / / / / /       / / /   / / /  
  / _______/\/ // / /   / / // / /__\/ / / / /       / / /   / / /   
 / /  \____\  // / /   / / // / /_____/ / / / ____  / / /   / / /    
/_/ /\ \ /\ \// / /___/ / // / /\ \ \  / /_/_/ ___/\\ \ \__/ / /     
\_\//_/ /_/ // / /____\/ // / /  \ \ \/_______/\__\/ \ \___\/ /      
    \_\/\_\/ \/_________/ \/_/    \_\/\_______\/      \/_____/       
                                                                     "
    $output += " ___  ___  _______   ___       ___       ________     
|\  \|\  \|\  ___ \ |\  \     |\  \     |\   __  \    
\ \  \\\  \ \   __/|\ \  \    \ \  \    \ \  \|\  \   
 \ \   __  \ \  \_|/_\ \  \    \ \  \    \ \  \\\  \  
  \ \  \ \  \ \  \_|\ \ \  \____\ \  \____\ \  \\\  \ 
   \ \__\ \__\ \_______\ \_______\ \_______\ \_______\
    \|__|\|__|\|_______|\|_______|\|_______|\|_______|
                                                      
                                                      
                                                      "
    $output += " ___       __   ________  ________  ___       ________     
|\  \     |\  \|\   __  \|\   __  \|\  \     |\   ___ \    
\ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \    \ \  \_|\ \   
 \ \  \  __\ \  \ \  \\\  \ \   _  _\ \  \    \ \  \ \\ \  
  \ \  \|\__\_\  \ \  \\\  \ \  \\  \\ \  \____\ \  \_\\ \ 
   \ \____________\ \_______\ \__\\ _\\ \_______\ \_______\
    \|____________|\|_______|\|__|\|__|\|_______|\|_______|
                                                           
                                                           
                                                           "
    $output += "██╗  ██╗███████╗██╗     ██╗      ██████╗ 
██║  ██║██╔════╝██║     ██║     ██╔═══██╗
███████║█████╗  ██║     ██║     ██║   ██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║
██║  ██║███████╗███████╗███████╗╚██████╔╝
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ 
                                         "                       
    $output += "██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗ 
██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗
██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║
██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║
╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ 
                                           "                             
    $output += "      ___           ___           ___       ___       ___     
     /\__\         /\  \         /\__\     /\__\     /\  \    
    /:/  /        /::\  \       /:/  /    /:/  /    /::\  \   
   /:/__/        /:/\:\  \     /:/  /    /:/  /    /:/\:\  \  
  /::\  \ ___   /::\~\:\  \   /:/  /    /:/  /    /:/  \:\  \ 
 /:/\:\  /\__\ /:/\:\ \:\__\ /:/__/    /:/__/    /:/__/ \:\__\
 \/__\:\/:/  / \:\~\:\ \/__/ \:\  \    \:\  \    \:\  \ /:/  /
      \::/  /   \:\ \:\__\    \:\  \    \:\  \    \:\  /:/  / 
      /:/  /     \:\ \/__/     \:\  \    \:\  \    \:\/:/  /  
     /:/  /       \:\__\        \:\__\    \:\__\    \::/  /   
     \/__/         \/__/         \/__/     \/__/     \/__/    "
    $output += "      ___           ___           ___           ___       ___     
     /\__\         /\  \         /\  \         /\__\     /\  \    
    /:/ _/_       /::\  \       /::\  \       /:/  /    /::\  \   
   /:/ /\__\     /:/\:\  \     /:/\:\  \     /:/  /    /:/\:\  \  
  /:/ /:/ _/_   /:/  \:\  \   /::\~\:\  \   /:/  /    /:/  \:\__\ 
 /:/_/:/ /\__\ /:/__/ \:\__\ /:/\:\ \:\__\ /:/__/    /:/__/ \:|__|
 \:\/:/ /:/  / \:\  \ /:/  / \/_|::\/:/  / \:\  \    \:\  \ /:/  /
  \::/_/:/  /   \:\  /:/  /     |:|::/  /   \:\  \    \:\  /:/  / 
   \:\/:/  /     \:\/:/  /      |:|\/__/     \:\  \    \:\/:/  /  
    \::/  /       \::/  /       |:|  |        \:\__\    \::/__/   
     \/__/         \/__/         \|__|         \/__/     ~~       "          
    $output += "`n      .·¨'`;        ,.·´¨;\                  _,.,  °             ,.  '                ,.  '              , ·. ,.-·~·.,       
     ';   ;'\       ';   ;::\          ,.·'´  ,. ,  `;\ '         /   ';\              /   ';\             /  ·'´,.-·-.,   `,'    
     ;   ;::'\      ,'   ;::';       .´   ;´:::::\`'´ \'\       ,'   ,'::'\           ,'   ,'::'\           /  .'´\:::::::'\   '\ °  
     ;  ;::_';,. ,.'   ;:::';°     /   ,'::\::::::\:::\:'     ,'    ;:::';'         ,'    ;:::';'       ,·'  ,'::::\:;:-·-:';  ';\  
   .'     ,. -·~-·,   ;:::'; '    ;   ;:;:-·'~^ª*';\'´       ';   ,':::;'          ';   ,':::;'       ;.   ';:::;´       ,'  ,':'\ 
   ';   ;'\::::::::;  '/::::;      ;  ,.-·:*'´¨'`*´\::\ '      ;  ,':::;' '          ;  ,':::;' '        ';   ;::;       ,'´ .'´\::';
    ;  ';:;\;::-··;  ;::::;      ;   ;\::::::::::::'\;'      ,'  ,'::;'            ,'  ,'::;'           ';   ':;:   ,.·´,.·´::::\;'°
    ':,.·´\;'    ;' ,' :::/  '     ;  ;'_\_:;:: -·^*';\      ;  ';_:,.-·´';\     ;  ';_:,.-·´';\     \·,   `*´,.·'´::::::;·´   
     \:::::\    \·.'::::;        ';    ,  ,. -·:*'´:\:'\°    ',   _,.-·'´:\:\    ',   _,.-·'´:\:\     \\:¯::\:::::::;:·´      
       \;:·´     \:\::';          \`*´ ¯\:::::::::::\;' '    \¨:::::::::::\';     \¨:::::::::::\';      `\:::::\;::·'´  °       
                  `·\;'             \:::::\;::-·^*'´          '\;::_;:-·'´        '\;::_;:-·'´            ¯                  
                     '                `*´¯                     '¨                   '¨                                        "
    $output += "   ,., '                               , ·. ,.-·~·.,            ,. -  .,                       ,.  '           ;'*¨'`·- .,              
 ,'   '`;                 ,·;'         /  ·'´,.-·-.,   `,'       ,' ,. -  .,  `' ·,              /   ';\           \`:·-,. ,   '` ·.  '      
 ;    ,':\     ,'´¨';     '; ;'\       /  .'´\:::::::'\   '\ °     '; '·~;:::::'`,   ';\         ,'   ,'::'\           '\:/   ;\:'`:·,  '`·, '   
 ;    ';::'\  ,'   ,'\   ,' ,'::'\   ,·'  ,'::::\:;:-·-:';  ';\      ;   ,':\::;:´  .·´::\'      ,'    ;:::';'           ;   ;'::\;::::';   ;\   
 ',    ';::;','    ,'::\,'  ,':::;  ;.   ';:::;´       ,'  ,':'\     ;  ·'-·'´,.-·'´:::::::';     ';   ,':::;'            ;  ,':::;  `·:;;  ,':'\' 
  ';   ';:';,'     ;:::;' ,'::::;'   ';   ;::;       ,'´ .'´\::';  ;´    ':,´:::::::::::·´'      ;  ,':::;' '           ;   ;:::;    ,·' ,·':::; 
   ';  ';:;' ,:';  ';:;'  ,'::::;    ';   ':;:   ,.·´,.·´::::\;'°   ';  ,    `·:;:-·'´          ,'  ,'::;'              ;  ;:::;'  ,.'´,·´:::::; 
    ';  '·' ,'::';  '·´ ,':::::;      \·,   `*´,.·'´::::::;·´      ; ,':\'`:·.,  ` ·.,         ;  ';_:,.-·´';\      ':,·:;::-·´,.·´\:::::;´'  
     \   /::::;\·-·'´\::::;·''       \\:¯::\:::::::;:·´         \·-;::\:::::'`:·-.,';       ',   _,.-·'´:\:\      \::;. -·´:::::;\;·´     
      \'´\:::;'  '\::::'\;'´           `\:::::\;::·'´  °           \::\:;'` ·:;:::::\::\'      \¨:::::::::::\';       \;'\::::::::;·´'        
       '\:'\:/     '·-·'´'                 ¯                       '·-·'       `' · -':::''      '\;::_;:-·'´            `\;::-·´            
         '´                                                                                   '¨                                         "
    $output += "_____/\\\\\\\\\\\\_____________________________________/\\\___/\\\_____________________________________        
 ___/\\\//////////_____________________________________\/\\\__\/\\\_____________________________________       
  __/\\\________________________________________________\/\\\__\/\\\___________/\\\__/\\\________________      
   _\/\\\____/\\\\\\\_____/\\\\\________/\\\\\___________\/\\\__\/\\\__________\//\\\/\\\______/\\\\\\\\__     
    _\/\\\___\/////\\\___/\\\///\\\____/\\\///\\\____/\\\\\\\\\__\/\\\\\\\\\_____\//\\\\\_____/\\\/////\\\_    
     _\/\\\_______\/\\\__/\\\__\//\\\__/\\\__\//\\\__/\\\////\\\__\/\\\////\\\_____\//\\\_____/\\\\\\\\\\\__   
      _\/\\\_______\/\\\_\//\\\__/\\\__\//\\\__/\\\__\/\\\__\/\\\__\/\\\__\/\\\__/\\_/\\\_____\//\\///////___  
       _\//\\\\\\\\\\\\/___\///\\\\\/____\///\\\\\/___\//\\\\\\\/\\_\/\\\\\\\\\__\//\\\\/_______\//\\\\\\\\\\_ 
        __\////////////_______\/////________\/////______\///////\//__\/////////____\////__________\//////////__"
        return ,$output
}

<#
function Launch-Gui{
    #creates frame
    Add-Type -assembly System.Windows.Forms
    $main_form = New-Object System.Windows.Forms.Form
    $main_form.Text ='Hello World'
    $main_form.Width = 900
    $main_form.Height = 600
    $main_form.AutoSize = $true
   
   
    #creates lable
    #$Label = New-Object System.Windows.Forms.Label
    #$Label.Text = $text[$index]
    #$Label.Location  = New-Object System.Drawing.Point(0,10)
    #$Label.AutoSize = $true
    #$main_form.Controls.Add($label)

    #creates textbox
    $textBox = New-Object System.Windows.Forms.TextBox
    New-Object System.Windows.
    $textBox.= $text[$index]
    $textBox.Location = New-Object System.Drawing.Point(0,10)
    $textBox.AutoSize = $true
    $main_form.Controls.Add($textBox)

    $main_form.Controls.Add($label)

    #creates button
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Size(400,10)
    $Button.Size = New-Object System.Drawing.Size(120,23)
    $Button.Text = "Next"
   # $main_form.Controls.Add($Button)
   
   
    #Displays Form   
    $main_form.ShowDialog()

   

 }

 #>

#$index = 0
#$text = Build-Array
#Launch-Gui


Display-Message(Build-Array)
Display-Error(Build-Array)
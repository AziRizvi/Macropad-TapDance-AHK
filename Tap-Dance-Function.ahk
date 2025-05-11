;; ========================================================================================================================================================================== ;;
;; ========================================================================================================================================================================== ;;

class TapDance 

			{
				Static Call(tapCallbacks := [], holdCallbacks := [], tappingTerm := 250, holdingTerm := tappingTerm, tapout := false) 
				
				{
					Static dance := FirstTimeSetup(), tapFuncs := [], holdFuncs := []
			
					If not dance.InProgress 
					
						{                                                       						;; If Tapdance Is Not In Progress
							FirstTapSetup()                                                         	;; Setup Tapdance And Start Tapdance
						} 	
						
					Else If OtherTapDanceKeyPressed() 	
						
						{                                           									;; If Tapdance Is In Progress And If First Tap Hotkey Is DIfferent Than This One
							Return                                                                  	;; Exit Early
						}                                                                           	    

					ResetTimeoutAndCheckTaps()                                                      	;; Start/Reset Timer And Check Tap Progress
															
					;;-----------------------------;;	
					;; -- Encapsulated Functions --;;	
					;;-----------------------------;;	
						
					ResetTimeoutAndCheckTaps() 	
						
						{                                                    	
							SetTimer(dance.CheckIfDone, -tappingTerm)                               	;; Start/Reset Timer To Check If Done Tapping/Holding
							dance.timer := True                                                     	;; Set Timer State To True
							dance.taps++                                                            	;; Increase Taps By One

							If dance.taps = dance.limit 	
								
								{                                               						;; If At The Last Tap
									If tapFuncs.Length > holdFuncs.Length 	
										
										{                                 								;; If More Taps Than Holds Are Supplied
											FinishAndCall(tapFuncs)                                 	;; Immediately Invoke Callback
										} 	
										
									Else If KeyIsHeld() 	
										
										{                                                 				;; If Key Is Held For Hold Duration
											FinishAndCall(holdFuncs)                                	;; Invoke Hold Callback
										} 	
											
									Else 	
										
										{                                                           	;; If Last Tap Wasn't Held
											FinishAndCall(tapFuncs)                                 	;; Invoke Tap Callback
										}	
											
								}    	
								
							Else If KeyIsHeld() 	
								
								{                                                       				;; If Key Is Held For Hold Duration
									FinishAndCall(holdFuncs)                                        	;; Invoke Hold Callback
								}        	
	
							Else If holdingTerm > tappingTerm and not dance.timer 	
								
								{                     													;; If Key Can Be Held Longer Than Timer Accounts For And Timer Stopped
									FinishAndCall(tapFuncs)                                         	;; Invoke Tap Callback
								}                                                                   	        
																											
							KeyWait(dance.hotkey)                                                   	;; Prevents Extra Calls When Holding Key Down
						}                                                                           	    
																											
																											
						TimerFinished() 	
							
							{                                                               	
								dance.timer := false                                                	;; Set Timer State To False
								If not dance.InProgress 	
									
									{                                                   				;; Guard Clause If Tapdance Has Ended
										Return                                                      	;; Return
									}           	
									
								If not GetKeyState(dance.hotkey, 'P') 	
									
									{                                     								;; If Key Isn't Held When Timed Out
										FinishAndCall(tapFuncs)                                     	;; Invoke Tap Callback
									}	
									
							}                                                                       	        
																										
																										
					FirstTapSetup() 	
						
						{                                                               	
							dance.hotkey := this.hotkey                                             	;; Get Key That Triggered This
							tapFuncs     := tapCallbacks                                            	;; Save Tap Callbacks
							holdFuncs    := holdCallbacks                                           	;; Save Hold Callbacks
							dance.limit  := Max(tapFuncs.Length, holdFuncs.Length)                  	;; Get Tap Limit
							dance.timer  := false                                                   	;; Timer State Is For Holdingterm > Tappingterm Condition
							dance.taps   := 0                                                       	;; Initialize Taps To 0

							If not tapFuncs.Has(1) 
							
								{                                                    					;; Is First Index Has No Value
									heldModIfiers := this.GetModIfiers()                            	;; Get ModIfiers Being Held Down
									vksc := this.GetVKSC(dance.hotkey)                              	;; Get Vksc Of Key
									x := Send.Bind(heldModIfiers '{' vksc '}')                      	;; Bind ModIfiers And Key To Send
									(tapFuncs.Length ? tapFuncs[1] := x : tapFuncs.Push(x))         	;; Assign Func Object To First Tap
								}                                                                   	        
																											
							dance.Start()                                                           	;; Start Tapdance
						}                                                                              
																									
																									
					FirstTimeSetup() 
					
						{                                                             
							ih := InputHook('L0 I')                                                    
							modIfiers := '{LCtrl}{RCtrl}{LShIft}{RShIft}{LAlt}{RAlt}{LWin}{RWin}'       ;; List Of ModIfier Keys For Inputhook
							ih.KeyOpt(modIfiers, 'V')                                                   ;; ModIfiers And Other Custom Keys Can Still Work
							ih.KeyOpt('{All}', 'N')                                                     ;; All Keys NotIfy
							ih.KeyOpt(modIfiers, '-N')                                                  ;; Don't Let ModIfiers
							ih.OnKeyDown := (ih, vk, sc) => OtherKeyPressed(Format('vk{:x}', vk))       ;; When Another Key Is Pressed, Pass Key To Function
							ih.OnEnd := (*) => SetTimer(dance.CheckIfDone, 0)                           ;; On End, Stop Timer
							ih.CheckIfDone := TimerFinished                                             ;; Reference For Timer
							Return ih                                                                   ;; Return Inputhook
						}                                                                               
																									
																									
					KeyIsHeld() => !KeyWait(dance.hotkey, 'T' holdingTerm/1000)                     	;; Returns If Key Was Held For Holdingterm
																																												
					OtherTapDanceKeyPressed() 
					
						{                                                    							;; This Code Block Is Meant To Treat Other Tapdance Keys That Didn't Start It As Normal Keys
							key := this.hotkey                                                          ;; Get Key That Triggered Tapdance
							If key != dance.hotkey 
							
							{                                                    						;; If It's Not The Same As The Key That Started Tapdance
								OtherKeyPressed(key)                                                    ;; Pass Key To Send After Callback And Exit
								Return True                                                             ;; Return True
							}                                                                           
						}                                                                               
																																												
					OtherKeyPressed(key) 
					
						{                                                          
							vksc := this.GetVKSC(key)                                                   ;; Get Key Vksc
							FinishAndCall(tapFuncs)                                                     ;; Invoke Tap Callback
							Send('{Blind}{' vksc '}')                                                   ;; Send Key That Was Pressed
						}                                                                               
																									
																									
					FinishAndCall(tapOrHold) 
					
						{                                                      
							If not dance.InProgress 
							
								{                                                   					;; If Callback Is Invoked While Tapdance Has Stopped (Happens When Releasing Key At The Same Time As Tapping_Term)
									Return                                                              ;; Prevent Extra Calls
								}                                                                           
																										
							If tapout 
							
								{                                                                 		;; If Tapout Is True
									max := tapOrHold = tapFuncs ? tapFuncs.Length : holdFuncs.Length    ;; Get Max Taps Or Holds
									dance.taps := Min(dance.taps, max)                                  ;; Don't Let Taps Go Past The Max
								}                                                                           
																										
							If tapOrHold.Has(dance.taps) 
							
								{                                              							;; If Index Exists
									element := tapOrHold[dance.taps]                                    ;; Save Value At Index
									dance.Stop()                                                        ;; And Stop Tapdance
								} 
							
							Else 
							
								{                                                                    	;; If Index Doesn't Exist
									Return dance.Stop()                                                 ;; Stop Tapdance And Return
								}                                                                           
																										
							If element is String 
							
								{                                                      					;; If Value At Index Is A String
									Send(element)                                                       ;; Send Value
								} 
							
							Else 
							
								{                                                                    	;; Otherwise
									element()                                                        	;; Invoke Callback
								}                                                                           
						}                                                                             
				}                                                                                   
																									
																									
				Static enabled := True                                                              	;; Enabled At Start, Use With #HotIf
				Static Toggle() => this.enabled := !this.enabled                                    	;; Toggle Tapdance On/Off
																										
				Static hotkey => RegExReplace(A_ThisHotkey, '[~*$!^+#<>]')                          	;; Remove ModIfiers From Hotkey
				Static GetVKSC(key) => Format('vk{:x}sc{:x}', GetKeyVK(key), GetKeySC(key))         	;; Get Vksc Code
																										
				Static GetModIfiers() 	
					
				{                                                             	
					modIfiers := ''                                                                 	;; Initialize Blank
					GetKeyState('ShIft', 'P') ? modIfiers .= '+' : 0                                	;; If ShIft Is Held, Add To ModIfiers
					GetKeyState('Ctrl', 'P')  ? modIfiers .= '^' : 0                                	;; If Control Is Held, Add To ModIfiers
					GetKeyState('Alt', 'P')   ? modIfiers .= '!' : 0                                	;; If Alt Is Held, Add To ModIfiers
					(GetKeyState('LWin', 'P') or GetKeyState('RWin', 'P')) ? modIfiers .= '#' : 0   	;; If Windows Key Is Held, Add To ModIfiers
					Return modIfiers                                                                	;; Return ModIfiers Held When Tapdance Star
				}
			}

;; ========================================================================================================================================================================== ;;
;; ========================================================================================================================================================================== ;;
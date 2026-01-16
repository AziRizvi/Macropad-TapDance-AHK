#Requires AutoHotkey v2.0
#SingleInstance

TraySetIcon("TD-1.png")
A_IconTip := "QMK Macropad [QM-1] - Tap Dance.ahk"

;; ======================================================================================================================================================================== ;;
;; Include The Tap-Dance Function & The Macropad Button Functions.
;; ======================================================================================================================================================================== ;;

#Include Tap-Dance-Function.ahk
#Include QM1-Functions.ahk

;; ======================================================================================================================================================================== ;;
;; Pause & Suspend The Script
;; ======================================================================================================================================================================== ;;

^End::

	{
	
		Suspend
		Pause

	}

; ======================================================================================================================================================================== ;;
; Toggle The Tap-Dance
; ======================================================================================================================================================================== ;;

^!End::

	{
	
		TapDance.Toggle()

	}	

;; ======================================================================================================================================================================== ;;

#HotIf TapDance.enabled

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 1: (Physical Button # [First Button First Row])
;; ------------------------------------------------------------------------------------;;

+!F1::TapDance(
    [
        () => OpenYTSubscriptions(),  																		;; A Quick Key Tap Opens YT Subscriptions Page.
        () => YTManualSearch(),  																			;; A Quick Double-Tap Opens A Search Box To Search On YT.
    ],
	[
		() => OpenYTHome(),																					;; A Key-Hold Opens The YT Homepage.
	],, 200
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 2: (Physical Button # [Second Button First Row])
;; ------------------------------------------------------------------------------------;;

+!F2::TapDance(
    [
        () => OpenTwitter(),  																				;; A Quick Key Tap Opens Twitter.
        () => TwitterAdvancedSearch()																		;; A Quick Double-Tap Opens Twitter's Advanced Search Page.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 3: (Physical Button # [Third Button First Row])
;; ------------------------------------------------------------------------------------;;

+!F3::TapDance(
    [
        () => OpenReddit(),  																				;; A Quick Key Tap Opens Reddit.
        () => OpenAHKSubReddit(),  																			;; A Quick Double-Tap Opens The AHK Subreddit.
    ],
	[
		() => RedditMessages(),																				;; A Hold Opens Reddit Messages.
		() => OpenRainySubReddit(),																			;; A Tap & Hold Opens The Rainy Subreddit.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 4: (Physical Button # [Fourth Button First Row])
;; ------------------------------------------------------------------------------------;;

+!F4::TapDance(
    [
        () => OpenDiscord(),  																				;; Execute This Function When The Key Is Tapped Once.
        () => FavoriteDiscordGroup1(),  																	;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => FavoriteDiscordGroup2(),																		;; Execute This Function When The Key Is Held.
		() => FavoriteDiscordGroup3(),																		;; Execute This Function When The Key Is Tapped Once And Then Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 5: (Physical Button # [Fifth Button First Row])
;; ------------------------------------------------------------------------------------;;

+!F5::TapDance(
    [
        () => OpenFacebook(),  																				;; Execute This Function When The Key Is Tapped Once.
        () => FavoriteFBPage1(),  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => FavoriteFBPage2(),																			;; Execute This Function When The Key Is Held.
		() => FavoriteFBGroup1(),																			;; Execute This Function When The Key Is Tapped Once And Then Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 6: (Physical Button # [First Button Second Row])
;; ------------------------------------------------------------------------------------;;

+!F6::TapDance(
    [
        () => OpenChatGPT()  																				;; A Quick Key Tap Opens ChatGPT.																		;; Execute This Function When The Key Is Tapped Twice.
    ],

)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 7: (Physical Button # [Second Button Second Row])
;; ------------------------------------------------------------------------------------;;

+!F7::TapDance(
    [
        () => OpenBard()  																					;; A Quick Key Tap Opens Google Bard/Gemini.	
    ],

)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 8: (Physical Button # [Third Button Second Row])
;; ------------------------------------------------------------------------------------;;

+!F8::TapDance(
    [
        () => YourFunction1(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => YourFunction2(),  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 9: (Physical Button # [Fourth Button Second Row])
;; ------------------------------------------------------------------------------------;;

+!F9::TapDance(
    [
        () => YourFunction3(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => YourFunction4(),  																			;; Execute This Function When The Key Is Tapped Twice.
        () => YourFunction5(),  																			;; Execute This Function When The Key Is Tapped Thrice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 10: (Physical Button # [Fifth Button Second Row])
;; ------------------------------------------------------------------------------------;;

+!F10::TapDance(
    [
        () => OpenAliexpress(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => OpenAliexpressOrders(),  																		;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => OpenAliexpressCart(),																			;; Execute This Function When The Key Is Held.
		() => OpenAliexpressTracking(),																		;; Execute This Function When The Key Is Tapped Once And Then Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 11: (Physical Button # [First Button Third Row])
;; ------------------------------------------------------------------------------------;;

+!F11::TapDance(
    [
        () => OpenEbay(),  																					;; Execute This Function When The Key Is Tapped Once.
        () => OpenEbayTracking(),  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 12: (Physical Button # [Second Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F12::TapDance(
    [
        () => OpenCivitAI(),  																				;; A Quick Key Tap Opens Facebook.
        () => OpenAutomatic1111Github(),  																	;; A Quick Double-Tap Opens Anime Corner News FB Page.
    ],
	[
		() => OpenForgeUIGithub(),																			;; A Hold Opens A Github Page.
		() => OpenHuggingFace(),																			;; A Tap & Hold Opens Anime Trending FB Page.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 13: (Physical Button # [Third Button Third Row])
;; ------------------------------------------------------------------------------------;;

+!F13::TapDance(
    [
        () => YourFunction6(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => YourFunction7()  																				;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 14: (Physical Button # [Fourth Button Third Row])
;; ------------------------------------------------------------------------------------;;

+!F14::TapDance(
    [
        () => YourFunction8(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => YourFunction9()  																				;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 15: (Physical Button # [Fifth Button Third Row])
;; ------------------------------------------------------------------------------------;;

+!F15::TapDance(
    [
        () => OpenMainGmail(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => OpenSecondaryGmail(),  																		;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => OpenGmail(),																					;; Execute This Function When The Key Is Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 16: (Physical Button # [First Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F16::TapDance(
    [
        () => OpenMarvelTVWiki()  																			;; Execute This Function When The Key Is Tapped Once.  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 17: (Physical Button # [Second Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F17::TapDance(
    [
        () => OpenMarvelFilmsWiki()  																		;; Execute This Function When The Key Is Tapped Once.  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 18: (Physical Button # [Third Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F18::TapDance(
    [
        () => OpenDCAUWiki()  																				;; Execute This Function When The Key Is Tapped Once.  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 19: (Physical Button # [Fourth Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F19::TapDance(
    [
        () => OpenDCFilmsWiki()  																			;; Execute This Function When The Key Is Tapped Once.  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 20: (Physical Button # [Fifth Button Fourth Row])
;; ------------------------------------------------------------------------------------;;

+!F20::TapDance(
    [
        () => OpenDCTVWiki()  																				;; Execute This Function When The Key Is Tapped Once.  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 22: (Physical Button # [First Button Fifth Row])
;; ------------------------------------------------------------------------------------;;

+!F21::TapDance(
    [
        () => OpenGitHub()  																				;; Execute This Function When The Key Is Tapped Once.																	;; Execute This Function When The Key Is Tapped Twice.
    ],
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 22: (Physical Button # [Second Button Fifth Row])
;; ------------------------------------------------------------------------------------;;

+!F22::TapDance(
    [
        () => StopScripts(),  																				;; Execute This Function When The Key Is Tapped Once.
        () => ReloadScripts(),  																			;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => OpenScriptsDirectory(),																		;; Execute This Function When The Key Is Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 23: (Physical Button # [Third Button Fifth Row])
;; ------------------------------------------------------------------------------------;;

+!F23::TapDance(
    [
        () => OpenProwlarr(),  																				;; Execute This Function When The Key Is Tapped Once.
        () => OpenJackett(),  																				;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => OpenJellyFin(),																				;; Execute This Function When The Key Is Held.
		() => OpenJellySeer(),																				;; Execute This Function When The Key Is Tapped Once And Then Held.
		() => OpenDuckieTV(),																				;; Execute This Function When The Key Is Tapped Twice And Then Held.
	],, 100	
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 24: (Physical Button # [Fourth Button Fifth Row])
;; ------------------------------------------------------------------------------------;;

+!F24::TapDance(
    [
        () => OpenRadarr(),  																				;; Execute This Function When The Key Is Tapped Once.
    ],
	[
		() => OpenRadarrCalender(),																			;; Execute This Function When The Key Is Held.
	],, 100
)

;; ------------------------------------------------------------------------------------;;
;; Macropad Button 25: (Physical Button # [Fifth Button Fifth Row])
;; ------------------------------------------------------------------------------------;;

<#F2::TapDance(
    [
        () => OpenSonarrAnime(),  																			;; Execute This Function When The Key Is Tapped Once.
        () => OpenSonarrTV(),  																				;; Execute This Function When The Key Is Tapped Twice.
    ],
	[
		() => OpenSonarrAnimeCalender(),																	;; Execute This Function When The Key Is Held.
		() => OpenSonarrTVCalender(),																		;; Execute This Function When The Key Is Tapped Once And Then Held.
	],, 100
)

;; ======================================================================================================================================================================== ;;

#HotIf

;; ======================================================================================================================================================================== ;;

#HotIf WinActive("YouTube Search:")

Esc:: 

	{
	
		Send("{Esc}")
	
	}

#HotIf

;; ======================================================================================================================================================================== ;;


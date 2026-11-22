// for secHUDs and medHUDs and variants. The number is the location of the image on the list hud_list
// note: if you add more HUDs, even for non-human atoms, make sure to use unique numbers for the defines!
// /datum/atom_hud expects these to be unique
// these need to be strings in order to make them associative lists
/// dead, alive, sick, health status
#define HEALTH_HUD "1"
/// a simple line rounding the mob's number health
#define STATUS_HUD "2"
/// the job asigned to your ID
#define ID_HUD "3"
/// wanted, released, parroled, security status
#define WANTED_HUD "4"
/// loyality implant
#define IMPLOYAL_HUD "5"
/// chemical implant
#define IMPCHEM_HUD "6"
/// tracking implant
#define IMPTRACK_HUD "7"
/// Silicon/Mech/Circuit Status
#define DIAG_STAT_HUD "8"
/// Silicon health bar
#define DIAG_HUD "9"
/// Borg/Mech/Circutry power meter
#define DIAG_BATT_HUD "10"
/// Mech health bar
#define DIAG_MECH_HUD "11"
/// Bot HUDs
#define DIAG_BOT_HUD "12"
/// Circuit assembly health bar
#define DIAG_CIRCUIT_HUD "13"
/// Mech/Silicon tracking beacon, Circutry long range icon
#define DIAG_TRACK_HUD "14"
/// Airlock shock overlay
#define DIAG_AIRLOCK_HUD "15"
/// Bot path indicators
#define DIAG_PATH_HUD "16"
/// Gland indicators for abductors
#define GLAND_HUD "17"
#define SENTIENT_PATHOGEN_HUD "18"
#define AI_DETECT_HUD "19"
/// Displays launchpads' targeting reticle
#define DIAG_LAUNCHPAD_HUD "22"
/// Shows pestilence effects for those afflicted with it
#define PESTILENCE_HUD "23"

//by default everything in the hud_list of an atom is an image
//a value in hud_list with one of these will change that behavior
#define HUD_LIST_LIST 1

//data HUD (medhud, sechud) defines
//Don't forget to update human/New() if you change these!
#define DATA_HUD_SECURITY_BASIC 1
#define DATA_HUD_SECURITY_ADVANCED 2
#define DATA_HUD_MEDICAL_BASIC 3
#define DATA_HUD_MEDICAL_ADVANCED 4
#define DATA_HUD_DIAGNOSTIC_BASIC 5
#define DATA_HUD_DIAGNOSTIC_ADVANCED 6
#define DATA_HUD_ABDUCTOR 7
#define DATA_HUD_SENTIENT_DISEASE 8
#define DATA_HUD_AI_DETECT 9

// Notification action types
#define NOTIFY_JUMP "jump"
#define NOTIFY_ATTACK "attack"
#define NOTIFY_ORBIT "orbit"

/// cooldown for being shown the images for any particular data hud
#define ADD_HUD_TO_COOLDOWN 20


// Security HUD icon_state defines

#define SECHUD_NO_ID "hudno_id"
#define SECHUD_UNKNOWN "hudunknown"
#define SECHUD_CENTCOM "hudcentcom"
#define SECHUD_SYNDICATE "hudsyndicate"

#define SECHUD_ASSISTANT "hudassistant"
#define SECHUD_BARTENDER "hudbartender"
#define SECHUD_BOTANIST "hudbotanist"
#define SECHUD_CHAPLAIN "hudchaplain"
#define SECHUD_MORALE_OFFICER "hudclown"
#define SECHUD_COOK "hudcook"
#define SECHUD_CHEF "hudchef"
#define SECHUD_CURATOR "hudcurator"
#define SECHUD_GENETICIST "hudgeneticist"
#define SECHUD_JANITOR "hudjanitor"
#define SECHUD_MIME "hudmime"

#define SECHUD_DCLASS "huddclass"
#define SECHUD_DCLASS_BOTANIST "huddclassbotanist"
#define SECHUD_DCLASS_COOK "huddclasscook"
#define SECHUD_DCLASS_JANITOR "huddclassjanitor"
#define SECHUD_DCLASS_MINER "huddclassminer"
#define SECHUD_ECLASS "hudeclass"

#define SECHUD_SITE_DIRECTOR "hudsitedirector"
#define SECHUD_HUMAN_RESOURCES_DIRECTOR "hudhumanresources"
#define SECHUD_ETHICS_COMMITTEE_LIAISON "hudecl"
#define SECHUD_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER "huditdo"
#define SECHUD_INTAKE_SPECIALIST "hudintakespecialist"
#define SECHUD_communications_officer "hudcommsofficer"
#define SECHUD_GOI_REP "hudgoi"

#define SECHUD_SECURITY_CAPTAIN "hudsecuritycaptain"
#define SECHUD_SECURITY_LIEUTENANT "hudsecuritylieutenant"
#define SECHUD_SECURITY_SERGEANT "hudsecuritysergeant"
#define SECHUD_SECURITY_MEDIC "hudsecuritymedic"
#define SECHUD_SECURITY_GUARD "hudsecurityguard"
#define SECHUD_SECURITY_CADET "hudsecuritycadet"

#define SECHUD_TRT_COMMANDER "hudtrtcommander"
#define SECHUD_TRT_SERGEANT "hudtrtsergeant"
#define SECHUD_TRT_OPERATOR "hudtrtoperator"
#define SECHUD_TRT_CADET "hudtrtcadet"

#define SECHUD_SCIENCE_DIRECTOR "hudsciencedirector"
#define SECHUD_ASSISTANT_SCIENCE_DIRECTOR "hudassistantsciencedirector"
#define SECHUD_SENIOR_ROBOTICIST "hudseniorroboticist"
#define SECHUD_ROBOTICIST "hudroboticist"
#define SECHUD_SENIOR_RESEARCHER "hudseniorresearcher"
#define SECHUD_RESEARCHER "hudresearcher"
#define SECHUD_JUNIOR_RESEARCHER "hudjuniorresearcher"

#define SECHUD_MEDICAL_DIRECTOR "hudmedicaldirector"
#define SECHUD_ASSISTANT_MEDICAL_DIRECTOR "hudassistantmedicaldirector"
#define SECHUD_SENIOR_DOCTOR "hudseniordoctor"
#define SECHUD_MEDICAL_DOCTOR "hudmedicaldoctor"
#define SECHUD_MEDICAL_TECHNICIAN "hudmedicaltechnician"
#define SECHUD_PSYCHOLOGIST "hudpsychologist"
#define SECHUD_MEDICAL_STUDENT "hudmedicalstudent"

#define SECHUD_ENGINEERING_DIRECTOR "hudengineerdirector"
#define SECHUD_ASSISTANT_ENGINEERING_DIRECTOR "hudassistantengineerdirector"
#define SECHUD_SENIOR_TECHNICIAN "hudseniortechnician"
#define SECHUD_CONTAINMENT_ENGINEER "hudcontainmentengineer"
#define SECHUD_FACILITY_TECHNICIAN "hudfacilitytechnician"
#define SECHUD_JUNIOR_TECHNICIAN "hudjuniortechnician"

#define SECHUD_LOGISTICS_OFFICER "hudlogisticsofficer"
#define SECHUD_LOGISTICS_TECHNICIAN "hudlogisticstechnician"

#define SECHUD_CENTRAL "hudcentral"
#define SECHUD_CENTRAL_ISD "hudisd"
#define SECHUD_CENTRAL_ETHICS "hudethics"
#define SECHUD_CENTRAL_TRIBUNAL "hudtribunal"

#define SECHUD_MTF_CAPTAIN "hudmtfcaptain"
#define SECHUD_MTF_SERGEANT "hudmtfsergeant"
#define SECHUD_MTF_SPECIALIST "hudmtfspecialist"
#define SECHUD_MTF_PRIVATE "hudmtfprivate"
#define SECHUD_MTF_MEDIC "hudmtfmedic"
#define SECHUD_MTF_RESH1 "hudmtfresh1"
#define SECHUD_MTF_ALPHA1 "hudmtfalpha1"
#define SECHUD_MTF_OMEGA1 "hudmtfomega1"
#define SECHUD_MTF_EPSILON9 "hudmtfepsilon9"
#define SECHUD_MTF_BETA7 "hudmtfbeta7"
#define SECHUD_MTF_ALPHA45 "hudmtfalpha45"
#define SECHUD_MTF_NU7 "hudmtfnu7"

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5
/// Job unavailable due to incompatibility with an antag role.
#define JOB_UNAVAILABLE_ANTAG_INCOMPAT 6
#define JOB_UNAVAILABLE_RANK 7

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"
#define DEFAULT_BIBLE "Default Bible Name"
#define DEFAULT_BIBLE_REPLACE(religion) "The Holy Book of [religion]"

#define JOB_DISPLAY_ORDER_DEFAULT 100


/**
 * =======================
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * =======================
 * These names are used as keys in many locations in the database
 * you cannot change them trivially without breaking job bans and
 * role time tracking, if you do this and get it wrong you will die
 * and it will hurt the entire time
 */

//No department

#define JOB_ASSISTANT "Intern"
#define JOB_ECLASS "E-Class Personnel"
#define JOB_DCLASS "D-Class Personnel"
#define JOB_DCLASS_MEDICAL "D-Class Medical"
#define JOB_DCLASS_KITCHEN "D-Class Kitchen"
#define JOB_DCLASS_JANITORIAL "D-Class Janitorial"
#define JOB_DCLASS_MINING "D-Class Mining"
#define JOB_DCLASS_RESEARCH "D-Class Research"

//Administrative Staff
#define JOB_SITE_DIRECTOR "Site Director"
#define JOB_COMMUNICATIONS_OFFICER "Communications Officer"

//Dignitary Staff
#define JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER "Internal Tribunal Department Officer"
#define JOB_ETHICS_COMMITTEE_LIAISON "Ethics Committee Liaison"
#define JOB_INTAKE_SPECIALIST "Intake Specialist"
#define JOB_GOC_REP "Global Occult Coalition Representative"
#define JOB_UIU_REP "Unusual Incidents Unit Representative"

//Silicon
#define JOB_AI "AIC"
#define JOB_CYBORG "Cyborg"
#define JOB_PERSONAL_AI "Personal AIC"

//Security Department
#define JOB_SECURITY_CAPTAIN "Security Captain"

#define JOB_SECURITY_LIEUTENANT "Security Lieutenant"
#define JOB_SECURITY_SERGEANT "Security Sergeant"
#define JOB_SECURITY_MEDIC "Security Combat Medic"
#define JOB_SECURITY_GUARD "Security Guard"
#define JOB_SECURITY_CADET "Security Cadet"

//Tactical Response Team
#define JOB_TRT_COMMANDER "TRT Commander"

#define JOB_TRT_SERGEANT "Response Sergeant"
#define JOB_TRT_OPERATOR "Response Operator"
#define JOB_TRT_CADET "Response Cadet"

//Science Department
#define JOB_SCIENCE_DIRECTOR "Science Director"
#define JOB_ASSISTANT_SCIENCE_DIRECTOR "Assistant Science Director"
#define JOB_SENIOR_RESEARCHER "Senior Researcher"
#define JOB_RESEARCHER "Researcher"
#define JOB_JUNIOR_RESEARCHER "Junior Researcher"
#define JOB_SENIOR_ROBOTICIST "Senior Robotics Technician"
#define JOB_ROBOTICIST "Robotics Technician"

//Medical
#define JOB_MEDICAL_DIRECTOR "Medical Director"
#define JOB_ASSISTANT_MEDICAL_DIRECTOR "Assistant Medical Director"
#define JOB_SENIOR_DOCTOR "Senior Doctor"
#define JOB_MEDICAL_DOCTOR "Doctor"
#define JOB_MEDICAL_TECHNICIAN "Medical Technician"
#define JOB_PSYCHOLOGIST "Psychiatrist"
#define JOB_MEDICAL_STUDENT "Medical Student"

//Engineering
#define JOB_ENGINEERING_DIRECTOR "Engineering Director"
#define JOB_ASSISTANT_ENGINEERING_DIRECTOR "Assistant Engineering Director"
#define JOB_CONTAINMENT_ENGINEER "Containment Engineer"
#define JOB_SENIOR_TECHNICIAN "Senior Technician"
#define JOB_FACILITY_TECHNICIAN "Facility Technician"
#define JOB_JUNIOR_TECHNICIAN "Junior Technician"

//Logistics
#define JOB_LOGISTICS_OFFICER "Logistics Officer"
#define JOB_LOGISTICS_TECHNICIAN "Logistics Technician"

//Service
#define JOB_HUMAN_RESOURCES_OFFICER "Human Resources Officer"
#define JOB_BOTANIST "Botanist"
#define JOB_COOK "Cook"
#define JOB_BARTENDER "Bartender"
#define JOB_JANITOR "Janitor"
#define JOB_MORALE_OFFICER "Morale Officer"
#define JOB_MIME "Morale Agent"
#define JOB_CHAPLAIN "Chaplain"

//MTF
#define JOB_E11_CAPTAIN "Epsilon-11 Captain"
#define JOB_E11_SERGEANT "Epsilon-11 Sergeant"
#define JOB_E11_SPECIALIST "Epsilon-11 Specialist"
#define JOB_E11_PRIVATE "Epsilon-11 Private"
#define JOB_E11_MEDIC "Epsilon-11 Combat Medic"

#define JOB_R1_OPERATIVE "Rēsh-1 Operative"

#define JOB_O1_COMMANDER "Omega-1 Commander"
#define JOB_O1_OPERATIVE "Omega-1 Operative"

#define JOB_A1_COMMANDER "Alpha-1 Commander"
#define JOB_A1_OPERATIVE "Alpha-1 Operative"

#define JOB_B7_COMMANDER "Beta-7 Commander"
#define JOB_B7_OPERATIVE "Beta-7 Operative"

#define JOB_E9_COMMANDER "Epsilon-9 Commander"
#define JOB_E9_OPERATIVE "Epsilon-9 Operative"

#define JOB_N7_COMMANDER "Nu-7 Commander"
#define JOB_N7_OPERATIVE "Nu-7 Operative"

#define JOB_A45_AGENT "Alpha-45 Agent"

//Central
#define JOB_CENTRAL "Central Office"
#define JOB_CENTRAL_INSPECTOR "Central Office Inspector"
#define JOB_CENTRAL_ETHICS "Ethics Committee Official"
#define JOB_CENTRAL_TRIBUNAL "Internal Tribunal Official"
#define JOB_CENTRAL_SECURITY "Internal Security Field Agent"
#define JOB_CENTRAL_SECURITY_LEADER "Internal Security Officer"
#define JOB_CENTRAL_O5 "Executive Board"
#define JOB_CENTRAL_O5_REP "Executive Board Representative"

#define DEPARTMENT_UNASSIGNED "No department assigned"

#define DEPARTMENT_BITFLAG_SECURITY (1<<0)
#define DEPARTMENT_SECURITY "Security Department"
#define DEPARTMENT_BITFLAG_MANAGEMENT (1<<1)
#define DEPARTMENT_MANAGEMENT "Administration Staff"
#define DEPARTMENT_BITFLAG_SERVICE (1<<2)
#define DEPARTMENT_SERVICE "Service Staff"
#define DEPARTMENT_BITFLAG_CARGO (1<<3)
#define DEPARTMENT_CARGO "Logistics Department"
#define DEPARTMENT_BITFLAG_ENGINEERING (1<<4)
#define DEPARTMENT_ENGINEERING "Engineering Department"
#define DEPARTMENT_BITFLAG_SCIENCE (1<<5)
#define DEPARTMENT_SCIENCE "Scientific Department"
#define DEPARTMENT_BITFLAG_MEDICAL (1<<6)
#define DEPARTMENT_MEDICAL "Medical Department"
#define DEPARTMENT_BITFLAG_SILICON (1<<7)
#define DEPARTMENT_SILICON "Artifical Intelligence Applications"
#define DEPARTMENT_BITFLAG_ASSISTANT (1<<8)
#define DEPARTMENT_ASSISTANT "Civilian Staff"
#define DEPARTMENT_BITFLAG_CAPTAIN (1<<9)
#define DEPARTMENT_CAPTAIN "Site Director"
#define DEPARTMENT_BITFLAG_COMPANY_LEADER (1<<10)
#define DEPARTMENT_COMPANY_LEADER "Company Leader"

/* Job datum job_flags */
/// Whether the mob is announced on arrival.
#define JOB_ANNOUNCE_ARRIVAL (1<<0)
/// Whether the mob is added to the crew manifest.
#define JOB_CREW_MANIFEST (1<<1)
/// Whether the mob is equipped through SSjob.EquipRank() on spawn.
#define JOB_EQUIP_RANK (1<<2)
/// Whether the job is considered a regular crew member of the station. Equipment such as AI and cyborgs not included.
#define JOB_CREW_MEMBER (1<<3)
/// Whether this job can be joined through the new_player menu.
#define JOB_NEW_PLAYER_JOINABLE (1<<4)
/// Reopens this position if we lose the player at roundstart.
#define JOB_REOPEN_ON_ROUNDSTART_LOSS (1<<5)
/// If the player with this job can have quirks assigned to him or not. Relevant for new player joinable jobs and roundstart antags.
#define JOB_ASSIGN_QUIRKS (1<<6)
/// Whether this job can be an intern.
#define JOB_CAN_BE_INTERN (1<<7)

// Custom Faction System - Replacing default factions with our own
#define FACTION_NONE "None"
#define FACTION_STATION "Site"

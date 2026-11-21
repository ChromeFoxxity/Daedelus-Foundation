// Foundation-19 Job Constants and Defines
// Only defines that don't already exist in code/__DEFINES/jobs.dm are defined here
// Duplicate defines are guarded with #ifndef

// Class Levels
#define CLASS_A 1
#define CLASS_B 2
#define CLASS_C 3
#define CLASS_D 4
#define CLASS_E 5

// Experience Types (SCP-specific)
#define EXP_TYPE_LCZ "LCZ"
#define EXP_TYPE_HCZ "HCZ"
#define EXP_TYPE_EZ "EZ"
#ifndef EXP_TYPE_SECURITY
#define EXP_TYPE_SECURITY "Security"
#define EXP_TYPE_MEDICAL "Medical"
#define EXP_TYPE_SCIENCE "Science"
#define EXP_TYPE_ENGINEERING "Engineering"
#define EXP_TYPE_SUPPLY "Supply"
#define EXP_TYPE_SERVICE "Service"
#endif
#define EXP_TYPE_DCLASS "D-Class"

// Skill Levels
#define SKILL_NONE 0
#define SKILL_BASIC 1
#define SKILL_ADEPT 2
#define SKILL_EXPERT 3
#define SKILL_MASTER 4

// Skill Types
#define SKILL_COMBAT "Combat"
#define SKILL_MEDICAL "Medical"
#define SKILL_ENGINEERING "Engineering"
#define SKILL_SCIENCE "Science"
#define SKILL_SECURITY "Security"
#define SKILL_SERVICE "Service"

// Department Flags (SCP-specific, used by job_hooks and progression)
#define DEPT_FLAG_COMMAND (1<<0)
#define DEPT_FLAG_SECURITY (1<<1)
#define DEPT_FLAG_MEDICAL (1<<2)
#define DEPT_FLAG_SCIENCE (1<<3)
#define DEPT_FLAG_ENGINEERING (1<<4)
#define DEPT_FLAG_SUPPLY (1<<5)
#define DEPT_FLAG_SERVICE (1<<6)
#define DEPT_FLAG_LCZ (1<<7)
#define DEPT_FLAG_HCZ (1<<8)
#define DEPT_FLAG_EZ (1<<9)

// Job Categories
#define JOB_CATEGORY_COMMAND "Command"
#define JOB_CATEGORY_SECURITY "Security"
#define JOB_CATEGORY_MEDICAL "Medical"
#define JOB_CATEGORY_SCIENCE "Science"
#define JOB_CATEGORY_ENGINEERING "Engineering"
#define JOB_CATEGORY_SUPPLY "Supply"
#define JOB_CATEGORY_SERVICE "Service"
#define JOB_CATEGORY_CIVILIAN "Civilian"
#define JOB_CATEGORY_SILICON "Silicon"
#define JOB_CATEGORY_DCLASS "D-Class"

// Roleplay Difficulty
#define ROLEPLAY_DIFFICULTY_EASY 1
#define ROLEPLAY_DIFFICULTY_MEDIUM 2
#define ROLEPLAY_DIFFICULTY_HARD 3

// Mechanical Difficulty
#define MECHANICAL_DIFFICULTY_EASY 1
#define MECHANICAL_DIFFICULTY_MEDIUM 2
#define MECHANICAL_DIFFICULTY_HARD 3

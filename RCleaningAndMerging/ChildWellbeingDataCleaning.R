library(dplyr)
library(readxl)

# 1. Demographics --------------------------------------------------------------
demographics <- read_excel(
  path = "SOWC_tables.xlsx", 
  sheet = 1,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country",
    "population_2023_thousands_total", NA,
    "population_2023_thousands_under18", NA,
    "population_2023_thousands_under5", NA,
    "annual_population_growth_rate_perc", NA,
    "annual_population_growth_rate_perc_A", NA,
    "annual_number_of_births_thousands_2023", NA,
    "total_live_births_per_woman_2023", NA,
    "life_expectancy_at_birth_1970", NA,
    "life_expectancy_at_birth_2000", NA,
    "life_expectancy_at_birth_2023", NA,
    "dependency_ratio_total", NA,
    "dependency_ratio_child", NA,
    "dependency_ratio_old_age", NA,
    "share_of_urban_population_perc_2023", NA,
    "annual_growth_rate_of_urban_population_perc_2000-2020", NA,
    "annual_growth_rate_of_urban_population_perc_2000-2020_A", NA,
    "net_migration_rate_per_thousand_2023"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))

# 2. Child Mortality -----------------------------------------------------------
mortality <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 2,
  skip = 7,
  n_max = 216,
  col_names = c(
    "country", 
    "under5_mortality_rate_1990", NA,
    "under5_mortality_rate_2000", NA,
    "under5_mortality_rate_2022", NA,
    "under5_mortality_rate_annual_rate_of_reduction_2010-2022", NA,
    "under5_mortality_rate_2022_male", NA,
    "under5_mortality_rate_2022_female", NA,
    "infant_mortality_rate_1990", NA,
    "infant_mortality_rate_2022", NA,
    "neonatal_mortality_rate_1990", NA,
    "neonatal_mortality_rate_2000", NA,
    "neonatal_mortality_rate_2022", NA,
    "among5-14_mortality_rate_1990", NA,
    "among5-14_mortality_rate_2022", NA,
    "stillbirth_rate_2000", NA,
    "stillbirth_rate_2921", NA,
    "stillbirth_rate_annual_rate_of_reduction_2000-2021", NA,
    "under5_deaths_2022", NA,
    "neonatal_deaths_2022", NA,
    "neonatal_deaths_out_of_under5_deaths_2022", NA,
    "among5-14_deaths_2022", NA,
    "stillbirths_2021"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric)) %>% 
  rename(among5_14_mortality_rate_2022 = "among5-14_mortality_rate_2022")

# 3. Maternal and Newborn Health -----------------------------------------------
mother_newborn_health <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 3,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "life_expectancy_at_birth_female_2023", NA,
    "UHC_reproductive_maternal_newborn_child_health_2021", NA,
    "family_planning_modern_methods_perc_2017-2023", NA,
    "antenatal_care_perc_2017-2023_1", NA,
    "antenatal_care_perc_2017-2023_4", NA,
    "delivery_care_perc_2017-2023_skilled_attendant", NA,
    "delivery_care_perc_2017-2023_institution", NA,
    "delivery_care_perc_2017-2023_c-section", NA,
    "postnatal_health_check_perc_2017-2023_newborn", NA,
    "postnatal_health_check_perc_2017-2023_mother", NA,
    "maternal_mortality_2020_count", NA,
    "maternal_mortality_2020_ratio", NA,
    "maternal_mortality_2020_lifetime_risk"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 4. Child Health --------------------------------------------------------------
child_health <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 4,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "vaccinated_perc_2023_BCG", NA,
    "vaccinated_perc_2023_DTP1", NA,
    "vaccinated_perc_2023_DTP3", NA,
    "vaccinated_perc_2023_Polio3", NA,
    "vaccinated_perc_2023_MCV1", NA,
    "vaccinated_perc_2023_MCV2F", NA,
    "vaccinated_perc_2023_HepB3", NA,
    "vaccinated_perc_2023_Hib3", NA,
    "vaccinated_perc_2023_Rota", NA,
    "vaccinated_perc_2023_PCV3", NA,
    "vaccinated_perc_2023_PAB_tetanus", NA,
    "accute_respiratory_infection_care_perc_2017-2023", NA,
    "diarrhoea_oral_rehydration_perc_2017-2023", NA,
    "malaria_fever_care_perc_2017-2023", NA,
    "malaria_sleeping_ITNs_perc_2017-2023", NA,
    "malaria_household_with_ITN_perc_2017-2023", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 5. Adolescent Health ---------------------------------------------------------
adolescent_health <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 5,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "among10-19_mortality_rate_2022", NA,
    "among10-19_deaths_2022", NA,
    "among10-19_mortality_rate_annual_rate_of_reduction_2010-2022", NA,
    "among10-14_birth_rate_2017-2023_female", NA,
    "among15-19_birth_rate_2017-2023_female", NA,
    "among20-24_births_by_18_perc_2017-2023_female", NA,
    "among15-19_family_planning_modern_methods_perc_2017-2023_female", NA,
    "among15-19_informed_reproductive_health_perc_2017-2023_female", NA,
    "among15-19_antenatal_care_perc_2017-2023_4", NA,
    "among15-19_skilled_birth_attendant_perc_2017-2023", NA,
    "vaccinated_HPV_perc_2023_female", NA,
    "among15-19_risk_alcohol_2016_male", NA,
    "among15-19_risk_alcohol_2016_female", NA,
    "among13-15_risk_tobacco_2022_male", NA,
    "among13-15_risk_tobacco_2022_female", NA,
    "among11-17_risk_no_physical_activity_2016_male", NA,
    "among11-17_risk_no_physical_activity_2016_female"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 6. HIV AIDS Epidemiology -----------------------------------------------------
hiv_aids_epi <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 6,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "among0-14_new_HIV_per1000", 
    "among15-19_new_HIV_per1000",
    "among15-19_new_HIV_per1000_female", 
    "among15-19_new_HIV_per1000_male",
    "among0-14_death_AIDS_per100000", 
    "among10-19_death_AIDS_per100000", 
    "among10-19_death_AIDS_per100000_female", 
    "among10-19_death_AIDS_per100000_male", 
    "among0-14_with_HIV", 
    "among10-19_with_HIV",
    "among10-19_with_HIV_female", 
    "among10-19_with_HIV_male"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 7. HIV AIDS Intervention Coverage --------------------------------------------
hiv_aids_cover <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 7,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "pregnent_with_HIV_PMTCT_perc",
    "early_infant_HIV_perc",
    "among0-14_with_HIV_ART_perc",
    "among10-19_with_HIV_ART_perc",
    "among15-19_know_HIV_2012-2023_male", NA,
    "among15-19_know_HIV_2012-2023_female", NA,
    "among15-19_use_condom_2012-2023_male", NA,
    "among15-19_use_condom_2012-2023_female", NA,
    "among15-19_tested_HIV_last_12m_perc_2012-2023_male", NA,
    "among15-19_tested_HIV_last_12m_perc_2012-2023_female", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 8. Nutrition: ----------------------------------------------------------------
# Newborns, Preschool/school Age Children, Women and Households
nutrition_children_women_household <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 8,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "weight_at_birth_low_perc_2020", NA,
    "weight_at_birth_unweighed_perc_2012-2021", NA,
    "stunted_perc_2022", NA,
    "among0-4_wasted_perc_2016-2023_servere", NA,
    "among0-4_wasted_perc_2016-2023_moderate_severe", NA,
    "among0-4_overweight_perc_2022", NA,
    "among6-59m_vitamin_A_full_perc_2022", NA,
    "among5-19_thinness_perc_2022", NA,
    "among5-19_overweight_perc_2022", NA,
    "over18_underweight_perc_2022_female", NA,
    "among15-49_anaemia_perc_2019_female", NA,
    "household_consuming_iodized_salt_perc_2016-2022", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 9. Nutrition: Breastfeeding and Diets ----------------------------------------
nutrition_feeding <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 9,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "among0-23m_early_breastfeeding_perc", NA,
    "among0-6m_exclusive_breastfeeding_perc", NA,
    "among6-8m_solid_semi-solid_soft_foods_perc", NA,
    "among12-23m_continued_breastfeeding_perc", NA,
    "among12-23m_continued_breastfeeding_perc_poorest20", NA,
    "among12-23m_continued_breastfeeding_perc_richest20", NA,
    "among6-23m_servere_food_poverty_perc", NA,
    "among6-23m_moderate_food_poverty_perc", NA,
    "among6-23m_minimum_dietary_diversity_perc", NA,
    "among6-23m_minimum_meal_frequency_perc", NA,
    "among6-23m_minimum_acceptable_diet_perc", NA,
    "among6-23m_zero_vegetable_or_fruit_perc", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 10. Early Childhood Development ----------------------------------------------
early_childhoo_development <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 10,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "attendance_ece_perc_2015-2023", NA,
    "attendance_ece_perc_2015-2023_male", NA,
    "attendance_ece_perc_2015-2023_female", NA,
    "attendance_ece_perc_2015-2023_poorest20", NA,
    "attendance_ece_perc_2015-2023_richest20", NA,
    "stimulation_and_responsive_care_perc_2015-2023", NA,
    "stimulation_and_responsive_care_perc_2015-2023_male", NA,
    "stimulation_and_responsive_care_perc_2015-2023_female", NA,
    "stimulation_and_responsive_care_perc_2015-2023_poorest20", NA,
    "stimulation_and_responsive_care_perc_2015-2023_richest201", NA,
    "learning_at_home_perc_2015-2023_books", NA,
    "learning_at_home_perc_2015-2023_play", NA,
    "inadequate_supervision_perc_2015-2023", NA,
    "inadequate_supervision_perc_2015-2023_male", NA,
    "inadequate_supervision_perc_2015-2023_female", NA,
    "inadequate_supervision_perc_2015-2023_poorest20", NA,
    "inadequate_supervision_perc_2015-2023_richest20", NA,
    "development_on_track_perc_2015-2023", NA,
    "development_on_track_perc_2015-2023_male", NA,
    "development_on_track_perc_2015-2023_female", NA,
    "development_on_track_perc_2015-2023_poorest20", NA,
    "development_on_track_perc_2015-2023_richest201", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 11. Education ----------------------------------------------------------------
education <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 11,
  skip = 8,
  n_max = 217,
  col_names = c(
    "country", 
    "out_of_school_rate_2000-2024_primary", NA,
    "out_of_school_rate_2000-2024_lower_secondary", NA,
    "out_of_school_rate_2000-2024_upper_secondary", NA,
    "completion_rate_2000_2023_primary", NA,
    "completion_rate_2000-2023_lower_secondary", NA,
    "completion_rate_2000-2023_upper_secondary", NA,
    "numerical_skills_2014-2022", NA,
    "numerical_skills_2014-2022_male", NA,
    "numerical_skills_2014-2022_female", NA,
    "reading_skills_2014-2022", NA,
    "reading_skills_2014-2022_male", NA,
    "reading_skills_2014-2022_female", NA,
    "learning_poverty_rate_2001-2022", NA,
    "learning_poverty_rate_2001-2022_male", NA,
    "learning_poverty_rate_2001-2022_female", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 12. Child Protection ---------------------------------------------------------
child_protection <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 12,
  skip = 8,
  n_max = 217,
  col_names = c(
    "country", 
    "child_labour_perc_2015-2023", NA,
    "child_labour_perc_2015-2023_male", NA,
    "child_labour_perc_2015-2023_female", NA,
    "child_marriage_perc_2015-2023_male", NA,
    "child_marriage_perc_2015-2023_female", NA,
    "under1_birth_registration_perc_2014-2023", NA,
    "under5_birth_registration_perc_2014-2023", NA,
    "under5_birth_registration_perc_2014-2023_male", NA,
    "under5_birth_registration_perc_2014-2023_female", NA,
    "female_genital_mutilation_perc_prevalence_perc_women", NA,
    "female_genital_mutilation_perc_prevalence_perc_girl", NA,
    "female_genital_mutilation_perc_attitude_perc", NA,
    "justification_of_wife-beating_adolescents_perc_2015-2022_male", NA,
    "justification_of_wife-beating_adolescents_perc_2015-2022_female", NA,
    "violent_discipline_perc_2015-2023", NA,
    "violent_discipline_perc_2015-2023_male", NA,
    "violent_discipline_perc_2015-2023_female", NA,
    "sexual_violonce_in_childhood_perc_2014-2022_male", NA,
    "sexual_violonce_in_childhood_perc_2014-2022_female", NA,
    "children_in_residential_care_per100000_2010-2023", NA,
    "children_in_detention_per100000_2013-2023", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 13. Social Protection and Equity ---------------------------------------------
social_protection <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 13,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "new_mothers_cash_benefit_perc_2015-2023",
    "children_covered_by_social_protection_perc_2015-2023", NA,
    "social_protection_benefits_perc_2015-2021_bottom40", 
    "social_protection_benefits_perc_2015-2021_top20", 
    "social_protection_benefits_perc_2015-2021_bottom20", 
    "share_of_household_income_2015-2023_bottom40",
    "share_of_household_income_2015-2023_top20",
    "share_of_household_income_2015-2023_bottom20",
    "gini_coefficient_2015-2023", 
    "palma_index_2015-2023", 
    "VMIR_2010-2019",
    "GDP_per_capita_2015_2023",
    "children_material_deprivation_2011-2019_1D", NA,
    "children_material_deprivation_2011-2019_2D", NA,
    "children_material_deprivation_2011-2019_3D", NA,
    "children_material_deprivation_2011-2019_more"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))

# 14. WASH ---------------------------------------------------------------------
wash <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 14,
  skip = 8,
  n_max = 217,
  col_names = c(
    "country", 
    "basic_drinking_household_perc_2022", NA,
    "basic_drinking_household_perc_2022_urban", NA,
    "basic_drinking_household_perc_2022_rural", NA,
    "basic_sanitation_household_perc_2022", NA,
    "basic_sanitation_household_perc_2022_urban", NA,
    "basic_sanitation_household_perc_2022_rural", NA,
    "basic_hygiene_household_perc_2022", NA,
    "basic_hygiene_household_perc_2022_urban", NA,
    "basic_hygiene_household_perc_2022_rural", NA,
    "basic_water_school_perc_2023", NA,
    "basic_water_school_perc_2023_primary", NA,
    "basic_water_school_perc_2023_secondary", NA,
    "basic_sanitation_school_perc_2023", NA,
    "basic_sanitation_school_perc_2023_primary", NA,
    "basic_sanitation_school_perc_2023_secondary", NA,
    "basic_hygiene_school_perc_2023", NA,
    "basic_hygiene_school_perc_2023_primary", NA,
    "basic_hygiene_school_perc_2023_secondary", NA,
    "basic_water_healthcare_perc_2023", NA,
    "basic_sanitation_healthcare_perc_2023", NA,
    "basic_hygiene_healthcare_perc_2023", NA,
    "basic_waste_management_healthcare_perc_2023"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 15. Adolescents --------------------------------------------------------------
adolescents <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 15,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "population_thousands_10-19", NA,
    "population_prop_10-19", NA,
    "thinness_2022", NA,
    "overweight_2022", NA,
    "intimate_partner_violence_perc_2015-2022_female", NA,
    "bullying_perc_2011-2019_male", NA,
    "bullying_perc_2011-2019_female", NA,
    "proficiency_math_2014-2019_male", NA,
    "proficiency_math_2014-2019_female", NA,
    "proficiency_reading_2014-2019_male", NA,
    "proficiency_reading_2014-2019_female", NA,
    "not_school_employment_training_perc_2015-2023_male", NA,
    "not_school_employment_training_perc_2015-2023_female", NA,
    "unemployed_perc_2015-2023_male", NA,
    "unemployed_perc_2015-2023_female", NA,
    "household_chores_perc_2015-2023_male", NA,
    "household_chores_perc_2015-2023_female", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 16. Children with Disabilities -----------------------------------------------
disabilities <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 16,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "among2-17_with_disabilities_perc_2017-2023", NA,
    "among2-4_with_disabilities_perc_2017-2023", NA,
    "among5-17_with_disabiltiites_perc_2017-2023", NA,
    "underweight_among_disabilities_perc_2017-2023", NA,
    "underweight_among_no_disability_perc_2017-2023", NA,
    "stunting_among_disabilities_perc_2017-2023", NA,
    "stunting_among_no_disability_perc_2017-2023", NA,
    "early_stimulation_responsive_care_among_disabilities_perc_2017-2023", NA,
    "early_stimulation_responsive_care_among_no_disability_perc_2017-2023", NA,
    "ece_among_disabilities_perc_2017-2023", NA,
    "ece_among_no_disability_perc_2017-2023", NA,
    "no_school_among_disabilities_perc_2017-2023", NA,
    "no_school_among_no_disability_perc_2017-2023", NA,
    "foundational_learning_skills_among_disabilities_perc_2017-2023", NA,
    "foundational_learning_skills_among_no_disability_perc_2017-2023", NA,
    "severe_physical_punishment__among_disabilities_perc_2017-2023", NA,
    "severe_physical_punishment_among_no_disability_perc_2017-2023", NA,
    "basic_sanitation_among_disabilities_perc_2017-2023", NA,
    "basic_sanitation_among_no_disability_perc_2017-2023", NA,
    "social_transfers_among_disabilities_perc_2017-2023", NA,
    "social_transfers_among_no_disability_perc_2017-2023", NA
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 17. Women's Economic Empowerment ---------------------------------------------
women_empowered <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 17,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "SIGI_2023",
    "legal_gender_equality_in_employment_201802022",
    "maternity_leave_benefits_2024",
    "paternity_leave_benefits_2024",
    "attained_upper_secondary_education_perc_2014-2023_male", NA,
    "attained_upper_secondary_education_perc_2014-2023_female", NA,
    "labour_force_participation_rate_2019-2023_rural_male", NA,
    "labour_force_participation_rate_2019-2023_urban_male", NA,
    "labour_force_participation_rate_2019-2023_male", NA,
    "labour_force_participation_rate_2019-2023_rural_female", NA,
    "labour_force_participation_rate_2019-2023_urban_male", NA,
    "labour_force_participation_rate_2019-2023_female", NA,
    "unemployment_rate_2019-2023_rural_male", NA,
    "unemployment_rate_2019-2023_urban_male", NA,
    "unemployment_rate_2019-2023_male", NA,
    "unemployment_rate_2019-2023_rural_female", NA,
    "unemployment_rate_2019-2023_urban_female", NA,
    "unemployment_rate_2019-2023_female", NA,
    "mobile_phone_ownership_perc_2014-2023_male", NA,
    "mobile_phone_ownership_perc_2014-2023_female", NA,
    "financial_inclusion_perc_2014-2022_male", 
    "financial_inclusion_perc_2014-2022_female", 
    "time_use_perc_2014-2023_male", 
    "time_use_perc_2014-2023_female"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(
    across(
      -c(country, maternity_leave_benefits_2024, paternity_leave_benefits_2024), 
      as.numeric
    )
  )
# 18. Migration ----------------------------------------------------------------
migration <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 18,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "international_migration_thousands_2020",
    "under18_international_migration_thousands_2020",
    "international_migration_thousands_perc_2020",
    "refugees_by_asylum_country_2023", 
    "under18_refugees_by_asylum_country_2023", 
    "refugees_by_asylum_country_per1000_2023", 
    "refugees_by_asylum_country_per1USDGNIperCapita_2023", 
    "refugees_by_origin_country_2023",
    "under18_refugees_by_origin_country_2023",
    "internally_displaced_persons_2023",
    "under18_internally_displaced_persons_2023",
    "internally_displaced_persons_due_to_conflict_and_violence_perc_2023",
    "internally_displaced_persons_due_to_disaster_perc_2023",
    "new_internal_displacements_2023",
    "under18_new_internal_displacements_2023",
    "new_internal_displacements_due_to_conflict_and_violence_perc_2023",
    "new_internal_displacements_due_to_disaster_perc_2023"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))
# 19. Economic Indicators ------------------------------------------------------
economic_indicators <- read_excel(
  path = "SOWC_tables.xlsx",
  sheet = 19,
  skip = 7,
  n_max = 217,
  col_names = c(
    "country", 
    "government_revenue_perc_of_GDP_2015-2023", NA,
    "government_expenditure_perc_of_GDP_2015_2023", NA,
    "health_government_expenditure_perc_of_GDP_2015_2023", NA,
    "education_government_expenditure_perc_of_GDP_2015_2023", NA,
    "social_protection_government_expenditure_perc_of_GDP_2015_2023", NA,
    "health_government_expenditure_perc_of_budget_2015_2023", NA,
    "education_government_expenditure_perc_of_budget_2015_2023", NA,
    "social_protection_government_expenditure_perc_of_budget_2015_2023", NA,
    "inflow_official_development_assistance_million_USD_2015-2023", NA,
    "inflow_official_development_assistance_perc_of_GNI_2015-2023", NA,
    "outflow_official_development_assistance_million_USD_2015-2023", NA,
    "outflow_official_development_assistance_perc_of_GNI_2015-2023"
  )
) |>
  select(-starts_with("...")) |>
  filter(!is.na(country), country != "SUMMARY") |>
  mutate(across(-country, as.numeric))



library(dplyr)
library(tidyr)
library(readxl)
library(countrycode)

# Load datasets
WorldHappiness <- read_excel("WHR23_Data_Figure_2.1.xls")
AirPollution <- read.csv("API_EN.ATM.PM25.MC.M3_DS2_en_csv_v2_6084.csv", skip = 4)
InternetAccess <- read.csv("API_IT.NET.USER.ZS_DS2_en_csv_v2_280824.csv", skip = 4)
GDPperCapita <- read.csv("API_NY.GDP.PCAP.CD_DS2_en_csv_v2_280671.csv", skip = 4)

country_rank <- WorldHappiness %>%
  mutate(rank = row_number()) %>%
  select(country = `Country name`, happiness_rank = rank)

extract_latest <- function(df, country_col = "Country.Name") {
  
  df_long <- df %>%
    rename(country = !!country_col) %>%
    select(country, starts_with("X")) %>%
    pivot_longer(
      cols = starts_with("X"),
      names_to = "year",
      values_to = "value"
    ) %>%
    mutate(year = as.numeric(gsub("X", "", year))) %>%
    arrange(country, desc(year)) %>%
    group_by(country) %>%
    summarise(latest_value = value[which(!is.na(value))[1]], .groups = "drop")
  
  return(df_long)
}

# Extract recent values
air_latest   <- extract_latest(AirPollution) %>% rename(pm25_latest = latest_value)
internet_latest <- extract_latest(InternetAccess) %>% rename(internet_latest = latest_value)
gdp_latest <- extract_latest(GDPperCapita) %>% rename(gdp_latest = latest_value)

child_outcomes <- demographics %>%
  select(country,
         life_expectancy_at_birth_2023,
         population_2023_thousands_under18) %>%
  
  left_join(mortality %>% select(country, among5_14_mortality_rate_2022), by = "country") %>%
  left_join(education %>% select(country, completion_rate_2000_2023_primary), by = "country") %>%
  left_join(wash %>% select(country, basic_sanitation_household_perc_2022), by = "country") %>%
  left_join(nutrition_children_women_household %>% select(country, stunted_perc_2022), by = "country") %>%
  
  left_join(air_latest, by = "country") %>%
  left_join(internet_latest, by = "country") %>%
  left_join(gdp_latest, by = "country") %>%
  left_join(country_rank, by = "country") %>%
  
  # Keep raw values as separate columns
  mutate(
    life_expectancy_at_birth_2023_raw = life_expectancy_at_birth_2023,
    among5_14_mortality_rate_2022_raw = among5_14_mortality_rate_2022,
    completion_rate_2000_2023_primary_raw = completion_rate_2000_2023_primary,
    basic_sanitation_household_perc_2022_raw = basic_sanitation_household_perc_2022,
    stunted_perc_2022_raw = stunted_perc_2022,
    pm25_latest_raw = pm25_latest,
    internet_latest_raw = internet_latest,
    gdp_latest_raw = gdp_latest,
    happiness_rank_raw = happiness_rank
  ) %>%
  
  # Reverse metrics where lower = better for z-scoring
  mutate(
    among5_14_mortality_rate_2022 = -among5_14_mortality_rate_2022,
    stunted_perc_2022 = -stunted_perc_2022,
    pm25_latest = -pm25_latest,
    happiness_rank = -happiness_rank
  ) %>%
  
  # Scale the metrics for index calculation
  mutate(across(
    c(life_expectancy_at_birth_2023,
      among5_14_mortality_rate_2022,
      completion_rate_2000_2023_primary,
      basic_sanitation_household_perc_2022,
      stunted_perc_2022,
      pm25_latest,
      internet_latest,
      gdp_latest,
      happiness_rank),
    ~ as.numeric(scale(.x))
  )) %>%
  
  # Compute child wellbeing index
  rowwise() %>%
  mutate(
    child_wellbeing_index = mean(
      c(
        life_expectancy_at_birth_2023,
        among5_14_mortality_rate_2022,
        completion_rate_2000_2023_primary,
        basic_sanitation_household_perc_2022,
        stunted_perc_2022,
        pm25_latest,
        internet_latest,
        gdp_latest,
        happiness_rank
      ),
      na.rm = TRUE
    )
  ) %>%
  ungroup() %>%
  
  mutate(
    iso3 = countrycode(country, "country.name", "iso3c"),
    pop_millions = (population_2023_thousands_under18) / 1000
  )

readr::write_csv(child_outcomes, "worldchildwellbeing3.csv")
# library(ggplot2)
# library(rnaturalearth)
# library(rnaturalearthdata)
# library(sf)
# library(ggrepel)
# 
# world <- ne_countries(scale = "medium", returnclass = "sf")
# 
# # Merge child data with coordinates
# world_points <- world %>%
#   st_centroid() %>%
#   st_coordinates() %>%
#   as.data.frame() %>%
#   bind_cols(world %>% st_drop_geometry()) %>%
#   left_join(child_outcomes, by = c("iso_a3" = "iso3"))
# 
# world_points <- world_points %>%
#   mutate(pop_millions = (population_2023_thousands_under18 *186913 + 39806) / 1000)
# 
# # Identify best and worst countries
# top_country <- world_points %>%
#   filter(!is.na(child_wellbeing_index)) %>%
#   slice_max(child_wellbeing_index, n = 1)
# 
# bottom_country <- world_points %>%
#   filter(!is.na(child_wellbeing_index)) %>%
#   slice_min(child_wellbeing_index, n = 1)
# 
# 
# # Bubble maps
# 
# highlight_countries <- bind_rows(top_country, bottom_country) %>%
#   mutate(halo_color = ifelse(child_wellbeing_index == max(child_wellbeing_index, na.rm = TRUE),
#                              "green", "red"))
# ggplot() +
#   # Base map
#   geom_sf(data = world, fill = "grey95", color = "grey80") +
#   
#   # Main bubbles
#   geom_point(
#     data = world_points %>% 
#       filter(!is.na(pop_millions), !is.na(child_wellbeing_index)),
#     aes(x = X, y = Y, size = pop_millions, color = child_wellbeing_index),
#     alpha = 0.8
#   ) +
#   
#   # Halo effect around top and bottom country
#   geom_point(
#     data = highlight_countries,
#     aes(x = X, y = Y),
#     color = highlight_countries$halo_color,
#     size = 6,
#     alpha = 0.5
#   ) +
#   
#   geom_point(
#     data = highlight_countries,
#     aes(x = X, y = Y, size = pop_millions, color = child_wellbeing_index),
#     alpha = 1
#   ) +
#   
#   # Annotations
#   geom_text_repel(
#     data = highlight_countries,
#     aes(x = X, y = Y, label = country),
#     size = 3.8,
#     fontface = "bold",
#     color = "black",
#     box.padding = 0.5,
#     point.padding = 0.5,
#     segment.color = "grey50",
#     segment.size = 0.7,
#     nudge_x = c(1, -1),
#     nudge_y = c(1, -1),
#     max.overlaps = 10
#   ) +
#   
#   # Scales
#   scale_color_viridis_c(option = "plasma", name = "Child Well-being Index") +
#   scale_size_area(
#     name = "Population under 18 (millions)",
#     max_size = 15,
#     breaks = c(10, 50, 200, 1000),
#     labels = c("10M", "50M", "200M", "1B"),
#     guide = "legend"
#   ) +
#   
#   # Labels
#   labs(
#     title = "Global Distribution of Child Well-Being (2022–23)",
#     subtitle = "Top and bottom countries highlighted with halo outlines",
#     caption = "Source: UNICEF State of the World's Children (2023)"
#   ) +
#   
#   # Legends and theme
#   guides(
#     size = guide_legend(order = 1),
#     color = guide_colorbar(order = 2)
#   ) +
#   theme_minimal() +
#   theme(
#     legend.position = "bottom",
#     legend.box = "vertical",
#     legend.box.just = "center"
#   )

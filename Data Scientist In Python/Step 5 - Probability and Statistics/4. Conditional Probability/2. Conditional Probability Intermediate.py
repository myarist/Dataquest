## 1. An Important Difference ##

p_m = 515/2000
p_m_given_l = 32/90
p_m_and_l = 32/2000

p_l = 90/2000
p_m_or_l = p_m + p_l - p_m_and_l

## 2. Complements ##

p_b_given_m = 0.1486
p_c_given_l = 0.0928
p_non_b_given_c = 0.7622
p_non_b_given_m = 1 - p_b_given_m
p_non_c_given_l = 1 - p_c_given_l
p_b_given_c = 1 - p_non_b_given_c
p_b_given_non_m = 'not possible'

## 3. Order of Conditioning ##

p_m_given_non_l = 483/1910
p_non_l_given_m = 483/515
p_m_and_non_l = 483/2000
p_non_l_and_m = 483/2000

## 4. The Multiplication Rule ##

p_ram = 0.0822
p_gl = 0.0184
p_ram_given_gl = 0.0022
p_gl_and_ram = p_gl * p_ram_given_gl
p_non_ram_given_gl = 1 - p_ram_given_gl
p_gl_and_non_ram = p_gl * p_non_ram_given_gl
p_gl_or_ram = p_gl + p_ram - p_gl_and_ram

## 5. Statistical Independence ##

k_and_l = 'independent'
l_and_m = 'independent'
k_and_m = 'dependent'

## 6. Statistical Dependence ##

# Exercise 1 & 2
l_and_m = 'dependent'
l_and_non_m = 'dependent'

# Exercise 3
p_l = 90/2000
p_m_given_l = 32/90
p_l_and_m = p_l * p_m_given_l

# Exercise 4
p_not_m_given_l = 58/90
p_l_and_non_m = p_l * p_not_m_given_l

## 7. Independence for Three Events ##

p_et = 0.0432
p_ac = 0.0172
p_ps = 0.0236
p_et_and_ps = p_et * p_ps
p_et_and_ac = p_et * p_ac
p_ac_and_ps = p_ac * p_ps
p_et_and_ac_and_ps = p_et * p_ac * p_ps

## 8. Formula for Three Dependent Events ##

p_non_ls = 0.9821
p_cw_given_ls = 0.0079
p_l_given_ls_and_cw = 0.2908
p_ls = 1 - p_non_ls
p_ls_and_cw_and_l = p_ls * p_cw_given_ls * p_l_given_ls_and_cw
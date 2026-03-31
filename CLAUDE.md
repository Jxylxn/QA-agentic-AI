# KYC QA Agent — CLAUDE.md

## Project Overview

This project is for QA test case creation for **Bitazza KYB-KYC Webview** — a web-based KYC onboarding flow supporting two regions:
- **TH** — Thailand region
- **GL** — Global region

The source of truth is `Master TC/Master TC KYC.xlsx`. All new test cases must follow the exact format and conventions established in that file.

---

## Repository Structure

```
KYC QA Agent/
└── Master TC/
    └── Master TC KYC.xlsx       # Master test case file (source of truth)
```

Screen references are hosted on **Figma** (see Screen Reference Index below).

---

## KYC Flow Overview

There are 3 distinct flows: **TH Onboarding**, **GL Onboarding**, and **EDD** (TH only).

---

### TH Onboarding Flow

1. **Login** → Enter email + password
2. **Select Nationality** → TH or Non-TH
3. **Term & Condition** → TH-specific content
4. **General Instruction** → TH-specific content
5. **Liveness Instruction** → TH-specific content
6. **Sumsub** → ID Card (TH) or Passport (Non-TH) scan + liveness/facial check
7. **General Information** → Title, Name, DOB, Gender, etc.
8. **Identity Information** → ID card or Passport details
9. **Address Information** → Permanent address, Current address, Occupation and Workplace
10. **Background Information** → Occupation, source of income
11. **Disclosure Information** → PEP/conflict of interest declarations + proof of fund upload
12. **Financial Information** → Income, net worth
13. **FATCA Questionnaire** → US person tax status
14. **Additional Documents** → ThaiD + 1 supporting doc (TH nationality) or 2 supporting docs (Non-TH)
15. **Info Summary** → Review all submitted info
16. **Suitability Test** → Investment suitability questionnaire
17. **Knowledge Test** → Investment knowledge quiz
18. **Pending Review** → KYC under review (TH-specific content)
19. **Approved** → KYC approved (TH-specific content)

---

### GL Onboarding Flow

GL has **7 steps only** — no Additional Documents, no Suitability/Knowledge Test.

1. **Login** → Enter email + password
2. **Select Nationality** → TH or Non-TH
3. **Term & Condition** → GL-specific content (differs from TH)
4. **General Instruction** → GL-specific content
5. **Liveness Instruction** → GL-specific content
6. **Sumsub** → ID Card (TH) or Passport (Non-TH) scan + liveness/facial check
7. **General Information** → Title, Name, DOB, Gender, etc.
8. **Identity Information** → ID card or Passport details
9. **Address Information** → Permanent address, Current address, Occupation and Workplace
10. **Background Information** → Occupation, source of income
11. **Disclosure Information** → PEP/conflict of interest declarations (**no proof of fund upload**)
12. **Financial Information** → Income, net worth
13. **FATCA Questionnaire** → US person tax status
14. **Info Summary** → Review all submitted info
15. **Pending Review** → KYC under review (GL-specific content, differs from TH & EDD)
16. **Approved** → KYC approved (GL-specific content, differs from TH & EDD)

---

### EDD Flow (TH region only)

EDD (Enhanced Due Diligence) is a separate re-verification flow triggered for existing TH users. It does **not** start from Select Nationality or Sumsub.

1. **Login** → Enter email + password
2. **General Instruction** → EDD-specific content (different from TH onboarding)
3. **Resubmit Page** → User reviews and resubmits documents (ID card front/back or passport)
4. **General Information** → Limited fields only: Title, Gender, Marital Status, Mobile number (re-enter only)
5. **Identity Information** → ID card or Passport details
6. **Address Information** → Same as TH onboarding
7. **Background Information** → Same as TH onboarding
8. **Disclosure Information** → Same as TH onboarding (with proof of fund upload)
9. **Financial Information** → Same as TH onboarding
10. **Additional Documents** → Same as TH onboarding
11. **Info Summary** → Same as TH onboarding
12. **Test Instruction** → EDD-specific: Suitability Test only (Knowledge Test shows green checkmark — already completed)
13. **Suitability Test** → Same questions as TH onboarding
14. **Pending Review** → EDD-specific content (differs from TH onboarding & GL)
15. **Approved** → Same as TH onboarding

---

### Flow Comparison

| Step | TH | GL | EDD |
|---|---|---|---|
| Login | Yes | Yes | Yes |
| Select Nationality | Yes | Yes | No |
| Term & Condition | Yes (TH content) | Yes (GL content) | No |
| General Instruction | Yes | Yes | Yes (EDD content) |
| Liveness Instruction | Yes | Yes | No |
| Sumsub | Yes | Yes | No |
| Resubmit Page | No | No | Yes |
| General Information | Full form | Full form | Title, Gender, Marital Status, Mobile only |
| Identity Information | Yes | Yes | Yes |
| Address Information | Yes | Yes | Yes |
| Background Information | Yes | Yes | Yes |
| Disclosure Information | Yes + proof of fund | Yes, no proof of fund | Yes + proof of fund |
| Financial Information | Yes | Yes | Yes |
| FATCA Questionnaire | Yes | Yes | No |
| Additional Documents | Yes | No | Yes |
| Info Summary | Yes | Yes | Yes |
| Test Instruction | Both tests | No | Suitability only (Knowledge pre-checked) |
| Suitability Test | Yes | No | Yes |
| Knowledge Test | Yes | No | No (pre-checked) |
| Pending Review | TH content | GL content | EDD content |
| Approved | TH content | GL content | TH content |

---

## Master TC Sheet Index

| Sheet Name | Description | Approx. TCs |
|---|---|---|
| `Regression_KYC` | Full regression suite | 84 |
| `Smoke_KYC` | Smoke test suite | 43 |
| `E2E_KYC` | End-to-end flow tests | 176 |
| `E2E_Flow` | E2E flow variations | 21 |
| `TCM_ALL_E2E` | E2E master collection | 53 |
| `Login_Onboard` | Login & onboarding | 75 |
| `Select_Nationality` | Nationality selection | 14 |
| `Term_condition` | Term condition page | 22 |
| `sumsub` | Sumsub document scan & liveness | 37 |
| `General_info 18` | General information form | 28 |
| `Identity_Info 28` | Identity information form | 53 |
| `Address_Info 38` | Address information form | 27 |
| `Background_Info 48` | Background information form | 29 |
| `Disclosure_Info 58` | Disclosure information form | 35 |
| `Financial_Info 68` | Financial information form | 14 |
| `Fatca 78` | FATCA questionnaire | 8 |
| `Additional_Docs 88` | Additional documents upload | 18 |
| `Info_Summary` | Info summary review page | 7 |
| `Test_Instruction` | Test instruction page | 26 |
| `Submit_KYC` | KYC submission | 19 |
| `Page_Not_Found` | 404/invalid URL handling | 30 |
| `KYT` | Know Your Transaction | 73 |
| `OB_Soft_Approval` | Onboarding soft approval | 77 |
| `Multiple_Additional` | Multiple additional info | 96 |
| `KYCmaintenance` | KYC maintenance | 13 |
| `KYC-event Notifications` | Event notification emails | 59 |
| `EDD_Soft_Approval` | Enhanced Due Diligence soft approval | 31 |
| `EDD_Soft_Approval_PH.2` | EDD soft approval phase 2 | 28 |
| `Search_Console` | Search in admin console | 58 |
| `Mule_Account_PH.4` | Mule account detection phase 4 | 54 |
| `Auto Soft freeze` | Auto soft freeze feature | 78 |
| `API_remark_check` | API remark validation | 45 |
| `Login_EDD` | Login for EDD flow | 18 |

---

## Test Case Structure

Every test case MUST contain the following columns (in order):

| # | Column | Description | Example Values |
|---|---|---|---|
| 0 | **Feature** | Product area | `KYC webview`, `KYC WEBVIEW`, `Sumsub` |
| 1 | **Function** | Main feature group | `On-Boarding`, `Page Not Found`, `Sumsub Webview` |
| 2 | **Sub function** | Specific sub-feature | `General Information`, `Navigation`, `KYC Webview` |
| 4 | **TC ref** | Sequential TC number within sheet | `1`, `2`, `3` |
| 5 | **Title** | TC title — must start with "Verify" | `Verify that user can navigate to...` |
| 6 | **Platform** | Target platform/region | `TH`, `GL`, `GL & TH` |
| 8 | **Preconditions** | What must be true before test | `User is logged in`, `User submitted sumsub` |
| 9 | **Test data** | Test data, API responses, accounts | API JSON, test email/password |
| 10 | **Step** | Numbered test steps | `1. Click ...\n2. Enter ...\n3. Click ...` |
| 11 | **Expected result** | Numbered expected results (match steps) | `1. Display ...\n2. Show ...\n3. Navigate to ...` |
| 12 | **Test path** | Test type | `Positive`, `Negative` |
| 13 | **Priority** | Test priority | `High`, `Medium`, `Low` |
| 14 | **Complexity** | Implementation complexity | `High`, `Medium`, `Low` |
| 15 | **Regression** | Include in regression | `Yes`, `No` |
| 16 | **To be automate** | Candidate for automation | `Yes`, `No` |
| 17 | **Test Design Status** | Design review status | `Reviewed`, `Ready To Review`, `Draft` |
| 18 | **Reviewer** | Reviewer name | `Tang`, `TT` |
| 23 | **Remark** | Test execution remark | Free text |
| 24 | **JIRA Description** | Auto-composed JIRA description | See format below |

---

## Writing Guidelines

### TC Title
- Always start with **"Verify that..."** or **"Verify ..."**
- Be specific about the scenario being tested
- Examples:
  - `Verify that on-boarding TH user can complete KYC with ID card.`
  - `Verify that system change AP level for user that had 1st deposit correctly.`
  - `Verify Postal Code is Auto-Fill for TH and can Manual input for Non-TH.`

### Test Steps (Col 10)
- Use numbered steps: `1. Step one\n2. Step two\n3. Step three`
- Each step should be a single action
- Be specific: use actual button/field names from the UI
- Reference screenshots in `{TH,GL,EDD}_KYC_SCREEN/` when describing UI elements

### Expected Result (Col 11)
- Numbered to **match each step** exactly
- Sub-results use decimal notation: `1.1`, `1.2`, `2.1`, `2.2`
- Be explicit about UI state, text displayed, navigation, validation messages
- Example:
  ```
  1. Display KYC login page
  2. Display green outline and green text caret at email field
  2.1 Display password field
  3. Navigate to Select Nationality page
  ```

### Preconditions (Col 8)
- List all setup requirements, one per line
- Use numbered list if multiple conditions
- Example:
  ```
  1. User does not exist in system
  2. Create TH_btz Bitazza account
  3. Create Application account
  ```

### Test Data (Col 9)
- Include API endpoint references when applicable
- Include API response format (JSON) for API-dependent TCs
- Include related database
- Include test accounts, URLs, input data
- Example:
  ```
  api/v2/kyc/{kycid}/liveness/check-similarity
  {
    "data": {
      "isReportProcessing": false,
      "isLivenessPassed": true
    }
  }

  DB 1 = bitazza.kyc_approval
  DB 2 = bitazza.user_accounts
  ```

### JIRA Description (Col 24)
Auto-compose in this format:
```
Pre-condition :
{preconditions}

Test Data :
{test data}

Test Step :
{steps}

Expected result :
{expected results}
```

---

## Priority Rules

| Priority | When to use |
|---|---|
| **High** | Core user flows, login, submission, critical validations |
| **Medium** | Field validations, edge cases, secondary flows |
| **Low** | UI polish, minor validations, informational checks |

## Test Path Rules

| Test Path | When to use |
|---|---|
| **Positive** | Happy path — valid inputs, expected normal behavior |
| **Negative** | Invalid inputs, error states, boundary violations, unauthorized access |

## Platform Values

| Value | Meaning |
|---|---|
| `TH` | Thailand region only |
| `GL` | Global region only |
| `GL & TH` | Applies to both regions |

---

## When Writing New Test Cases

1. **Identify the sheet** — place TCs in the correct feature sheet
2. **Continue TC ref numbering** — check the last TC ref in the sheet
3. **Reference screenshots** — open Figma file and navigate to the correct page:
   - TH onboarding → Figma page **"TH onboarding"**
   - GL onboarding → Figma page **"GL onboarding"**
   - EDD flow → Figma page **"EDD flow"**
   - Figma file: `https://www.figma.com/design/JLxd5SCV2LoPVY0DMX4D9f/KYC-QA`
4. **Follow existing patterns** — copy the style of existing TCs in the same sheet
5. **Set Test Design Status** to `Ready To Review` for new TCs (not yet reviewed)
6. **Compose JIRA Description** — always fill Col 24 using the standard format above
7. **Check regression flag** — set `Yes` if the TC should run in every regression cycle
8. **Platform field** — use `TH` for TH/EDD flows, `GL` for GL flow, `GL & TH` only when behavior is truly identical

---

## Screen Reference Index

> **Figma file:** `https://www.figma.com/design/JLxd5SCV2LoPVY0DMX4D9f/KYC-QA`
> All screens are hosted in Figma — 3 pages: **TH onboarding** / **GL onboarding** / **EDD flow**
> Screen names below match the Figma layer names exactly.

---

### TH onboarding — (Figma page: "TH onboarding")

| File | Screen |
|---|---|
| `TH_Login.png` | Login page |
| `TH_Page_not_found.png` | 404 / Invalid URL page |
| `TH_Select_nationality.png` | Nationality selection |
| `TH_Term_condition.png` | Term condition content |
| `TH_General_Instruction.png` | General instruction screen |
| `TH_Liveness_Insrtuction.png` | Liveness check instruction |
| `TH_Sumsub.png` | Sumsub document upload screen |
| `TH_Sumsub_ID_card_front.png` | Sumsub — ID card front scan |
| `TH_Sumsub_ID_card_back.png` | Sumsub — ID card back scan |
| `TH_Sumsub_ID_card_preview.png` | Sumsub — ID card preview |
| `TH_Sumsub_ID_card_failed.png` | Sumsub — scan failed state |
| `TH_Sumsub_facial.png` | Sumsub — facial/liveness check |
| `TH_Sumsub_facial_preview.png` | Sumsub — facial preview |
| `TH_Sumsub_agreement.png` | Sumsub — agreement page |
| `TH_Sumsub_complete.png` | Sumsub — completion screen |
| `TH_General_information_1.png` | General info form (part 1) |
| `TH_General_information_2.png` | General info form (part 2) |
| `TH_Identity_information_ID_card.png` | Identity info — ID card |
| `TH_Permanent_address_TH.png` | Permanent address — TH nationality |
| `TH_Permanent_address_NON_TH.png` | Permanent address — Non-TH nationality |
| `TH_Current_address_TH.png` | Current address — TH nationality |
| `TH_Current_address_NON_TH.png` | Current address — Non-TH nationality |
| `TH_Occupation_address_TH.png` | Occupation & workplace — TH nationality |
| `TH_Occupation_address_NON_TH.png` | Occupation & workplace — Non-TH nationality |
| `TH_Background_information.png` | Background info form |
| `TH_Disclosure_information.png` | Disclosure info form |
| `TH_Disclosure_information_popup.png` | Disclosure — popup modal |
| `TH_Financial_information.png` | Financial info form |
| `TH_Fatca_questionnaire_1-7.png` | FATCA questionnaire steps 1–7 |
| `TH_Additional_information.png` | Additional docs upload |
| `TH_Additional_information_ThaiD.png` | Additional docs — Thai ID variant |
| `TH_Info_summary_1-4.png` | Info summary review (parts 1–4) |
| `TH_Test_instruction.png` | Test instruction (Suitability + Knowledge) |
| `TH_Suitability_test_1-10.png` | Suitability test questions 1–10 |
| `TH_Suitability_test_result.png` | Suitability test result |
| `TH_Knowledge_test_1-10.png` | Knowledge test questions 1–10 |
| `TH_2FA.png` | Two-factor authentication screen |
| `TH_Pending_review.png` | KYC pending review (TH content) |
| `TH_Approved.png` | KYC approved (TH content) |

---

### GL onboarding — (Figma page: "GL onboarding")

| File | Screen |
|---|---|
| `GL_Login.png` | Login page |
| `GL_Page_not_found.png` | 404 / Invalid URL page |
| `GL_Select_nationality.png` | Nationality selection |
| `GL_Term_condition.png` | Term condition content |
| `GL_General_Instruction.png` | General instruction (GL content) |
| `GL_Liveness_Insrtuction.png` | Liveness check instruction (GL content) |
| `GL_Sumsub.png` | Sumsub document upload screen |
| `GL_Sumsub_passport.png` | Sumsub — passport scan |
| `GL_Sumsub_passport_preview.png` | Sumsub — passport preview |
| `GL_Sumsub_ID_card_front.png` | Sumsub — ID card front scan |
| `GL_Sumsub_ID_card_back.png` | Sumsub — ID card back scan |
| `GL_Sumsub_ID_card_preview.png` | Sumsub — ID card preview |
| `GL_Sumsub_ID_card_failed.png` | Sumsub — scan failed state |
| `GL_Sumsub_facial.png` | Sumsub — facial/liveness check |
| `GL_Sumsub_facial_preview.png` | Sumsub — facial preview |
| `GL_Sumsub_agreement.png` | Sumsub — agreement page |
| `GL_Sumsub_complete.png` | Sumsub — completion screen |
| `GL_General_information_1.png` | General info form (part 1) |
| `GL_General_information_2.png` | General info form (part 2) |
| `GL_Identity_information_ID_card.png` | Identity info — ID card |
| `GL_Identity_information_passport.png` | Identity info — passport |
| `GL_Permanent_address_TH.png` | Permanent address — TH nationality |
| `GL_Permanent_address_NON_TH.png` | Permanent address — Non-TH nationality |
| `GL_Current_address_TH.png` | Current address — TH nationality |
| `GL_Current_address_NON_TH.png` | Current address — Non-TH nationality |
| `GL_Occupation_address_TH.png` | Occupation & workplace — TH nationality |
| `GL_Occupation_address_NON_TH.png` | Occupation & workplace — Non-TH nationality |
| `GL_Background_information.png` | Background info form |
| `GL_Disclosure_information.png` | Disclosure info form (no proof of fund) |
| `GL_Financial_information.png` | Financial info form |
| `GL_Fatca_questionnaire_1-7.png` | FATCA questionnaire steps 1–7 |
| `GL_Info_summary_1-4.png` | Info summary review (parts 1–4) |
| `GL_2FA.png` | Two-factor authentication screen |
| `GL_Pending_review.png` | KYC pending review (GL content) |
| `GL_Approved.png` | KYC approved (GL content) |

---

### EDD flow — (Figma page: "EDD flow", TH only)

| File | Screen |
|---|---|
| `EDD_Login.png` | Login page |
| `EDD_Page_not_found.png` | 404 / Invalid URL page |
| `EDD_General_instruction.png` | General instruction (EDD-specific content) |
| `EDD_Resubmit_ID_card_front.png` | Resubmit — ID card front |
| `EDD_Resubmit_ID_card_back.png` | Resubmit — ID card back |
| `EDD_Resubmit_passport.png` | Resubmit — passport |
| `EDD_General_information_1.png` | General info — limited fields (Title, Gender, Marital Status, Mobile) |
| `EDD_General_information_2.png` | General info (part 2) |
| `EDD_Identity_information_ID_card.png` | Identity info — ID card |
| `EDD_Identity_information_passport.png` | Identity info — passport |
| `EDD_Permanent_address_TH.png` | Permanent address — TH nationality |
| `EDD_Permanent_address_NON_TH.png` | Permanent address — Non-TH nationality |
| `EDD_Current_address_TH.png` | Current address — TH nationality |
| `EDD_Current_address_NON_TH.png` | Current address — Non-TH nationality |
| `EDD_Occupation_address_TH.png` | Occupation & workplace — TH nationality |
| `EDD_Occupation_address_NON_TH.png` | Occupation & workplace — Non-TH nationality |
| `EDD_Background_information.png` | Background info form |
| `EDD_Disclosure_information.png` | Disclosure info form |
| `EDD_Disclosure_information_popup.png` | Disclosure — popup modal |
| `EDD_Financial_information.png` | Financial info form |
| `EDD_Additional_information.png` | Additional docs upload |
| `EDD_Additional_information_ThaiD.png` | Additional docs — Thai ID variant |
| `EDD_Info_summary_1-4.png` | Info summary review (parts 1–4) |
| `EDD_Test_instruction.png` | Test instruction (Suitability only; Knowledge pre-checked) |
| `EDD_Suitability_test_1-10.png` | Suitability test questions 1–10 |
| `EDD_Suitability_test_result.png` | Suitability test result |
| `EDD_2FA.png` | Two-factor authentication screen |
| `EDD_Pending_review.png` | EDD pending review (EDD-specific content) |
| `EDD_Approved.png` | EDD approved |

---

## API & Database References

### Environment URLs

| Environment | TH Region | GL Region |
|---|---|---|
| **Staging** | `https://kyc.bitazzax-staging.com/th/v/th` | `https://kyc.bitazza-staging.com/en/v/gl` |
| **Preprod** | `https://kyc.preprod-kyc.bitazza.co.th/th/v/th` (preprod config) | `https://kyc.preprod-kyc.bitazza.com/en/v/gl` |
| **Production** | `https://kyc.bitazza.co.th/th/v/th` | `https://kyc.bitazza.com/en/v/gl` |

**URL Pattern:** `https://kyc.bitazza{-staging}.com/{lang}/v/{region}`
- `{lang}` = `th` (Thai UI) or `en` (English UI)
- `{region}` = `th` (TH flow) or `gl` (GL flow)

**Product Config URLs:**
- Staging TH: `https://public.bitazzax-staging.com/product_configs/product_config.json`
- Staging GL: `https://public.bitazza-staging.com/product_configs/product_config.json`
- Preprod TH: `https://public.bitazza.co.th/product_configs/product_config.json`
- Preprod GL: `https://public.bitazzax.com/product_configs/product_config.json`
- Prod TH: `https://public.bitazza.co.th/product_configs/product_config.json`
- Prod GL: `https://public.bitazzax.com/product_configs/product_config.json`

---

### KYC Onboarding APIs

> **Step numbering** follows the 8-step form flow (1/8 – 8/8) used in the webview.

#### Feature Flags & Product Config
| Method | Endpoint | Description |
|---|---|---|
| GET | `api/feature-flags` | Get feature flag configuration |
| GET | `/product_configs/product_config.json` | Get product config per environment |

#### Login / Session
| Method | Endpoint | Description |
|---|---|---|
| GET | `/user-verification/kyc` | Check KYC session status |
| GET | `/user-verifications` | Check user session — returns `region_code` |
| GET | `/kyc/onboard-application?app_id={1\|2}` | Get KYC application (`app_id=1`=GL, `app_id=2`=TH) |
| POST | `/kyc` | Create KYC record |

#### Select Nationality
| Method | Endpoint | Description |
|---|---|---|
| GET | `/onboard-application?app_id={region}` | Get current nationality — returns `nationality_code: ""` if not set |
| PATCH | `kyc/onboard/{id}/nationality-code` | Update selected nationality |
| POST | `/onboard-application?app_id={region}` | Confirm nationality — returns full KYC object with `nationality_code` |
| GET | `api/nationalities?regionCode=th` | Get nationality list |

**Response body (nationality confirmed):**
```json
{
  "id": "{kycid}",
  "app_id": "{region}",
  "app_id_submit": null,
  "region_code": "{user-region}",
  "nationality_code": "{selected-nationality}"
}
```

#### Term & Condition (User Agreement)
| Method | Endpoint | Description |
|---|---|---|
| PATCH | `/kyc/{id}/onboard/user-agreement` | Accept T&C — returns `204 No Content` |
| GET | `kyc/onboard-application?app_id={1\|2}` | Verify acceptance — returns `200 OK` |

**TH payload:** `"is_accept_term_condition": true, "is_accept_risk_disclosure": true`
**GL payload:** `"is_accept_term_condition": true, "is_accept_risk_disclosure": false`

**DB:** `bitazza.user_agreement`

#### Sumsub — Document Scan & Liveness
| Method | Endpoint | Description |
|---|---|---|
| GET | `api/v2/kyc/{kycid}/liveness/check-similarity` | Liveness result check |
| POST | `kyc/:kycId/liveness/reset` | Reset Sumsub applicant |
| PATCH | `https://api.sumsub.com/resources/sdk/applicant/` | Update applicant (Sumsub external) |
| GET | `https://api.sumsub.com/resources/sdk/applicant` | Get applicant (Sumsub external) |
| POST | `api.sumsub.com/resources/applicants/{ApplicantID}/info/idDoc` | Document scan result |

**Liveness response variants:**
```json
// Processing (still running)
{ "data": { "isReportProcessing": true, "isLivenessPassed": false } }

// Failed
{ "data": { "isReportProcessing": false, "isLivenessPassed": false } }

// Passed
{ "data": { "isReportProcessing": false, "isLivenessPassed": true } }
```

**ID Card scan response (TH):**
```json
{
  "idDocType": "ID_CARD",
  "country": "THA",
  "idDocSubType": "FRONT_SIDE",
  "termless": false
}
```

**Passport scan response (Non-TH):**
```json
{
  "idDocType": "PASSPORT",
  "country": "AFG",
  "errors": ["dataNotReadable"],
  "termless": false
}
```

#### 1/8 — General Information
| Method | Endpoint | Description |
|---|---|---|
| PATCH | `api/kyc/{kycid}/onboard/general-info` | Save general info form |

#### 2/8 — Identity Information
| Method | Endpoint | Description |
|---|---|---|
| GET | `/kyc/{id}/identity-info` | Get identity info |
| GET | `/kyc/verify/document-id` | Verify document ID |

**DB:** `bitazza.kyc` — column: `idcard_type`, `idcard_expiration_date`, `idcard_no`

#### 3/8 — Address Information
| Method | Endpoint | Description |
|---|---|---|
| PATCH | `/kyc/{id}/address-info` | Save address info |
| GET | `/api/v1/countries/th` | Get country list |

**Payload (TH address):**
```json
{
  "billing_address": "...",
  "billing_subdistrict": "Khlong Toei",
  "billing_district": "Khlong Toei",
  "billing_province": "Bangkok",
  "billing_zip_code": "10110",
  "billing_country_code": "th",
  "current_address": "...",
  "current_subdistrict": "Khlong Toei",
  "current_district": "Khlong Toei",
  "current_province": "Bangkok",
  "current_zip_code": "10110",
  "current_country_code": "th",
  "work_address": "..."
}
```

#### 4/8 — Background Information
| Method | Endpoint | Description |
|---|---|---|
| PATCH | `/onboard/{id}/education-experience` | Save background info — returns `201 Created` |

**Payload:**
```json
{
  "kyc_form_data": {
    "workplace_university": "{name}",
    "work_business": 7,
    "work_business_specify": "",
    "occupation": 7,
    "occupation_specify": "",
    "education": 2
  }
}
```

#### 5/8 — Disclosure Information
| Method | Endpoint | Description |
|---|---|---|
| GET | `kyc/{id}/photo?types=proof_of_fund_document` | Get proof of fund photo |
| POST | `/kyc/{id}/photo` | Upload proof of fund photo |
| PATCH | `/kyc/v4/onboard/{id}/other-disclosures` | Save disclosures — returns `201 Created` |

> Note: `proof_of_fund_document` upload applies to **TH & EDD only** — GL does not have proof of fund

**Disclosure payload:**
```json
{
  "kyc_form_data": {
    "purpose_investment": 2,
    "purpose_investment_specify": "",
    "source_fund": "2",
    "beneficial_name": "",
    "source_fund_specify": ""
  }
}
```

#### 6/8 — Financial Information
| Method | Endpoint | Description |
|---|---|---|
| PATCH | `/kyc/v4/onboard/{id}/financial-information` | Save financial info |

#### 7/8 — FATCA Questionnaire
| Method | Endpoint | Description |
|---|---|---|
| POST | `/kyc/onboard/{id}/accept-fatca` | Submit FATCA answers |

#### 8/8 — Additional Documents (TH & EDD only)
| Method | Endpoint | Description |
|---|---|---|
| GET | `kyc/{id}/digital-id/generate-login-url` | Get Thai ID (ThaiD) login URL |
| POST | `/kyc/{id}/digital-id` | Save Thai ID data |
| GET | `/kyc/{id}/digital-id/compare` | Compare Thai ID |
| POST | `/kyc/{id}/digital-id/compare` | Submit Thai ID comparison |
| POST | `/kyc/generate-presigned-url/additional-document` | Get S3 presigned URL for upload |
| POST | `/kyc/onboard/{id}/additional-document` | Upload additional document |
| POST | `/kyc/onboard/{id}/additional-documents-submit` | Submit all additional documents |
| GET | `/kyc/{id}/photo/additional-document-groups` | Get document group options |
| GET | `/kyc/{id}/photo?isAdditionalDocument=true` | Get uploaded photos |
| POST | `/kyc/{id}/photo?isAdditionalDocument=true` | Upload photo |
| DELETE | `/kyc/{id}/photo/type/{photoType}` | Delete photo by type |
| DELETE | `/kyc/{id}/photo/{pid}` | Delete photo by ID |

**ThaiD login URL response:**
```json
{
  "loginUrl": "https://imauthsbx.bora.dopa.go.th/api/v2/oauth2/auth/?...",
  "isThaiDVerified": false
}
```

**Presigned URL response (S3):**
```json
{
  "data": {
    "url": "https://s3.ap-southeast-1.amazonaws.com/bitazza-kyc-staging",
    "fields": {
      "key": "...",
      "x-amz-meta-filename": "...",
      "x-amz-meta-content-type": "...",
      "bucket": "...",
      "X-Amz-Algorithm": "...",
      "X-Amz-Credential": "...",
      "X-Amz-Date": "...",
      "X-Amz-Security-Token": "...",
      "Policy": "..."
    }
  },
  "message": "generated presigned url additional document"
}
```

**Submit response:** `{ "message": "submitted additional documents" }`

**DB:** `bitazza.kyc_photo` — column: `is_Additional_document`

#### Info Summary
| Method | Endpoint | Description |
|---|---|---|
| POST | `/kyc/continue-to-complete-test` | Proceed from Info Summary to Test Instruction (TH & EDD only) |

#### Suitability Test (TH & EDD only)
| Method | Endpoint | Description |
|---|---|---|
| GET/POST | `/kyc/v4/onboard/{id}/th-suitability-test?question={n}` | Get/submit suitability test question `n` |

#### Knowledge Test (TH only)
| Method | Endpoint | Description |
|---|---|---|
| GET/POST | `/kyc/v4/onboard/{id}/knowledge-test-th?question={n}` | Get/submit knowledge test question `n` |

#### Submit KYC
| Method | Endpoint | Description |
|---|---|---|
| POST | `/kyc/{id}/onboard/evaluation` | Final KYC submission — triggers evaluation |

#### Redo / Re-submit
| Method | Endpoint | Description |
|---|---|---|
| POST | `/kyc/{id}/redo-submit` | Redo KYC submission (Onboarding) |
| POST | `/re-submit` | EDD re-submit |
| POST | `/renew` | Renew KYC record (EDD) |

---

### Admin / Console APIs

| Method | Endpoint | Description |
|---|---|---|
| POST | `/kyc-approval/:id/soft-approval-onboarding` | Soft approval (onboarding) |
| POST | `/kyc/{kycId}/soft-approval/new-onboard` | New onboard soft approval |
| POST | `/v2/admin/kyc/{kyc_id}/reject` | Reject KYC |
| GET | `/admin/kyc/:id` | Get KYC detail in console |
| GET | `/api/v2/me` | Get current user info |
| POST | `/api/v1/kyc/list` | List KYC entries |
| POST | `/renew` | Renew KYC |
| POST | `/kyc` | Create KYC |

#### Visa / Document Approval (Admin)
| Method | Endpoint | Description |
|---|---|---|
| GET | `admin/visa` | List visa documents |
| POST | `admin/visa/:id/accept` | Accept visa document |
| POST | `admin/visa/:id/approve` | Approve visa document |
| POST | `admin/visa/:id/reject` | Reject visa document |
| POST | `/api/v1/cdd/user/:userId/document` | CDD user document submission |

**DB:** `user_document`, `user_document_approval`

---

### Database Tables Reference

| Database / Table | Used in | Key Columns |
|---|---|---|
| `bitazza.kyc` | KYT, OB Soft Approval, Identity Info | `idcard_no`, general KYC record |
| `bitazza.kyc_approval` | OB Soft Approval, EDD Soft Approval | Approval status, reviewer |
| `bitazza.kyc_reject_reasons` | OB Soft Approval, KYT | Rejection reason details |
| `bitazza.kyc_scheduled_assessment` | OB Soft Approval | Scheduled reassessment records |
| `bitazza.user_accounts` | KYT, OB Soft Approval, EDD | User account level, status |
| `bitazza.console_user_activity_log` | OB Soft Approval, console activity | Admin action history log |
| `bitazza.kyc_photo` | Additional Docs, Multiple Additional | `is_Additional_document` column |
| `bitazza.user_agreement` | Term & Condition | T&C acceptance status |
| `bitazza.user_document` | Visa / CDD | Document records |
| `bitazza.user_document_approval` | Visa / CDD | Document approval status |
| `bitazza.kyc_risk_measurement` | KYT | Risk measurement score |

---

### Console Verification Checklist

After KYC submission, always verify in Admin Console:
- **Status** — KYC status (Inprogess/ Pending / Approved / Rejected)
- **Risk Flag** — Risk flag (Low risk / Moderate risk / High risk)
- **Mule Flag** — Mule color flag (Black / Dark-grey / Light-grey / Dark-brown / No Color)
- **Label** — User label
- **Detail page** — All submitted data
- **KYC ID** — Unique KYC identifier
- **AP ID** — Applicant ID (Sumsub)
- **AP Console** — Alpha point console
- **DB** — Verify records in relevant tables above
- **Sumsub Applicant** — Confirm document/liveness result
- **KYC Level** — After Approved, confirm level is upgraded

---

## Notes

- The product is **Bitazza** — a cryptocurrency exchange platform
- KYC is required before trading; this webview is embedded in the main app
- Users are distinguished by nationality: Thai users use ID cards; non-Thai users use passports
- **EDD** (Enhanced Due Diligence) is a re-verification flow for existing TH users — TH region only
- Mule account detection is a separate concern handled in `Mule_Account_PH.4` and `Smoke_KYC` sheets
- Pending Review and Approved page content differs across TH, GL, and EDD flows

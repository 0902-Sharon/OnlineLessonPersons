/*
IMPORT STD;
IMPORT DataPatterns;

df := RECORD
 REAL4 latitude;
 REAL4 longitude;
 INTEGER1 housing_median_age;
 INTEGER1 total_bedrooms;
 INTEGER1 population;
 INTEGER1 households;
 INTEGER1 median_income;
 INTEGER1 median_house_value;
 END;
 Raw_DS   := DATASET('books.csv', df, CSV(HEADING(1)));
 OUTPUT(Raw_DS);

    STRING CLEAN_STRING (STRING INPUT) := FUNCTION
    RETURN STD.Str.ToLowerCase(TRIM(INPUT));
END;
filePath := '~hthor::sharon::books';
ds := DATASET(filePath, RECORDOF(filePath, LOOKUP), FLAT);
profileResults := DataPatterns.Profile(ds);
OUTPUT(profileResults, ALL, NAMED('profileResults'));

*/


IMPORT STD;
IMPORT DataPatterns;
IMPORT $;

df := RECORD
 REAL4 latitude;
 REAL4 longitude;
 INTEGER1 housing_median_age;
 INTEGER1 total_bedrooms;
 INTEGER1 population;
 INTEGER1 households;
 INTEGER1 median_income;
 INTEGER1 median_house_value;
 END;

ds := DATASET('california_housing_test.csv', df, CSV(HEADING(1)));
//  OUTPUT(Raw_DS);
STRING CLEAN_STRING (STRING INPUT) := FUNCTION
 RETURN STD.Str.ToLowerCase(TRIM(INPUT));
END;

// classify_columns := FUNCTION(DATASET ds) := 
//   TRANSFORM RECORDOF(ds) := 
//     TRANSFORM
//       SELF.col1_type := '',
//       SELF.col1_information_type := '',
//       SELF.col2_type := '',
//       SELF.col2_information_type := '',
//       SELF.col3_type := '',
//       SELF.col3_information_type := ''
//       := BEGIN
//         SELF.col1_type := IF(ds.latitude IS STRING, 'text', IF(ds.col1 IS REAL OR ds.col1 IS DECIMAL, 'float', IF(ds.col1 IS INTEGER, 'integer', 'unknown')));
//         SELF.col1_information_type := IF(SELF.col1_type = 'text', $.extract_information(ds.col1), 'not_applicable');
        
//         SELF.col2_type := IF(ds.longitude IS STRING, 'text', IF(ds.col2 IS REAL OR ds.col2 IS DECIMAL, 'float', IF(ds.col2 IS INTEGER, 'integer', 'unknown')));
//         SELF.col2_information_type := IF(SELF.col2_type = 'text', $.extract_information(ds.col2), 'not_applicable');
        
//         SELF.col3_type := IF(ds.housing_median_age IS STRING, 'text', IF(ds.col3 IS REAL OR ds.col3 IS DECIMAL, 'float', IF(ds.col3 IS INTEGER, 'integer', 'unknown')));
//         SELF.col3_information_type := IF(SELF.col3_type = 'text', $.extract_information(ds.col3), 'not_applicable');
//       END;

// searchpattern := '\b[0-9][0-9][0-9][0-9]\b';
texvar := 'adkjh';
istext := REGEXFIND('[a-z]*',texvar);
issame := REGEXFIND('[:alpha:]',texvar);

isalphanumeric := REGEXFIND('.[a-zA-Z0-9].',texvar);
isfloat := REGEXFIND('^-?[0-9]*\\.{1}[0-9]+$',texvar);
isint := REGEXFIND('^-?[0-9]+$',texvar);
isemail := REGEXFIND('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$',texvar);
ispincode := REGEXFIND('^[0-9]{6}$',texvar);
isdate := REGEXFIND('^[0-9]{2}[/-][0-9]{2}[/-][0-9]{4}$',texvar);

OUTPUT(istext);
OUTPUT(isalphanumeric);
OUTPUT(isfloat);
OUTPUT(isint);
OUTPUT(isemail);
OUTPUT(ispincode);
OUTPUT(isdate);

/*
IMPORT DataPatterns;

// Define patterns for each column type
STRING personal_name_pattern := '[A-Z][a-z]+ [A-Z][a-z]+';
STRING organization_name_pattern := '[A-Z][a-z]+( [A-Z][a-z]+)*';
STRING email_pattern := '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}';
STRING url_pattern := '(http[s]?:\/\/)?[^\s(["<,>]*\.[^\s[",><]*';
STRING zipcode_pattern := '^[0-9]{5}(?:-[0-9]{4})?$';
STRING pincode_pattern := '^[1-9][0-9]{5}$';
STRING phone_pattern := '^\+?[0-9]{10}$';
STRING address_pattern := '\d+\s[A-z]+\s[A-z]+';
STRING date_pattern_1 := '(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4}|\d{2})';
STRING date_pattern_2 := '(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})';
STRING date_pattern_3 := '(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{2})';

// Define function to classify columns based on patterns
FUNCTION classify_columns(DATASET ds) := TRANSFORM
    SELF.field1_type := IF(ds.field1 IS STRING, 'text', IF(ds.field1 IS REAL OR ds.field1 IS DECIMAL, 'float', IF(ds.field1 IS INTEGER, 'integer', 'unknown')));
    SELF.personal_name := VALIDATE(ds.field1, personal_name_pattern);
    SELF.organization_name := VALIDATE(ds.field1, organization_name_pattern);
    SELF.email := VALIDATE(ds.field1, email_pattern);
    SELF.url := VALIDATE(ds.field1, url_pattern);
    SELF.zipcode := VALIDATE(ds.field1, zipcode_pattern);
    SELF.pincode := VALIDATE(ds.field1, pincode_pattern);
    SELF.phone := VALIDATE(ds.field1, phone_pattern);
    SELF.address := VALIDATE(ds.field1, address_pattern);
    SELF.date := VALIDATE(ds.field1, [date_pattern_1, date_pattern_2, date_pattern_3]);
END;

// Load dataset
// raw_data := DATASET('~my_data::raw_data', CSV, {STRING field1});
df := RECORD
 REAL4 latitude;
 REAL4 longitude;
 INTEGER1 housing_median_age;
 INTEGER1 total_bedrooms;
 INTEGER1 population;
 INTEGER1 households;
 INTEGER1 median_income;
 INTEGER1 median_house_value;
 END;
raw_data    := DATASET('california_housing_test.csv', df, CSV(HEADING(1)));
// Classify columns based on patterns
classified_data := classify_columns(raw_data);

// Output results
OUTPUT(classified_data);
*/



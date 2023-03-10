IMPORT DataPatterns;

//Define patterns for each column type
STRING personal_name_pattern := '[A-Z][a-z]+ [A-Z][a-z]+';
STRING organization_name_pattern := '[A-Z][a-z]+( [A-Z][a-z]+)*';
STRING email_pattern := '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}';
STRING url_pattern := '(http[s]?:\\/\\/)?[^\\s(["<,>]*\\.[^\\s[",><]*';
STRING zipcode_pattern := '^[0-9]{5}(?:-[0-9]{4})?$';
STRING pincode_pattern := '^[1-9][0-9]{5}$';
STRING phone_pattern := '^\\+?[0-9]{10}$';
STRING address_pattern := '\\d+\\s[a-z]+\\s[a-z]+';
STRING date_pattern_1 := '(\\d{1,2})(\\/|-)(\\d{1,2})(\\/|-)(\\d{4}|\\d{2})';
STRING date_pattern_2 := '(\\d{4})(\\/|-)(\\d{1,2})(\\/|-)(\\d{1,2})';
STRING date_pattern_3 := '(\\d{1,2})(\\/|-)(\\d{1,2})(\\/|-)(\\d{2})';
STRING latitudepattern := '^[+-]?([1-8]?[1-9]|[1-9]0)\\.{1}\\d{1,6}$';
STRING lat := '^[+-]?([0-8]?\\d(\\.\\d+)?|90(\\.0+)?)$';
STRING longitudepattern := '^[+-]?((1[0-7]|[1-9])?[0-9]|180)\\.{1}\\d{1,6}$';


// Define function to classify columns based on patterns
// classify_columns(DATASET ds) := TRANSFORM
//   RECORDOF(ds) := schema;
//   columnNames := FIELDNAMES(schema);
//   FOR i IN 1..NUM(columnNames) LOOP
//     SELF[columnNames[i] + '_type'] := IF(ds[columnNames[i]] IS STRING, 'text', IF(ds[columnNames[i]] IS REAL OR ds[columnNames[i]] IS DECIMAL, 'float', IF(ds[columnNames[i]] IS INTEGER, 'integer', 'unknown')));
//     SELF[columnNames[i] + '_personal_name'] := IF(VALIDATE(ds[columnNames[i]], personal_name_pattern), 'personal_name', 'unknown');
//     SELF[columnNames[i] + '_organization_name'] := IF(VALIDATE(ds[columnNames[i]], organization_name_pattern), 'organization_name', 'unknown');
//     SELF[columnNames[i] + '_email'] := IF(VALIDATE(ds[columnNames[i]], email_pattern), 'email', 'unknown');
//     SELF[columnNames[i] + '_url'] := IF(VALIDATE(ds[columnNames[i]], url_pattern), 'url', 'unknown');
//     SELF[columnNames[i] + '_zipcode'] := IF(VALIDATE(ds[columnNames[i]], zipcode_pattern), 'zipcode', 'unknown');
//     SELF[columnNames[i] + '_pincode'] := IF(VALIDATE(ds[columnNames[i]], pincode_pattern), 'pincode', 'unknown');
//     SELF[columnNames[i] + '_phone'] := IF(VALIDATE(ds[columnNames[i]], phone_pattern), 'phone', 'unknown');
//     SELF[columnNames[i] + '_address'] := IF(VALIDATE(ds[columnNames[i]], address_pattern), 'address', 'unknown');
//     SELF[columnNames[i] + '_date'] := IF(VALIDATE(ds[columnNames[i]], [date_pattern_1, date_pattern_2, date_pattern_3]), 'date', 'unknown');
//   END;
// END;

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

raw_data := DATASET('california_housing_test.csv', df, CSV(HEADING(1)));


classifyRegexFunction := FUNCTION(val, pattern) := IF(VALIDATE(val, pattern), val, '');
regexTransformedDataset := TRANSFORM(raw_data,
                                  SELF.latitude := classifyRegexFunction(col1, latitudepattern),
                                  SELF.longitude := classifyRegexFunction(col1, longitudepattern),
                                  SELF.housing_median_age := classifyRegexFunction(col2, url_pattern),
                                  SELF.total_bedrooms := classifyRegexFunction(col3, zipcode_pattern),
                                  SELF.population := classifyRegexFunction(col4, pincode_pattern),
                                  SELF.households := classifyRegexFunction(col5, phone_pattern),
                                  SELF.median_income := classifyRegexFunction(col6, address_pattern),
                                  SELF.median_house_value := classifyRegexFunction(col7, date_pattern_1));

// classified_data := classify_columns(raw_data);
// OUTPUT(classified_data);

OUTPUT(regexTransformedDataset);
/*
The COLUMN_WISE_REGEX_CLASSIFICATION function takes in a dataset as input and returns a dataset with 3 columns: i, column_value, and regex_classification. The i column is the index of the column, column_value is the value of the cell in the column, and regex_classification is the regex classification of the value.

The TRANSFORM clause iterates through each row of the dataset, populating the i and column_value fields, and then classifying the column_value using the MATCHES function, which returns True if the value matches the given regex pattern, and False otherwise.

The regex_classification field is set based on the result of the MATCHES function


IMPORT STD;

EXPORT COLUMN_WISE_REGEX_CLASSIFICATION(DATASET dataset) := 
  MAP(dataset,
    RECORD
      UNSIGNED8 i;
      STRING column_value;
      STRING regex_classification;
    END)
  ROW(i := i, column_value := column_value, regex_classification := regex_classification) :=
    TRANSFORM
    SELF.i := dataset.i;
    SELF.column_value := dataset.column_value;

    SELF.regex_classification :=
      // Check for text regex
      IF (MATCHES(dataset.column_value, ".*[a-zA-Z].*")) THEN
        "text"
      // Check for alphanumeric regex
      ELSE IF (MATCHES(dataset.column_value, ".*[a-zA-Z0-9].*")) THEN
        "alphanumeric"
      // Check for float regex
      ELSE IF (MATCHES(dataset.column_value, "^-?[0-9]*\\.{1}[0-9]+$")) THEN
        "float"
      // Check for integer regex
      ELSE IF (MATCHES(dataset.column_value, "^-?[0-9]+$")) THEN
        "integer"
      // Check for email regex
      ELSE IF (MATCHES(dataset.column_value, "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")) THEN
        "email"
      // Check for pincode regex
      ELSE IF (MATCHES(dataset.column_value, "^[0-9]{6}$")) THEN
        "pincode"
      // Check for date regex
      ELSE IF (MATCHES(dataset.column_value, "^[0-9]{2}[/-][0-9]{2}[/-][0-9]{4}$")) THEN
        "date"
      ELSE
        "other";

  END;
  */
IMPORT STD;

EXPORT COLUMN_WISE_REGEX_CLASSIFICATION(dataset) := 
  MAP(dataset,
    RECORD
      UNSIGNED8 i;
      STRING column_value;
      STRING regex_classification;
    END)
  ROW(i := i, column_value := column_value, regex_classification := regex_classification) :=
    TRANSFORM
    SELF.i := dataset.i;
    SELF.column_value := dataset.column_value;

    SELF.regex_classification :=
      // Check for text regex
      IF (MATCHES(dataset.column_value, ".*[a-zA-Z].*")) THEN
        "text"
      // Check for alphanumeric regex
      ELSE IF (MATCHES(dataset.column_value, ".*[a-zA-Z0-9].*")) THEN
        "alphanumeric"
      // Check for float regex
      ELSE IF (MATCHES(dataset.column_value, "^-?[0-9]*\\.{1}[0-9]+$")) THEN
        "float"
      // Check for integer regex
      ELSE IF (MATCHES(dataset.column_value, "^-?[0-9]+$")) THEN
        "integer"
      // Check for email regex
      ELSE IF (MATCHES(dataset.column_value, "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")) THEN
        "email"
      // Check for pincode regex
      ELSE IF (MATCHES(dataset.column_value, "^[0-9]{6}$")) THEN
        "pincode"
      // Check for date regex
      ELSE IF (MATCHES(dataset.column_value, "^[0-9]{2}[/-][0-9]{2}[/-][0-9]{4}$")) THEN
        "date"
      ELSE
        "other";
    END;


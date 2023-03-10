EXPORT range_based_classification := FUNCTION(column := DATASET([], TRANSFORM(value, UNSIGNED)) AS BEGIN

    min_max := TRANSFORM(column, SELF.min := MIN(column.value), SELF.max := MAX(column.value));
    min_val := min_max[1].min;
    max_val := min_max[1].max;

    date_range := (1600, 2100);
    pincode_range := (100000, 999999);
    phone_number_range := (10000000, 99999999);
    latitude_range := (-90, 90);
    longitude_range := (-180, 180);
    temperature_range := (-100, 100);
    amount_range := (0, 1e10);
    currency_range := (0, 1e10);
    measurement_range := (0, 1e10);
    

    IF (min_val >= date_range[1] AND max_val <= date_range[2]) THEN RETURN 'date';
    ELSEIF (min_val >= pincode_range[1] AND max_val <= pincode_range[2]) THEN RETURN 'pincode';
    ELSEIF (min_val >= phone_number_range[1] AND max_val <= phone_number_range[2]) THEN RETURN 'phone number';
    ELSEIF (min_val >= latitude_range[1] AND max_val <= latitude_range[2]) THEN RETURN 'latitude';
    ELSEIF (min_val >= longitude_range[1] AND max_val <= longitude_range[2]) THEN RETURN 'longitude';
    ELSEIF (min_val >= temperature_range[1] AND max_val <= temperature_range[2]) THEN RETURN 'temperature';
    ELSEIF (min_val >= amount_range[1] AND max_val <= amount_range[2]) THEN RETURN 'amount';
    ELSEIF (min_val >= currency_range[1] AND max_val <= currency_range[2]) THEN RETURN 'currency';
    ELSEIF (min_val >= measurement_range[1] AND max_val <= measurement_range[2]) THEN RETURN 'measurement';
    ELSE RETURN 'other';
    END;
END;

isAnyRateGE(STRING1 rate) := FUNCTION
RETURN REGEXFIND(rate, '.[a-zA-Z].');
END;

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
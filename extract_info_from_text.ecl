
// IMPORT $;

// // $.isAnyRateGE('HIIMDEEP');

// namesRec := RECORD 
//   		STRING20  lname; 
//         STRING10  fname;
//         UNSIGNED2 age := 25;  
//         UNSIGNED2 ctr := 0; 
//     END; 
//     namesTable := DATASET([{'Flintstone','Fred',35}, 
//        {'Flintstone','Wilma',43},                         
//        {'Jetson','Georgie',10},                        
//        {'Mr. T','Z-man'}], namesRec); 
//     BodyFunc(DATASET(namesRec) ds, UNSIGNED4 c):=  PROJECT(ds,TRANSFORM(namesRec,SELF.age := 
//     LEFT.age*c;                    
//     SELF.ctr := COUNTER*c ;                    
//     SELF := LEFT));  Form1 := LOOP(namesTable, 2,           
//     //iterate 2 times               
//     ROWS(LEFT) & BodyFunc(ROWS(LEFT), COUNTER));   //16 rows: OUTPUT(Form1,NAMED('Form1_example')); 
    
IMPORT Python3 AS Python; 
EXPORT
STRING extract_info_from_text(UNSIGNED text) := EMBED(Python)
    import spacy
    nlp = spacy.load("en_core_web_sm")
    doc = nlp(text)
    
    information = {
        "ORG": [],
        "PERSON": [],
        "GPE": [],
        "DATE": [],
        "TIME": [],
        "PERCENT": [],
        "MONEY": [],
        "QUANTITY": [],
        "CARDINAL": [],
        "LOC": [],
        "FAC": [],
        "NORP": [],
        "PRODUCT": [],
        "EVENT" : [],
        "WORK_OF_ART" : [],
        "LAW" : [],
        "LANGUAGE" : [],
        "ORDINAL" : [],

    }
    
    for ent in doc.ents:
        information[ent.label_].append(ent.text)
        
    return information
ENDEMBED;

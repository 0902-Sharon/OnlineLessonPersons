IMPORT Python3 AS Python; 
EXPORT
STRING extract_information(UNSIGNED text) := EMBED(Python)
import spacy
    nlp = spacy.load("en_core_web_sm")
    doc = nlp(text)
    
    named_entities = []
    for ent in doc.ents:
        named_entities.append((ent.text, ent.label_))
        
    named_entity_counts = dict()
    for named_entity in named_entities:
        if named_entity[1] in named_entity_counts:
            named_entity_counts[named_entity[1]] += 1
        else:
            named_entity_counts[named_entity[1]] = 1
    
    most_probable_type = max(named_entity_counts, key=named_entity_counts.get)
    return most_probable_type.lower()
ENDEMBED;


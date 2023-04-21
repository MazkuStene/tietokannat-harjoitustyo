# Kyselyssä haetaan yksittäisen ihmisen painot ja ajat mahdollista visualisointia varten esim. Excelissä
SELECT weight, dateAndTime FROM weightEntry
WHERE personID IN (
	SELECT personID FROM person
    WHERE nickname = "Maijukka"
);

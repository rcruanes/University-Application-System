SELECT count (*)
FROM(
SELECT a_applicationkey 
from applications
GROUP by a_applicationkey 
HAVING count(DISTINCT(a_schoolname))=1)
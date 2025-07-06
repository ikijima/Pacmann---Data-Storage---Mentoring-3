select *
from {{ source("pactravel", "hotels") }} 
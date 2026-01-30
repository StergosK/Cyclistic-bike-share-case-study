# Cyclistic bike share case study (2025)

Capstone for the Google Data Analytics Professional Certificate (Coursera).  
I analyzed Divvy trips (Jan–Dec 2025) to compare **casual riders** vs **annual members** and extract marketing takeaways.

**business question**  
How do casual riders and annual members use Cyclistic bikes differently?

**data**  
Public, anonymized Divvy Trip Data (City of Chicago Data License).  
Raw data isn’t included due to size/licensing.

**cleaning (Excel)**  
- removed zero/negative durations  
- excluded rides > 24h  
- handled missing/invalid timestamps  
- standardized date/time formats  

**analysis (R)**  
Used tidyverse to analyze ride length, day-of-week trends, seasonality, and top start stations by rider type.

**key insights**  
- Members take more rides overall  
- Casual riders have longer rides  
- Casual rides are longest on weekends and peak in summer  

**outputs**  
All visuals are in `plots/`, and the complete analysis is documented in the PDF.

**repository**  
- `scripts/` R analysis  
- `plots/` charts  
- `Cyclistic Bike Share Case Study.pdf` full case study with findings and recommendations

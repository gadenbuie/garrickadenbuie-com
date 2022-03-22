---
title: Saving Daylight Time?
author: Garrick Aden-Buie
date: '2022-03-12'
slug: saving-daylight-time
categories:
  - Blog
tags:
  - Visualization
description: |
  How much daylight do cities across the world get throughout the year?
  Does Daylight Saving Time really save any daylight?
  A visualization to explore these questions.
images: 
  - blog/saving-daylight-time/index_files/figure-html/social-1.png
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2022/saving-daylight-time/index.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---

<!-- Links -->

## Are we saving daylight in Atlanta, GA?

<figure role="group">
  <img src="{{< blogdown/postref >}}index_files/figure-html/daylight-hours-atlanta-1.png"
    alt="Ribbon plot showing daylight hours from sunrise to sunset in Atlanta, GA for 2022. The plot highlights the shift caused by Daylight Saving Time that where daylight hours are adjusted to be later in the day from March to November.">
  <figcaption>Daylight hours near Atlanta, GA for 2022.</figcaption>
</figure>

## Around the World

<div class="pa">
<label class="b db mb2" for="choose-city">Pick a city</label>
<div class="mb2">
<select id="choose-city" class="input-reset db di-ns mb2 pa2 bn br1 w-100 mw5 select-dropdown-arrow custom-text-color custom-bg-light">
<option value="cities/stockholm_sweden.png" data-city="Stockholm, Sweden">Stockholm, Sweden</option>
<option value="cities/london_united_kingdom.png" data-city="London, United Kingdom">London, United Kingdom</option>
<option value="cities/karagandy_kazakhstan.png" data-city="Karagandy, Kazakhstan">Karagandy, Kazakhstan</option>
<option value="cities/vancouver_canada.png" data-city="Vancouver, Canada">Vancouver, Canada</option>
<option value="cities/paris_france.png" data-city="Paris, France">Paris, France</option>
<option value="cities/harbin_china.png" data-city="Harbin, China">Harbin, China</option>
<option value="cities/toronto_canada.png" data-city="Toronto, Canada">Toronto, Canada</option>
<option value="cities/istanbul_turkey.png" data-city="Istanbul, Turkey">Istanbul, Turkey</option>
<option value="cities/new_york_city_usa.png" data-city="New York City, USA">New York City, USA</option>
<option value="cities/madrid_spain.png" data-city="Madrid, Spain">Madrid, Spain</option>
<option value="cities/seoul_korea.png" data-city="Seoul, Korea">Seoul, Korea</option>
<option value="cities/san_jose_usa.png" data-city="San Jose, USA">San Jose, USA</option>
<option value="cities/algiers_algeria.png" data-city="Algiers, Algeria">Algiers, Algeria</option>
<option value="cities/los_angeles_usa.png" data-city="Los Angeles, USA">Los Angeles, USA</option>
<option value="cities/shanghai_china.png" data-city="Shanghai, China">Shanghai, China</option>
<option value="cities/alexandria_egypt.png" data-city="Alexandria, Egypt">Alexandria, Egypt</option>
<option value="cities/cairo_egypt.png" data-city="Cairo, Egypt">Cairo, Egypt</option>
<option value="cities/houston_usa.png" data-city="Houston, USA">Houston, USA</option>
<option value="cities/karachi_pakistan.png" data-city="Karachi, Pakistan">Karachi, Pakistan</option>
<option value="cities/mexico_city_mexico.png" data-city="Mexico City, Mexico">Mexico City, Mexico</option>
<option value="cities/mumbai_india.png" data-city="Mumbai, India">Mumbai, India</option>
<option value="cities/nouakchott_mauritania.png" data-city="Nouakchott, Mauritania">Nouakchott, Mauritania</option>
<option value="cities/manila_philippines.png" data-city="Manila, Philippines">Manila, Philippines</option>
<option value="cities/kano_nigeria.png" data-city="Kano, Nigeria">Kano, Nigeria</option>
<option value="cities/caracas_venezuela.png" data-city="Caracas, Venezuela">Caracas, Venezuela</option>
<option value="cities/lagos_nigeria.png" data-city="Lagos, Nigeria">Lagos, Nigeria</option>
<option value="cities/bogota_colombia.png" data-city="Bogota, Colombia">Bogota, Colombia</option>
<option value="cities/jakarta_indonesia.png" data-city="Jakarta, Indonesia">Jakarta, Indonesia</option>
<option value="cities/sydney_australia.png" data-city="Sydney, Australia">Sydney, Australia</option>
<option value="cities/cape_town_south_africa.png" data-city="Cape Town, South Africa">Cape Town, South Africa</option>
<option value="cities/buenos_aires_argentina.png" data-city="Buenos Aires, Argentina">Buenos Aires, Argentina</option>
<option value="cities/punta_arenas_chile.png" data-city="Punta Arenas, Chile">Punta Arenas, Chile</option>
</select>
<button id="choose-city-prev" class="link dim ph3 pv2 bn br1 custom-text-color custom-bg-light">
<i class="fa fa-arrow-left" role="presentation" aria-label="arrow-left icon"></i>
<span class="clip">Previous city</span>
</button>
<button id="choose-city-next" class="link dim ph3 pv2 bn br1 custom-text-color custom-bg-light">
<i class="fa fa-arrow-right" role="presentation" aria-label="arrow-right icon"></i>
<span class="clip">Next city</span>
</button>
</div>
</div>
<div aria-live="polite">
<figure role="group">
<img id="city-plot" src="cities/stockholm_sweden.png" alt="Stockholm, Sweden"/>
<figcaption>TK: Sun times plot.</figcaption>
</figure>
</div>

## Across the US

<div class="pa">
<label class="b db mb2" for="us-city">Pick a city in the United States</label>
<select id="us-city">
<option value="us-cities/washington_d_c">Washington, D. C.</option>
<option value="us-cities/alabama_birmingham">Birmingham, AL</option>
<option value="us-cities/alabama_huntsville">Huntsville, AL</option>
<option value="us-cities/alabama_mobile">Mobile, AL</option>
<option value="us-cities/alabama_montgomery">Montgomery, AL</option>
<option value="us-cities/arizona_chandler">Chandler, AZ</option>
<option value="us-cities/arizona_gilbert">Gilbert, AZ</option>
<option value="us-cities/arizona_glendale">Glendale, AZ</option>
<option value="us-cities/arizona_mesa">Mesa, AZ</option>
<option value="us-cities/arizona_peoria">Peoria, AZ</option>
<option value="us-cities/arizona_phoenix">Phoenix, AZ</option>
<option value="us-cities/arizona_scottsdale">Scottsdale, AZ</option>
<option value="us-cities/arizona_surprise">Surprise, AZ</option>
<option value="us-cities/arizona_tempe">Tempe, AZ</option>
<option value="us-cities/arizona_tempe_junction">Tempe Junction, AZ</option>
<option value="us-cities/arizona_tucson">Tucson, AZ</option>
<option value="us-cities/arkansas_little_rock">Little Rock, AR</option>
<option value="us-cities/california_anaheim">Anaheim, CA</option>
<option value="us-cities/california_antioch">Antioch, CA</option>
<option value="us-cities/california_bakersfield">Bakersfield, CA</option>
<option value="us-cities/california_berkeley">Berkeley, CA</option>
<option value="us-cities/california_burbank">Burbank, CA</option>
<option value="us-cities/california_carlsbad">Carlsbad, CA</option>
<option value="us-cities/california_chula_vista">Chula Vista, CA</option>
<option value="us-cities/california_concord">Concord, CA</option>
<option value="us-cities/california_corona">Corona, CA</option>
<option value="us-cities/california_costa_mesa">Costa Mesa, CA</option>
<option value="us-cities/california_daly_city">Daly City, CA</option>
<option value="us-cities/california_downey">Downey, CA</option>
<option value="us-cities/california_east_los_angeles">East Los Angeles, CA</option>
<option value="us-cities/california_el_monte">El Monte, CA</option>
<option value="us-cities/california_elk_grove">Elk Grove, CA</option>
<option value="us-cities/california_escondido">Escondido, CA</option>
<option value="us-cities/california_fairfield">Fairfield, CA</option>
<option value="us-cities/california_fontana">Fontana, CA</option>
<option value="us-cities/california_fremont">Fremont, CA</option>
<option value="us-cities/california_fresno">Fresno, CA</option>
<option value="us-cities/california_fullerton">Fullerton, CA</option>
<option value="us-cities/california_garden_grove">Garden Grove, CA</option>
<option value="us-cities/california_glendale">Glendale, CA</option>
<option value="us-cities/california_hayward">Hayward, CA</option>
<option value="us-cities/california_hollywood">Hollywood, CA</option>
<option value="us-cities/california_huntington_beach">Huntington Beach, CA</option>
<option value="us-cities/california_inglewood">Inglewood, CA</option>
<option value="us-cities/california_long_beach">Long Beach, CA</option>
<option value="us-cities/california_los_angeles">Los Angeles, CA</option>
<option value="us-cities/california_modesto">Modesto, CA</option>
<option value="us-cities/california_moreno_valley">Moreno Valley, CA</option>
<option value="us-cities/california_murrieta">Murrieta, CA</option>
<option value="us-cities/california_north_glendale">North Glendale, CA</option>
<option value="us-cities/california_norwalk">Norwalk, CA</option>
<option value="us-cities/california_oakland">Oakland, CA</option>
<option value="us-cities/california_oceanside">Oceanside, CA</option>
<option value="us-cities/california_ontario">Ontario, CA</option>
<option value="us-cities/california_orange">Orange, CA</option>
<option value="us-cities/california_oxnard">Oxnard, CA</option>
<option value="us-cities/california_oxnard_shores">Oxnard Shores, CA</option>
<option value="us-cities/california_palmdale">Palmdale, CA</option>
<option value="us-cities/california_pasadena">Pasadena, CA</option>
<option value="us-cities/california_pomona">Pomona, CA</option>
<option value="us-cities/california_rancho_cucamonga">Rancho Cucamonga, CA</option>
<option value="us-cities/california_richmond">Richmond, CA</option>
<option value="us-cities/california_riverside">Riverside, CA</option>
<option value="us-cities/california_roseville">Roseville, CA</option>
<option value="us-cities/california_sacramento">Sacramento, CA</option>
<option value="us-cities/california_salinas">Salinas, CA</option>
<option value="us-cities/california_san_bernardino">San Bernardino, CA</option>
<option value="us-cities/california_san_diego">San Diego, CA</option>
<option value="us-cities/california_san_francisco">San Francisco, CA</option>
<option value="us-cities/california_san_jose">San Jose, CA</option>
<option value="us-cities/california_santa_ana">Santa Ana, CA</option>
<option value="us-cities/california_santa_clara">Santa Clara, CA</option>
<option value="us-cities/california_santa_clarita">Santa Clarita, CA</option>
<option value="us-cities/california_santa_rosa">Santa Rosa, CA</option>
<option value="us-cities/california_simi_valley">Simi Valley, CA</option>
<option value="us-cities/california_stockton">Stockton, CA</option>
<option value="us-cities/california_sunnyvale">Sunnyvale, CA</option>
<option value="us-cities/california_temecula">Temecula, CA</option>
<option value="us-cities/california_thousand_oaks">Thousand Oaks, CA</option>
<option value="us-cities/california_torrance">Torrance, CA</option>
<option value="us-cities/california_universal_city">Universal City, CA</option>
<option value="us-cities/california_valencia">Valencia, CA</option>
<option value="us-cities/california_vallejo">Vallejo, CA</option>
<option value="us-cities/california_van_nuys">Van Nuys, CA</option>
<option value="us-cities/california_victorville">Victorville, CA</option>
<option value="us-cities/california_visalia">Visalia, CA</option>
<option value="us-cities/california_west_covina">West Covina, CA</option>
<option value="us-cities/colorado_arvada">Arvada, CO</option>
<option value="us-cities/colorado_aurora">Aurora, CO</option>
<option value="us-cities/colorado_centennial">Centennial, CO</option>
<option value="us-cities/colorado_colorado_springs">Colorado Springs, CO</option>
<option value="us-cities/colorado_denver">Denver, CO</option>
<option value="us-cities/colorado_fort_collins">Fort Collins, CO</option>
<option value="us-cities/colorado_lakewood">Lakewood, CO</option>
<option value="us-cities/colorado_pueblo">Pueblo, CO</option>
<option value="us-cities/colorado_thornton">Thornton, CO</option>
<option value="us-cities/colorado_westminster">Westminster, CO</option>
<option value="us-cities/connecticut_bridgeport">Bridgeport, CT</option>
<option value="us-cities/florida_brandon">Brandon, FL</option>
<option value="us-cities/florida_cape_coral">Cape Coral, FL</option>
<option value="us-cities/florida_clearwater">Clearwater, FL</option>
<option value="us-cities/florida_coral_springs">Coral Springs, FL</option>
<option value="us-cities/florida_fort_lauderdale">Fort Lauderdale, FL</option>
<option value="us-cities/florida_gainesville">Gainesville, FL</option>
<option value="us-cities/florida_hialeah">Hialeah, FL</option>
<option value="us-cities/florida_hollywood">Hollywood, FL</option>
<option value="us-cities/florida_jacksonville">Jacksonville, FL</option>
<option value="us-cities/florida_miami">Miami, FL</option>
<option value="us-cities/florida_miami_gardens">Miami Gardens, FL</option>
<option value="us-cities/florida_miramar">Miramar, FL</option>
<option value="us-cities/florida_orlando">Orlando, FL</option>
<option value="us-cities/florida_palm_bay">Palm Bay, FL</option>
<option value="us-cities/florida_pembroke_pines">Pembroke Pines, FL</option>
<option value="us-cities/florida_port_saint_lucie">Port Saint Lucie, FL</option>
<option value="us-cities/florida_saint_petersburg">Saint Petersburg, FL</option>
<option value="us-cities/florida_tallahassee">Tallahassee, FL</option>
<option value="us-cities/florida_tampa">Tampa, FL</option>
<option value="us-cities/georgia_athens">Athens, GA</option>
<option value="us-cities/georgia_atlanta">Atlanta, GA</option>
<option value="us-cities/georgia_columbus">Columbus, GA</option>
<option value="us-cities/georgia_savannah">Savannah, GA</option>
<option value="us-cities/hawaii_honolulu">Honolulu, HI</option>
<option value="us-cities/idaho_boise">Boise, ID</option>
<option value="us-cities/illinois_springfield">Springfield, IL</option>
<option value="us-cities/indiana_evansville">Evansville, IN</option>
<option value="us-cities/indiana_indianapolis">Indianapolis, IN</option>
<option value="us-cities/kansas_kansas_city">Kansas City, KS</option>
<option value="us-cities/kansas_olathe">Olathe, KS</option>
<option value="us-cities/kansas_overland_park">Overland Park, KS</option>
<option value="us-cities/kansas_topeka">Topeka, KS</option>
<option value="us-cities/kansas_wichita">Wichita, KS</option>
<option value="us-cities/kentucky_ironville">Ironville, KY</option>
<option value="us-cities/kentucky_lexington">Lexington, KY</option>
<option value="us-cities/kentucky_lexington_fayette">Lexington-Fayette, KY</option>
<option value="us-cities/kentucky_louisville">Louisville, KY</option>
<option value="us-cities/kentucky_meads">Meads, KY</option>
<option value="us-cities/louisiana_baton_rouge">Baton Rouge, LA</option>
<option value="us-cities/louisiana_lafayette">Lafayette, LA</option>
<option value="us-cities/louisiana_metairie">Metairie, LA</option>
<option value="us-cities/louisiana_metairie_terrace">Metairie Terrace, LA</option>
<option value="us-cities/louisiana_new_orleans">New Orleans, LA</option>
<option value="us-cities/louisiana_shreveport">Shreveport, LA</option>
<option value="us-cities/maryland_baltimore">Baltimore, MD</option>
<option value="us-cities/massachusetts_worcester">Worcester, MA</option>
<option value="us-cities/michigan_ann_arbor">Ann Arbor, MI</option>
<option value="us-cities/michigan_detroit">Detroit, MI</option>
<option value="us-cities/michigan_flint">Flint, MI</option>
<option value="us-cities/michigan_grand_rapids">Grand Rapids, MI</option>
<option value="us-cities/michigan_lansing">Lansing, MI</option>
<option value="us-cities/michigan_sterling_heights">Sterling Heights, MI</option>
<option value="us-cities/michigan_warren">Warren, MI</option>
<option value="us-cities/minnesota_minneapolis">Minneapolis, MN</option>
<option value="us-cities/minnesota_rochester">Rochester, MN</option>
<option value="us-cities/minnesota_saint_paul">Saint Paul, MN</option>
<option value="us-cities/mississippi_jackson">Jackson, MS</option>
<option value="us-cities/missouri_columbia">Columbia, MO</option>
<option value="us-cities/missouri_east_independence">East Independence, MO</option>
<option value="us-cities/missouri_independence">Independence, MO</option>
<option value="us-cities/missouri_kansas_city">Kansas City, MO</option>
<option value="us-cities/missouri_springfield">Springfield, MO</option>
<option value="us-cities/missouri_st_louis">St. Louis, MO</option>
<option value="us-cities/montana_billings">Billings, MT</option>
<option value="us-cities/nebraska_lincoln">Lincoln, NE</option>
<option value="us-cities/nebraska_omaha">Omaha, NE</option>
<option value="us-cities/nevada_enterprise">Enterprise, NV</option>
<option value="us-cities/nevada_henderson">Henderson, NV</option>
<option value="us-cities/nevada_las_vegas">Las Vegas, NV</option>
<option value="us-cities/nevada_north_las_vegas">North Las Vegas, NV</option>
<option value="us-cities/nevada_paradise">Paradise, NV</option>
<option value="us-cities/nevada_reno">Reno, NV</option>
<option value="us-cities/nevada_spring_valley">Spring Valley, NV</option>
<option value="us-cities/nevada_sunrise_manor">Sunrise Manor, NV</option>
<option value="us-cities/new_hampshire_manchester">Manchester, NH</option>
<option value="us-cities/new_jersey_edison">Edison, NJ</option>
<option value="us-cities/new_jersey_elizabeth">Elizabeth, NJ</option>
<option value="us-cities/new_jersey_jersey_city">Jersey City, NJ</option>
<option value="us-cities/new_jersey_newark">Newark, NJ</option>
<option value="us-cities/new_jersey_paterson">Paterson, NJ</option>
<option value="us-cities/new_mexico_albuquerque">Albuquerque, NM</option>
<option value="us-cities/new_york_amherst">Amherst, NY</option>
<option value="us-cities/new_york_borough_of_bronx">Borough of Bronx, NY</option>
<option value="us-cities/new_york_borough_of_queens">Borough of Queens, NY</option>
<option value="us-cities/new_york_brooklyn">Brooklyn, NY</option>
<option value="us-cities/new_york_buffalo">Buffalo, NY</option>
<option value="us-cities/new_york_east_new_york">East New York, NY</option>
<option value="us-cities/new_york_jamaica">Jamaica, NY</option>
<option value="us-cities/new_york_manhattan">Manhattan, NY</option>
<option value="us-cities/new_york_new_york_city">New York City, NY</option>
<option value="us-cities/new_york_rochester">Rochester, NY</option>
<option value="us-cities/new_york_staten_island">Staten Island, NY</option>
<option value="us-cities/new_york_syracuse">Syracuse, NY</option>
<option value="us-cities/new_york_yonkers">Yonkers, NY</option>
<option value="us-cities/north_carolina_cary">Cary, NC</option>
<option value="us-cities/north_carolina_charlotte">Charlotte, NC</option>
<option value="us-cities/north_carolina_durham">Durham, NC</option>
<option value="us-cities/north_carolina_fayetteville">Fayetteville, NC</option>
<option value="us-cities/north_carolina_greensboro">Greensboro, NC</option>
<option value="us-cities/north_carolina_high_point">High Point, NC</option>
<option value="us-cities/north_carolina_raleigh">Raleigh, NC</option>
<option value="us-cities/north_carolina_west_raleigh">West Raleigh, NC</option>
<option value="us-cities/north_carolina_wilmington">Wilmington, NC</option>
<option value="us-cities/north_carolina_winston_salem">Winston-Salem, NC</option>
<option value="us-cities/north_dakota_fargo">Fargo, ND</option>
<option value="us-cities/ohio_akron">Akron, OH</option>
<option value="us-cities/ohio_cincinnati">Cincinnati, OH</option>
<option value="us-cities/ohio_cleveland">Cleveland, OH</option>
<option value="us-cities/ohio_columbus">Columbus, OH</option>
<option value="us-cities/ohio_dayton">Dayton, OH</option>
<option value="us-cities/ohio_toledo">Toledo, OH</option>
<option value="us-cities/oklahoma_norman">Norman, OK</option>
<option value="us-cities/oklahoma_oklahoma_city">Oklahoma City, OK</option>
<option value="us-cities/oklahoma_tulsa">Tulsa, OK</option>
<option value="us-cities/oregon_eugene">Eugene, OR</option>
<option value="us-cities/oregon_gresham">Gresham, OR</option>
<option value="us-cities/oregon_portland">Portland, OR</option>
<option value="us-cities/oregon_salem">Salem, OR</option>
<option value="us-cities/pennsylvania_allentown">Allentown, PA</option>
<option value="us-cities/pennsylvania_erie">Erie, PA</option>
<option value="us-cities/pennsylvania_philadelphia">Philadelphia, PA</option>
<option value="us-cities/pennsylvania_pittsburgh">Pittsburgh, PA</option>
<option value="us-cities/rhode_island_providence">Providence, RI</option>
<option value="us-cities/south_carolina_charleston">Charleston, SC</option>
<option value="us-cities/south_carolina_columbia">Columbia, SC</option>
<option value="us-cities/south_dakota_sioux_falls">Sioux Falls, SD</option>
<option value="us-cities/tennessee_chattanooga">Chattanooga, TN</option>
<option value="us-cities/tennessee_clarksville">Clarksville, TN</option>
<option value="us-cities/tennessee_east_chattanooga">East Chattanooga, TN</option>
<option value="us-cities/tennessee_knoxville">Knoxville, TN</option>
<option value="us-cities/tennessee_memphis">Memphis, TN</option>
<option value="us-cities/tennessee_murfreesboro">Murfreesboro, TN</option>
<option value="us-cities/tennessee_nashville">Nashville, TN</option>
<option value="us-cities/tennessee_new_south_memphis">New South Memphis, TN</option>
<option value="us-cities/texas_abilene">Abilene, TX</option>
<option value="us-cities/texas_amarillo">Amarillo, TX</option>
<option value="us-cities/texas_arlington">Arlington, TX</option>
<option value="us-cities/texas_austin">Austin, TX</option>
<option value="us-cities/texas_beaumont">Beaumont, TX</option>
<option value="us-cities/texas_brownsville">Brownsville, TX</option>
<option value="us-cities/texas_carrollton">Carrollton, TX</option>
<option value="us-cities/texas_corpus_christi">Corpus Christi, TX</option>
<option value="us-cities/texas_dallas">Dallas, TX</option>
<option value="us-cities/texas_denton">Denton, TX</option>
<option value="us-cities/texas_el_paso">El Paso, TX</option>
<option value="us-cities/texas_fort_worth">Fort Worth, TX</option>
<option value="us-cities/texas_frisco">Frisco, TX</option>
<option value="us-cities/texas_garland">Garland, TX</option>
<option value="us-cities/texas_grand_prairie">Grand Prairie, TX</option>
<option value="us-cities/texas_houston">Houston, TX</option>
<option value="us-cities/texas_lubbock">Lubbock, TX</option>
<option value="us-cities/texas_midland">Midland, TX</option>
<option value="us-cities/utah_provo">Provo, UT</option>
<option value="us-cities/utah_salt_lake_city">Salt Lake City, UT</option>
<option value="us-cities/utah_west_jordan">West Jordan, UT</option>
<option value="us-cities/utah_west_valley_city">West Valley City, UT</option>
<option value="us-cities/washington_bellevue">Bellevue, WA</option>
<option value="us-cities/washington_everett">Everett, WA</option>
<option value="us-cities/washington_seattle">Seattle, WA</option>
<option value="us-cities/washington_spokane">Spokane, WA</option>
<option value="us-cities/washington_tacoma">Tacoma, WA</option>
<option value="us-cities/washington_vancouver">Vancouver, WA</option>
<option value="us-cities/wisconsin_green_bay">Green Bay, WI</option>
<option value="us-cities/wisconsin_madison">Madison, WI</option>
<option value="us-cities/wisconsin_milwaukee">Milwaukee, WI</option>
</select>
</div>
<div class="mv3" id="tz-variant-radio">
<label for="tz-variant" class="b mb2 pr2 db dib-ns">Use timezone</label>
<!-- standard -->
<input type="radio" id="standard" name="tz-variant" value="standard">
<label for="standard" class="pr2">Standard</label>
<!-- normal -->
<input type="radio" id="normal" name="tz-variant" value="normal" checked>
<label for="normal" class="pr2">Both</label>
<!-- dst -->
<input type="radio" id="dst" name="tz-variant" value="dst">
<label for="dst" class="pr2">DST</label>
</div>
<link href="https://unpkg.com/mobius1-selectr@latest/dist/selectr.min.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/mobius1-selectr@latest/dist/selectr.min.js" type="text/javascript"></script>
<div id="us-city-plot" aria-live="polite">
<figure role="group">
<img src="washington_d_c_normal.png" alt="Washington, D.C.">
<figcaption>Sunrise and sunset times in Washington, D.C.</figcaption>
</figure>
</div>
<script type="text/javascript">
const selectr = new Selectr('#us-city')
function updateUSCityPlot () {
  const option = selectr.getSelected()[0]
  const plotDiv = document.getElementById('us-city-plot')
  const plotImg = plotDiv.querySelector('img')
  const plotTz = document.querySelector('input[name="tz-variant"]:checked')
  plotImg.src = `${option.value}_${plotTz.value}.png`
  plotImg.alt = option.innerText
  plotDiv.querySelector('figcaption').innerText = `Sunrise and sunset times in ${option.innerText}`
}
updateUSCityPlot()
selectr.on('selectr.change', updateUSCityPlot)
document.getElementById('tz-variant-radio').addEventListener('change', updateUSCityPlot)
</script>

## Inspiration

[How long are the nights?](https://plotparade.com/gallery_sunrise.html)

![How long are the nights in New York City? by [Krisztina Szucs](https://krisztinaszucs.com/)](https://plotparade.com/chartimg/SUNRISE/c_NYC.jpg)

## Where are you?

``` r
location <- as.list(ipapi::geolocate(NA, .progress = FALSE))
location$lat <- location$lat + runif(1, min = -1)
location$lon <- location$lon + runif(1, min = -1)

location[c("lat", "lon", "timezone")]
```

    ## $lat
    ## [1] 35.00361
    ## 
    ## $lon
    ## [1] -84.61931
    ## 
    ## $timezone
    ## [1] "America/New_York"

## Sunrise and Sunset Times

``` r
sun_times <- 
  suncalc::getSunlightTimes(
    date = seq(
      as.Date("2022-01-01"),
      as.Date("2023-01-01"),
      by = "day"
    ),
    lat = location$lat,
    lon = location$lon,
    tz = location$timezone,
    keep = c("dawn", "nauticalDawn", "dusk", "nauticalDusk", "sunrise", "sunset")
  )
```

## Tidy Sun Times

``` r
library(tidyverse)

tidy_sun_times <- 
  sun_times %>% 
  select(-lat, -lon) %>%
  pivot_longer(-date, names_to = "event", values_to = "time") %>% 
  mutate(
    tz = strftime(time, "%Z"), 
    time = hms::as_hms(time)
  )
```

## First Looks

``` r
ggplot(tidy_sun_times) + 
  aes(x = date, y = time, color = event) +
  geom_line()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-first-looks-1.png" width="864" />

## Paired Events (Start and End)

``` r
tidier_sun_times <- 
  tidy_sun_times %>%
  mutate(
    period = case_when(
      str_detect(event, "[dD]awn|sunrise") ~ "starts",
      str_detect(event, "[dD]usk|sunset") ~ "ends"
    ),
    label = recode(
      event,
      nauticalDusk = "nauticalDawn",
      sunset = "sunrise",
      dusk = "dawn"
    )
  ) %>% 
  pivot_wider(
    names_from = "period", 
    values_from = "time"
  ) %>% 
  group_by(date, tz, label) %>% 
  summarize(
    events = paste(event, collapse = ","),
    label = first(event),
    starts = starts[!is.na(starts)],
    ends = ends[!is.na(ends)]
  ) %>% 
  ungroup() %>% 
  mutate(label = factor(label, c("nauticalDawn", "dawn", "sunrise")))
```

## Another plot

``` r
ggplot(tidier_sun_times) +
  aes(date, ymin = starts, ymax = ends, fill = label) +
  geom_ribbon()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-tidier-sun-times-1.png" width="864" />

Reverse the time axes and provide our own labels

``` r
ggplot(tidier_sun_times) +
  aes(date, ymin = starts, ymax = ends, fill = label) +
  geom_ribbon() +
  scale_y_reverse(
    limits = c(24*60^2, 0),
    breaks = seq(0, 24*60^2, by = 3 * 60^2),
    labels = paste0(seq(0, 24, by = 3), ":00"),
    expand = expansion()
  )
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-tidier-sun-times-2-1.png" width="864" />

## Make it pretty

``` r
sysfonts::font_add_google("Outfit")
```

``` r
x_breaks <- seq(
  from = as.Date("2022-01-01"),
  to = as.Date("2023-01-01"),
  by = "2 months"
)
y_breaks <- seq(0, 24*60^2, by = 3 * 60^2)
color_text <- "#F2CDB9"
color_bg <- "#39304a"

ggplot(tidier_sun_times) +
  aes(date) +
  geom_text(
    data = cross_df(list(date = x_breaks, time = y_breaks, label = "+")) %>% 
      mutate(across(date, as.Date, origin = "1970-01-01")),
    aes(label = label, y = time),
    color = "#C29F5F"
  ) +
  geom_ribbon(
    aes(ymin = starts, ymax = ends, fill = label, alpha = label),
    show.legend = FALSE
  ) +
  geom_hline(
    yintercept = c(9, 17) * 60^2,
    color = color_bg,
    alpha = 0.5,
    linetype = 2
  ) +
  annotate(
    geom = "text",
    x = min(tidier_sun_times$date),
    y = c(9, 17) * 60^2,
    label = c("9am", "5pm"),
    color = color_bg,
    hjust = -0.25,
    vjust = c(2, -1)
  ) +
  geom_text(
    data = . %>% 
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_head(n = 1),
    aes(y = ends, label = tz),
    hjust = 1,
    vjust = 1,
    nudge_x = -21,
    nudge_y = -60^2 * 1.5,
    lineheight = 0.8,
    color = color_text
  ) +
  geom_curve(
    data = . %>% 
      filter(label == "nauticalDawn") %>%
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_head(n = 1), 
    aes(x = date - 17, xend = date, y = ends - (-60^2 * 1.2), yend = ends + 500),
    arrow = arrow(length = unit(0.08, "inch")), 
    size = 0.5,
    color = color_text,
    curvature = 0.4
  ) +
  geom_text(
    data = . %>% 
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_tail(n = 1),
    aes(y = starts, label = tz),
    hjust = 1,
    nudge_x = -21,
    nudge_y = 60^2 * 1.5,
    lineheight = 0.8,
    color = color_text
  ) +
  geom_curve(
    data = . %>% 
      filter(label == "nauticalDawn") %>%
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_tail(n = 1),
    aes(x = date - 17, xend = date, y = starts - 60^2, yend = starts - 500),
    arrow = arrow(length = unit(0.08, "inch")), 
    size = 0.5,
    color = color_text,
    curvature = -0.4
  ) +
  ggrepel::geom_label_repel(
    data = . %>% filter(date == max(date)) %>% 
      separate_rows(events, sep = ",") %>% 
      mutate(
        date = date + 12,
        time = if_else(events == label, starts, ends),
        events = snakecase::to_title_case(events)
      ),
    aes(y = time, fill = label, label = events),
    color = color_bg,
    fontface = "bold",
    show.legend = FALSE,
    direction = "y",
    min.segment.length = 20,
    hjust = 0,
    label.size = 0,
    label.padding = 0.33,
    box.padding = 0.25,
    xlim = c(as.Date("2023-01-07"), NA)
  ) +
  scale_fill_manual(
    values = c(
      nauticalDawn = "#b56576",
      dawn = "#eaac8b",
      sunrise = "#ffd27d"
    )
  ) +
  scale_alpha_discrete(range = c(0.5, 0.9)) +
  scale_x_date(
    breaks = x_breaks, 
    date_labels = "%b", 
    limits = c(
      as.Date("2022-01-01"),
      as.Date("2023-03-15")
    ),
    expand = expansion()
  ) +
  scale_y_reverse(
    limits = c(max(tidier_sun_times$ends + 60^2), min(tidier_sun_times$starts - 60^2)),
    breaks = y_breaks,
    labels = paste0(seq(0, 24, by = 3), ":00"),
    expand = expansion()
  ) +
  labs(
    x = NULL,
    y = NULL,
    title = "How long are the days near me?",
    subtitle = "Atlanta, GA",
    caption = "garrickadenbuie.com"
  ) +
  coord_cartesian(clip = "off") +
  theme_minimal(base_family = "Outfit", base_size = 16) +
  theme(
    plot.title = element_text(color = color_text, hjust = 0, size = 14),
    plot.subtitle = element_text(color = color_text, hjust = 0, size = 24, margin = margin(b = 6)),
    plot.title.position = "plot",
    plot.background = element_rect(fill = color_bg),
    plot.margin = margin(20, 0, 20, 10),
    # panel.border = element_rect(color = color_text, fill = NA),
    panel.grid = element_blank(),
    axis.text = element_text(color = color_text),
    axis.title = element_text(color = color_text),
    plot.caption = element_text(color = "#726194", hjust = 0.97, vjust = -1),
    plot.caption.position = "plot"
  )
```

<!-- html_preserve -->
<style type="text/css">
.city-plots {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 1em;
}
.selectr-selected {
  border-width: 0;
}
.custom-bg-light,
.selectr-selected {
  background-color: var(--slate-90);
}
.selectr-options-container,
.selectr-input-container,
.selectr-input {
  background-color: var(--siteBgColorCustom);
  border-color: var(--slate-90);
  color: var(--textColorCustom);
}
.selectr-option.selected {
  color: var(--textColorCustom);
  background-color: var(--purple-90);
}
.selectr-option.active {
  color: var(--textColorCustom);
  background-color: var(--purple-80);
}
@media (prefers-color-scheme: dark) {
  .custom-bg-light,
  .selectr-selected {
    background-color: var(--slate-20);
  }
  .selectr-options-container,
  .selectr-input-container,
  .selectr-input {
    background-color: var(--siteBgColorCustom);
    border-color: var(--slate-20);
    color: var(--textColorCustom);
  }
  .selectr-option.selected {
    color: var(--textColorCustom);
    background-color: var(--purple-10);
  }
  .selectr-option.active {
    color: var(--textColorCustom);
    background-color: var(--purple-20);
  }
}
</style>
<script type="text/javascript">
function updatePlotSelectedCity() {
  const plot = document.getElementById('city-plot')
  const inputCity = document.getElementById('choose-city')
  plot.src = inputCity.value
  plot.setAttribute('alt', inputCity.dataset.city)
}
document.addEventListener('DOMContentLoaded', updatePlotSelectedCity)
document.getElementById('choose-city').addEventListener('change', updatePlotSelectedCity)
Array.from(
  document.getElementById('choose-city').parentElement.querySelectorAll('button')
).map(btn => btn.addEventListener('click', function(ev) {
    const inputCity = document.getElementById('choose-city')
    const idxCurrent = Array.from(inputCity.options).findIndex(el => inputCity.value == el.value)
    let idxNext = idxCurrent + (ev.currentTarget.id === 'choose-city-prev' ? -1 : 1)
    console.log({idxCurrent, idxNext})
    if (idxNext < 0) {
      idxNext = inputCity.options.length - 1
    } else if (idxNext >= inputCity.options.length) {
      idxNext = 0
    }
    inputCity.value = inputCity.options[idxNext].value
    inputCity.dispatchEvent(new Event('change'))
  })
)
</script>
<!-- /html_preserve -->

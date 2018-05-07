---
title: "Unsupervised behavior change detection using passive sensor systems in the homes of older adults"
author: ~ 
date: '2018-05-07'
slug: gerontechnology
categories: []
tags: 
  - Research
  - Smart Home
  - Gerontechnology
  - Ambient Assisted Living

talk_author:
  - Garrick Aden-Buie
  - Ali Yalcin, Ph.D.
  - Carla VandeWeerd, Ph.D.
talk_date: "7 May 2018"
talk_type: "Conference Presentation"
talk_event: "Gerontechnology 2018"
talk_event_url: http://www.sfu.ca/fc/ISG2018.html
# talk_venue: "Conference Center"
talk_location: "St. Petersburg, FL"
talk_slides_url: http://gadenbuie.github.io/isg-2018
---

### Abstract

#### Purpose

Globally and within the United States, we face well-known and documented
challenges driven by growth within the elderly segments of our population. The
majority of adults over 65 are healthy but managing one or more chronic
illnesses, and older adults and their informal caregivers---such as family
members and friends---require supportive technologies that assist in monitoring
and managing these conditions<sup>1</sup> as they strive to maintain independence at
home. An important goal of lifestyle reassurance monitoring is to alert older
adults and their caregivers to changes in behavior or routine. In contrast with
traditional activity recognition algorithms that require labelled activity data
that is both difficult and expensive to collect<sup>2</sup>, we present a method for
unsupervised behavior change detection that does not require explicit,
higher-level activity labels and is effective when applied to real-world,
natural, smart home activity data.

#### Methods

In this project, we developed a passive sensor system that has been installed to
date in the homes of 14 community-dwelling, older adults (aged 68 and above) who
live alone and were of good health at the time of installation. Participants
responded to a bi-weekly survey tracking the occurrence of health changes.
Included in the sensor network are motion sensors for the generalized detection
of presence throughout the home, and magnetic contact sensors for detection of
interaction with entrance and exit doors and routinely used objects. All sensors
are wireless, use the Z-Wave protocol, and are readily available commercially.
The basis of the behavior change algorithm is the use of a bag of event sequence
n-grams representation<sup>3</sup> to summarize daily activity patterns in an activity
profile and a permutation-based change detection algorithm<sup>4</sup> to compare
activity profiles of multiple days (e.g. a baseline period of activity) and
individual or grouped activity profiles.

#### Results and Discussion

The bag of event *n*-grams method was first validated as a supervised
classification problem in which activity profiles were used to identify
occupants from 6 homes with identical layouts. Activity profiles based on 4 and
6 weeks of activity led to correct identification of a given occupant for
unlabelled days of activity with high accuracy (0.9593, 0.9624) and F1 (0.9590,
0.9621). The algorithm for unsupervised behavior change was applied to the
activity data from four participants over a period of one year (one participant)
or two years (three participants) who reported health changes ranging from acute
episodes of illness to mobility restrictions leading to major surgery.
Preliminary results reveal that comparison of activity profiles over time
windows of 1 to 4 weeks reliably detects major shifts in behavior or other
systematic disturbances such as guests in the home or sensor reliability issues.
Linking the output of the algorithm to a notification system will alert family
members, caregivers, and system administrators to trigger follow-up and review
when such issues arise.

#### References

1. Demiris G, Hensel BK. Technologies for an aging society: A systematic
review of "smart home" applications. Yearbook of medical informatics.
2008 Jan;33--40

2. Szewcyzk S, Dwan K, Minor B, Swedlove B, Cook D. Annotating smart
environment sensor data for activity learning. Technology and Health
Care. 2009 Jan;17(3):161--169.

3. Hamid R, Johnson A, Batta S, Bobick A, Isbell C, Coleman G. Detection
and explanation of anomalous activities: Representing activities as bags
of event n-grams. Proceedings - 2005 IEEE Computer Society Conference on
Computer Vision and Pattern Recognition, CVPR 2005. 2005;1031--1038.

4. Sprint G, Cook DJ, Schmitter-Edgecombe M. Unsupervised detection and
analysis of changes in everyday physical activity data. Journal of
Biomedical Informatics. 2016 Oct;63(Supplement C):54--65
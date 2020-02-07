# CurbCorruption
the code base for Curb-Corruption portal developed for SIH 2020.
This is a solution and an implementation of a problem statement of the Smart India Hackathon 2020. This solution focussed on combating bribery and digital policing.
Team Name: BanderSnatch
- [QnA for the product](https://github.com/Nipunnyka/CurbCorruption/blob/master/SIH%20QnA.pdf)
- [Presentation for the product](https://github.com/Nipunnyka/CurbCorruption/blob/master/SIHppt.pdf)

Our team developed a working web and mobile app which centered on the following aspects:
```
    1. A reporting system which allows users to report the incidents where they were asked to pay a bribe.
```
```
    2. A bribe addressing system where users can report the incidents where they had to pay a bribe.
```
In future, we aim to employ **data visualization** to help make information more open as to facilitate upward transparency.
The reporting mechanism guaratees anonimity if the user opts for it, to ensure that **reliable anonymous reports** we have a report similarity checking mechanism. Furthermore, based on the reports we will generate an **early warning system** that predicts the chances of corruption happening in a department of a particular location. To automate the process we have deployed a flask based API that **mines for the essential parameters** for the Early Warning System based on the the report's location.

[Link to Video Demo]

## Getting Started:
Since the prototype has not been integrated each subsection has a README file with instructions on running the Application, the project currently is divided into the following five subsections:
- [NodeJS WebApp](https://github.com/Nipunnyka/CurbCorruption/tree/master/WebAppQC)
- [Flask API](https://github.com/Nipunnyka/CurbCorruption/tree/master/API)
- [Flutter Mobile Application](https://github.com/Nipunnyka/CurbCorruption/tree/master/SIH-Mobile-App)
- [Similar Report Detection](https://github.com/Nipunnyka/CurbCorruption/tree/master/report_similarity_model)
- [Early Warning System](https://github.com/Nipunnyka/CurbCorruption/tree/master/early_warning_system)

## Deployed Prototypes:
*the following have been deployed on **heroku***
- [NodeJS Web App](https://curb-corruption.herokuapp.com/)  
- [Flask API](https://curb-corruption-api.herokuapp.com/?city=Mumbai&state=Maharashtra) 
- [Android APK](https://github.com/Nipunnyka/CurbCorruption/blob/master/SIH-Mobile-App/sih_app-2.apk)
 
## Acknowledgements:
- [Towards Digital Anti-Corruption Typology for Public Service Delivery](https://dl.acm.org/doi/abs/10.1145/3325112.3325266): helped in ascertaining which digital solution to deploy in the local context of India.

- [Are emerging technologies helpingwin the fight against corruption indeveloping countries?](http://www.govtransparency.eu/wp-content/uploads/2019/02/ICT-corruption-24Feb19_FINAL.pdf): helped in ascertaining which digital solution to deploy in the local context of India.

- [Predicting Public Corruption with Neural Networks](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3075828): basis of our warning system, lays out the parameters which help predict corruption levels.


## Contributors
Thanks goes to these wonderful people:
<table>
  <tr>
    <td align="center"><a href="https://github.com/Nipunnyka"><img src="https://avatars.githubusercontent.com/Nipunnyka" width="100px;" alt=""/><br /><sub><b>Nipunika</b></sub></a><br /> </td>
    <td align="center"><a href="https://github.com/github-sr"><img src="https://avatars.githubusercontent.com/github-sr" width="100px;" alt=""/><br /><sub><b>Sachin Kumar Roy</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Ayush-KS"><img src="https://avatars2.githubusercontent.com/u/45496026?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Ayush Kumar Singh</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/AloxGit"><img src="https://avatars2.githubusercontent.com/u/45495804?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Alok Anand</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/manalarora"><img src="https://avatars2.githubusercontent.com/u/42407286?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Manan Arora</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/pgcoder27"><img src="https://avatars1.githubusercontent.com/u/48362539?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Prakhar Garg</b></sub></a><br /></td>
   </tr>
</table>


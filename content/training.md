---
title: "Personalized Training and Workshops"
slug: training
twitterImage: /training/training-social-card.png
description: Personalized R Training and Workshops by an RStudio Certified Education Training Partner.
date: 2019-09-13T00:00:00+00:00
type: page
---

<object data="training.svg" type="image/svg+xml" class="training-header">
  <img src="training.png" />
</object>

<p>
  I am an
  <a href="https://rstudio-trainers.netlify.com"><em>RStudio Education</em> Certified Trainer</a> and I'm passionate about enabling data scientists to use and master the powerful tools provided by <strong>R</strong>. I strive for engaging, approachable, project-oriented educational experiences in settings ranging from one-on-one mentorship to multi-day workshops.
</p>

<div class="topic-lists">
<ul>
<li>Introduction to R</li>
<li>Dynamic Reports with R&nbsp;Markdown</li>
<li>Tidy Data and the <code>tidyverse</code></li>
<li>Data Visualization</li>
</ul>

<ul>
<li>Interactive Apps with Shiny</li>
<li>JavaScript and Web&nbsp;Development</li>
<li>Git and Version Control</li>
<li>Project Management</li>
</ul>
</div>

<p>
I love teaching a range of data science and programming topics, including those listed above, and I'm happy to develop custom materials that address your or your team's specific needs.
</p>

<div class="email-divider">
<div class="email-divider-line"></div>
<div class="email-divider-icon">
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
</div>
<div class="email-divider-line"></div>
</div>

<h3>Contact Me</h3>

<p>I'd love to talk with you about how I can help empower your team to make the most of your data with <strong>R</strong>. Please fill out the form below to start the conversation.
</p>

<form action="https://formstatic.dev" method="post" class="stack-large contact-form" onsubmit="return validateForm()">
    <input type="hidden" name="$processor" value="email">
    <input type="hidden" name="$to" value="garrick@adenbuie.com">
    <input type="hidden" name="$reply_to" value="garrick@adenbuie.com">
    <input type="hidden" name="$subject" value="Training Inquiry">
    <input type="hidden" name="$redirect_to" value="https://www.garrickadenbuie.com/training/?thanks=true">
    
    <div class="stack-small name-email">
    <label for="name">Your Name</label>
    <input type="text" name="name" placeholder="Your Name">
    </div>
    
    <div class="stack-small name-email">
    <label for="email">Your Email</label>
    <input type="text" name="email" placeholder="Your Email">
    </div>
    
    <textarea name="message" placeholder="How can I help you?"></textarea>
    <div class="button-row stack-small">
    <button type="submit">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send" id="send-icon"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg> 
      Send
    </button>
    <div id="contact-form-feedback"></div>
    <div id="thanks">
      <p>Thank you for your message, I'll be in touch with you soon!</p>
    </div>
    </div>
</form>

<style>
object[type*="svg"] {
  width: 100%;
}
.topic-lists {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 1em;
}
.topic-lists {
  margin: 2em 0 1em 0;
  padding: 0;
}
@media screen and (max-width: 450px) {
  .topic-lists {
    grid-template-columns: 1fr;
    grid-gap: 0;
    margin: 1em auto;
    width: max-content;
  }
}
.topic-lists ul {
  list-style: none;
  padding: 0;
}
.topic-lists li {
  line-height: 18px;
  padding-left: 26px;
}
.topic-lists li + li {
  margin-top: 1em;
}
.topic-lists li::before {
	background-image: url(hexagon.svg);
	width: 18px;
	height: 18px;
	display: inline-block;
	content: '';
	margin-right: 0.5em;
	vertical-align: middle;
	opacity: 0.85;
	margin-left: -26px;
}
.contact-form button {
	padding: 0.5em 1em;
	text-decoration: none;
	border: solid 1px #002B36;
	border-radius: 4px;
	color: #002B36;
	background-color: #FFFFFF;
  font-size: 1em;
}
.contact-form button:hover {
  background-color: #002B36;
  color: #FFFFFF;
  cursor: pointer;
}
#send-icon {
	height: 15px;
	width: 15px;
	margin: 0 0.25em -2px -0.25em;
}
.contact-form label {
  display: block;
}
.contact-form input, .contact-form textarea {
  width: 100%;
  max-width: 800px;
  border: 1px solid #E4E9E9;
  border-radius: 7px;
  padding: 10px;
  font-size: 0.8em;
}
.contact-form input {
  height: 40px;
  transition: border-color 0.5s ease-in-out;
}
.contact-form textarea {
  height: 150px;
  font-family: inherit;
}
.contact-form input.invalid {
  border-color: #DC322F;
}
#contact-form-feedback {
  font-size: 0.8em;
  color: #DC322F;
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
}
#contact-form-feedback.invalid {
  opacity: 1;
}
#thanks {
  opacity: 0;
}
@media screen and (min-width: 480px) and (max-width: 767px) {
  .contact-form .name-email {
    width: 47.5%;
    float: left;
  }
  .name-email + .name-email {
    margin-left: 5%;
  }
}
@media screen and (min-width: 1020px) {
  .contact-form .name-email {
    width: 47.5%;
    float: left;
  }
  .name-email + .name-email {
    margin-left: 5%;
  }
}
[class^="stack"] {
  margin-top: 0;
  margin-bottom: 0;
}
.stack-small > * + * {
  margin-top: 0.5em;
}
.stack-large > * + * {
  margin-top: 1em;
}
.email-divider {
  display: grid;
  width: 100%;
  text-align: center;
  grid-template-columns: 1fr auto 1fr;
  grid-column-gap: 1em;
  align-items: center;
  justify-items: center;
  margin: 1.5em 0;
}
.email-divider-line {
  height: 2px;
  width: 100%;
  background: #002B3640;
}
.email-divider-icon {
  min-width: 48px;
}
.feather-mail {
  color: #DC322F;
  vertical-align: middle;
}
</style>

<script>
const email = document.querySelector('input[name="email"]')
const feedback = document.getElementById('contact-form-feedback')

const validateEmail = (s) => {
  // https://stackoverflow.com/a/9204568
  return s === '' ? true : /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s)
}

function validateForm() {
  const eml = email.value
  feedback.classList.remove('invalid')
  if (eml === '' || !validateEmail(eml)) {
    if (eml === '') {
      feedback.innerHTML = 'Please enter your email address so that I can reply to you.'
    } else {
      feedback.innerHTML = 'Please check your email address.'
    }
    feedback.classList.add('invalid')
    email.classList.add('invalid')
    return false
  }
  feedback.innerHTML = ''
  return true
}

email.addEventListener('keyup', e => {
  const eml = e.target.value
  const isValid = validateEmail(eml)
  email.classList.toggle('invalid', !isValid)
  const reply = document.querySelector('input[name="$reply_to"]')
  if (eml !== '' && isValid) {
    // update reply_to field in form
    reply.value = eml
  } else {
    reply.value = 'garrick@adenbuie.com'
  }
})

// show thank you message
if (new RegExp(/#thanks/).test(window.location)) {
  document.getElementById("thanks").style.opacity = 1
}
// set correct redirect url
const this_url = new URL(window.location)
const redirect_url = this_url.origin + "/training/#thanks"
const redirect = document.querySelector('input[name="$redirect_to"]')
redirect.value = redirect_url
</script>
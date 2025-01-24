---
engine: epoxy
---

<work-item>
Action: {action}
Title: {title}
Type: {ifelse(personal, 'Personal Work', 'Professional Work')}
Link: {url}

<work-description>
{body}
</work-description>
</work-item>

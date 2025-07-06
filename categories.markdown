---
layout: page
title: Categories
navbar: Categories
permalink: /categories/
---

{% assign category_names = "" | split: "" %}
{% for category in site.categories %}
  {% assign category_names = category_names | push: category[0] %}
{% endfor %}
{% assign category_names = category_names | sort %}
  
<div>
  <ul>
    {% for category in category_names %}
      <li>
        <a href="{{ root_url }}/{{ site.category_path }}/{{ category | slugify }}">{{ category }}  ({{ site.categories[category].size }})</a>
      </li>
    {% endfor %}
  </ul>
</div>

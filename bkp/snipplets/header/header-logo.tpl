{% if template == 'home' %}
    <h1 class="h3 m-0">
{% endif %}
<div id="logo" class="logo-img-container {% if not has_logo %}hidden{% endif %}">
    {{ store.logo('medium') | img_tag(store.name, {class: 'logo-img  transition-soft'}) | a_tag(store.url) }}
</div>
<div id="no-logo" class="logo-text-container {% if has_logo %} hidden{% endif %}">
    <a class="logo-text h3" href="{{ store.url }}">{{ store.name }}</a>
</div>
{% if template == 'home' %}
    </h1>
{% endif %}
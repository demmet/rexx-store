<div class="nav-desktop col-lg-8 offset-lg-2 col-12 d-flex justify-content-between align-items-center">
    <ul class="nav-desktop-list" data-store="navigation">
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'desktop_nav' : true } %}
    </ul>
    {% snipplet "social/custom.tpl" %}
</div>
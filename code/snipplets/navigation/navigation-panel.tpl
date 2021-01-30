<div class="nav-primary">
    <ul class="nav-list" data-store="navigation">
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'mobile_nav' : true  } %}
    </ul>
</div>

<div class="nav-secondary" data-store="account-links">
    <ul class="nav-account">
        {% if not customer %}
            {% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-2x mr-2 ml-3"} %}
            {% if 'mandatory' not in store.customer_accounts %}
                <li class="nav-accounts-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'nav-accounts-link') }}</li>
            {% endif %}
            <li class="nav-accounts-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'nav-accounts-link') }}</li>
        {% else %}
            {% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-2x-half mr-2 ml-3"} %}
            <li>
                <strong class="nav-accounts-item mb-0">{{ "¡Hola, {1}!" | t(customer.name) }}</strong> 
                <ul class="d-flex m-0 p-0">
                    <li class="nav-accounts-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'nav-accounts-link') }}</li>
                    <li class="nav-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'nav-accounts-link') }}</li>
                </ul>
            </li>
        {% endif %}
    </ul>
</div>
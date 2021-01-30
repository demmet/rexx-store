{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        {% if mobile %}
            {# Show subtitle only for mobile applied filters #}
            <div class="mt-4 mb-2">{{ 'Filtro aplicado:' | translate }}</div>
        {% endif %}
        {% for product_filter in product_filters %}
            {% for value in product_filter.values %}

                {# List applied filters as tags #}
                
                {% if value.selected %}
                    <button class="js-remove-filter chip" data-filter-name="{{ product_filter.name|replace("'","%27") }}" data-filter-value="{{ value.name|replace("'","%27") }}">
                        {{ value.name }}
                        {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline chip-remove-icon"} %}
                    </button>
                {% endif %}
            {% endfor %}
        {% endfor %}
        <a href="#" class="js-remove-all-filters btn-link btn-link-primary d-inline-block mt-1">{{ 'Borrar filtros' | translate }}</a> 
    {% endif %}
{% else %}

    {# Filters list #}

    <div id="filters" class="visible-when-content-ready" data-store="filters-nav">
        {% if not mobile %}
            <h3 class="title-section mb-2 d-none d-md-block">{{ "Filtrar por" | translate }}</h3>
        {% endif %}
        {% for product_filter in product_filters %}
            {% if product_filter.has_products %}
            
                <div class="mb-5" data-store="filters-group">
                    <div class="mb-3 mt-4 {% if mobile %}h5{% else %}h6{% endif %}">{{product_filter.name}}</div>
                    {% set index = 0 %}
                    {% for value in product_filter.values %}
                        {% if value.product_count > 0 %}
                            {% set index = index + 1 %}

                            <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.name|replace("'","%27") }}" data-filter-value="{{ value.name|replace("'","%27") }}">
                                <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                <span class="checkbox">
                                    <span class="checkbox-icon"></span>
                                    <span class="{% if not mobile %}font-small{% endif %} checkbox-text with-color">
                                        {{ value.name }} ({{ value.product_count }})
                                    </span>
                                    {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                        <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                    {% endif %}
                                </span>
                            </label>
                            {% if index == 8 and product_filter.values_with_products > 8 %}
                                <div class="js-accordion-container" style="display: none;">
                            {% endif %}
                            
                        {% endif %}
                        {% if loop.last and product_filter.values_with_products > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle d-inline-block btn btn-secondary btn-small py-1 px-2 mt-2">
                                <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </div>
            {% endif %}
        {% endfor %}
    </div>
{% endif %}
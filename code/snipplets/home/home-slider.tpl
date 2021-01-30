<section class="js-home-slider-container{% if not settings.slider or settings.slider is empty %} hidden{% else %}{% if not settings.slider_full %} mt-4{% endif %} mb-4{% endif %}" data-store="slider-main">
	<div class="container{% if settings.slider_full %}-fluid{% endif %}">
        <div class="row">
        	<div class="col section-slider{% if settings.slider_full %} p-0{% endif %}">
				<div class="js-home-slider nube-slider-home swiper-container{% if settings.theme_rounded and not settings.slider_full %} box-rounded{% endif %} swiper-container-horizontal">
				    <div class="swiper-wrapper">
				        {% for slide in settings.slider %}
			                <div class="swiper-slide slide-container">
			                	{% if slide.link %}
			                		<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
			                	{% endif %}	
			                	{% set has_text =  slide.title or slide.description or slide.button %}
			                	<div class="slider-slide">

			                		<img {% if loop.first %}src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image"{% else %}src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image swiper-lazy blur-up-huge"{% endif %}>

			                		{% if has_text %}
			                			<div class="swiper-text swiper-{{ slide.color }}">	
				                			{% if slide.description %}
				                				<div class="swiper-description mb-3">{{ slide.description }}</div>
				                			{% endif %}
				                			{% if slide.title %}
				                				<div class="swiper-title">{{ slide.title }}</div>
				                			{% endif %}
				                			{% if slide.button and slide.link %}
				                				<div class="btn btn-primary btn-small swiper-btn mt-4 px-4">{{ slide.button }}</div>
				                			{% endif %}
				                		</div>
		                			{% endif %}
					            </div>
					            {% if slide.link %}
					            	</a>
					            {% endif %}
			            	</div>
				        {% endfor %}
				    </div>
					<div class="js-swiper-home-pagination swiper-pagination swiper-pagination-bullets d-block">
						{% if settings.slider > 1 and not params.preview %}
							{% for slide in settings.slider %}
								<span class="swiper-pagination-bullet"></span>
							{% endfor %}
						{% endif %}
					</div>
				    <div class="js-swiper-home-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-2x mr-1"} %}</div>
			        <div class="js-swiper-home-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-2x ml-1"} %}</div>
				</div>
			</div>
		</div>
	</div>
</section>
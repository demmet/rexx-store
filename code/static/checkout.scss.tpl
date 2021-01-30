{% if store.allows_checkout_styling %}

/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style-colors.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style-async.scss.tpl --> For non critical styles witch will be loaded asynchronously
        -static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$accent-brand-color: {{ settings.primary_color | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: {{ settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{# /* // Font */ #}

$heading-font: {{ settings.font_headings | default('Muli') | raw }};
$body-font: {{ settings.font_rest | default('Muli') | raw }};

{# /* // Box */ #}
$box-border-color: rgba($foreground-color, .3);

$box-radius: 10px;
$box-background: lighten($background-color, 10%);
$box-shadow: none;
$form-control-radius: 6px;

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{# /* // Mixins */ #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{% if not store.is_react_checkout_eligible %}

{#/*============================================================================
  New-checkout
==============================================================================*/#}

body {
  font-family: $body-font;
  font-weight: 100;
  background-color: $background-color;
}
a {
  color: darken($accent-brand-color, 5%);
  &:hover, &:focus {
    color: darken($accent-brand-color, 20%);
  }
}
strong { 
  font-weight: 400; 
}
.main-container {
  background-color: $background-color;
}
.header { 
  background-color: lighten($accent-brand-color, 5%);
  border-bottom: 2px solid $accent-brand-color;
}
.form-box {
  border-radius: $box-radius;
  padding: 10px 20px 20px 20px;
  background: $box-background;
  border: 1px solid $box-border-color;
  box-shadow: $box-shadow;
}
.form-box h1 {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom: 1px solid darken($background-color, 10%);
  font-weight: bold;
}
.form-control {
  background: lighten($accent-brand-color, 100%);
}
.form-control:focus, select:focus, textarea:focus {
  border-color: $accent-brand-color !important;
  outline: none;
}
.input-group-addon-focus {
  border-color: $accent-brand-color !important;
}
.whatsapp-content .whatsapp-form {
  input, .input-group-addon {
    border-color: $accent-brand-color;    
  }
}

.form-control-help {
  color: $accent-brand-color;

  &-icon {
    background-color: $accent-brand-color;
    color: $background-color;

    &:hover {
      color: $background-color;
    }

    &.pressed {
      background-color: $background-color;
      border-color: $box-border-color;
      color: $accent-brand-color;
    }
  }
}
.form-control-help-content {
  background-color: $accent-brand-color;

  .arrow-up {
    border-bottom-color: $accent-brand-color;
  }
  a {
    color: $background-color;
  }
}

{# /* // Buttons */ #}

input[type=submit], 
button[type=submit], 
.btn-checkout {
  padding: 10px 15px;
  font-size: 16px;
  text-transform: uppercase;
  font-weight: 600;
  letter-spacing: 2px;
  color: $background-color;
  background-color: $accent-brand-color;
  border-radius: 50px;
  @include prefix(transition, all 0.25s ease-in, webkit ms moz o);
}

input[type=submit]:hover, 
input[type=submit]:focus, 
input[type=submit]:active, 
input[type=submit]:active:hover, 
button[type=submit]:hover, 
button[type=submit]:focus, 
button[type=submit]:active, 
button[type=submit]:active:hover, 
.btn-checkout:hover,
.btn-checkout:focus,
.btn-checkout:active,
.ticket-container .ticket-txt a:hover, 
.ladda-button:active, 
.ladda-button[disabled], 
.ladda-button[disabled]:hover {
  opacity: .8;
  color: $background-color;
  background-color: $accent-brand-color;
}

.login-btn a,
.login-btn a:hover,
.btn-link,
.btn-link:hover {
  color: $accent-brand-color;
}

.login-btn {
  color: $foreground-color;
}

a.btn-primary {
  color: $background-color;
  background: $accent-brand-color;
  &:hover, &:focus {
    color: $accent-brand-color;
    background: $background-color;
  }
  &:active, &:active:hover {
    background: darken($background-color, 6%);
  }
}

#breadcrumb{
  list-style:none;
  display: inline-block;
  padding: 0;
  margin: 0 0 10px 0;
  
  li{
    float:left;
    a{
      color:lighten($foreground-color, 100%);
      display:block;
      background: $accent-brand-color;
      text-decoration: none;
      position:relative;
      height: 30px;
      line-height:30px;
      padding: 0 10px 0 5px;
      text-align: center;
      margin-right: 23px;
    }
    &:first-child{
      a{
        padding-left:15px;
        &:before{
          border:none;
         }
      }
      a.inactive:before{
        border-width: 0;
      }
      a.inactive:after{
        border-left-color: rgba($accent-brand-color, 0.3);
      }
    }

    &:last-child{
      a{
        padding-right:15px;
        &:after{
          border:none;
        }
      }
    }
    
    a{   
      &:before,
      &:after{
        content: "";
        position:absolute;
        top: 0;
        border:0 solid $accent-brand-color;
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:after{
        left:100%;
        border-color:transparent;
        border-left-color:$accent-brand-color;
      }
      &:hover{
        opacity: 0.8;
        
        &:before{
          border-left-color:transparent;
         }
      }
      &:active{
        background-color: $accent-brand-color;
        
        &:before{
          border-color:$accent-brand-color;
          border-left-color:transparent;
         }
        &:after{
          border-left-color:$accent-brand-color;
        }
      }
    }
    a.previous {
        opacity: 0.6;
      &:hover{
        opacity: 1;
      }
    }
    a.inactive {
      background: rgba($accent-brand-color, 0.3);
      cursor: default;
      color: darken($accent-brand-color, 40%);
      &:before {
        content: "";
        position:absolute;
        top: 0;
        border:0 solid rgba($accent-brand-color, 0.3);
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:hover{
        opacity: 1;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:active{
        background-color: rgba($accent-brand-color, 0.3);
        
        &:before{
          border-color:rgba($accent-brand-color, 0.3);
          border-left-color:transparent;
         }
      }
    }
  }
}

div.help {
  background-color: $background-color;
  color: $foreground-color;
  a {
    color: $foreground-color;
  }
  &-warning {
    background-color: #DB3E3E;
    color: #fff;
  }
}

.form-divider {
  .form-divider-title {
    color: rgba($accent-brand-color, 0.3);
    background-color: $background-color;
  }
  hr {
    border-top-color: rgba($accent-brand-color, 0.3);
  }
}

.custom-checkbox > .box > .tick {
  border-bottom-color: $accent-brand-color;
  border-left-color: $accent-brand-color;
}
.customOption input:checked + label {
  border-color: $accent-brand-color;
}
.customOption input:checked + label span.custom-radio {
  background: $accent-brand-color;
}
.customOption.pickup label {
  border-color: rgba($accent-brand-color, 0.3);
}
.customOption input:checked + label .description .name {
  color: $accent-brand-color;
}

.thankyou .success-msg a {
  color: $accent-brand-color;
}
.thankyou .success-msg .title h1, .thankyou .success-msg h3, .thankyou .form-box .create-account span.label-email {
  font-family: $heading-font;
}

h5 {
  color: $foreground-color;
}
.form-control, select {
  border-color: rgba($accent-brand-color, 0.3);
  border-radius: $form-control-radius;
}
.table::-webkit-scrollbar-thumb {
  background-color: $accent-brand-color;
}
.table-striped > tbody > tr:first-child {
  border-top: none;
}
.table-striped > tbody > tr:nth-of-type(odd) {
  border-top: 1px dotted rgba($accent-brand-color, 0.03);
  background: rgba($foreground-color, 0.02);
}
.table-striped > tbody > tr:nth-of-type(even) {
  border-top: 1px dotted rgba($accent-brand-color, 0.1);
  background: rgba($foreground-color, 0.01);
}
.header .header-container {
  padding-left: 0;
  padding-right: 8px;
}
.header .header-container .store-name {
  text-align: left;
  &.store-link {
    color: $background-color;
    text-shadow: none;
  }
}
.header .header-container .store-name img {
  padding-top: 5px;
}
.summary-container .summary {
  background-color: $box-background;
  .show-cart-button {
    background: $box-background;
  }
}
.summary-container .summary #total-box .table {
  border-radius: $box-radius $box-radius 0 0;
}
.summary-container .summary .table td {
  color: $foreground-color;
}
.summary-container .summary #total-box .table.total-table {
  border-radius: 0 0 $box-radius $box-radius;
}
.summary-container .summary #total-box .table.total-table tr td {
  color: $accent-brand-color;
}
.summary-container .summary .slidingDiv {
  background-color: lighten($background-color, 10%);
  border-radius: $box-radius;
  border: 1px solid darken($background-color, 10%);
  @media (max-width: 768px) {
      border: none;
  }
  .arrow-down {
    border-top: 10px solid $box-border-color;
  }
}
.summary-container .summary #total-box .table td img {
  border-radius: 0;
} 
.summary-container .summary #total-box .table tbody.total {
  border-color: $accent-brand-color;
}
.summary-container .summary #total-box .table .success {
  border-color: $accent-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr { 
  background: $background-color;
}
.summary-container .summary .show-cart-button .fa-circle, .summary-container .summary .show-cart-button .show-details {
  color: $accent-brand-color;
}
.summary-container .summary .show-cart-button span.total-cart {
  margin-top: 2px;
  background-color: $accent-brand-color;
}
.summary-container .summary #coupon-form .coupon-field button {
  background: $accent-brand-color;
  border: 1px solid $accent-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr.discount {
  background-color: rgba($accent-brand-color, 0.1);
  color: $accent-brand-color;
}
.summary-container .summary #total-box .table .success td {
  color: $foreground-color;
  background-color: $accent-brand-color;
}
.summary-container .summary #total-box .table.total-table tr.success td {
  color: lighten($background-color, 10%);
  font-weight: bold;
}

.bg-danger, .bg-success, label.same-address, .form-box textarea, div.customOption label, .customOption input:checked + label {
  border-radius: $box-radius;
}
.text-muted {
  color: rgba($foreground-color, 0.6);
}
.text-primary {
  color: $accent-brand-color;
}
.seals {
  border-color: rgba($accent-brand-color, 0.3);
}
.ticket-container .ticket-txt a, .custom-container .ticket-txt a {
  font-family: $heading-font;
  text-transform: uppercase;
  border-radius: $box-radius;
  background-color: $accent-brand-color;
}

.ac-container {
  border-color: rgba($accent-brand-color, 0.1);
}
.ac-container label.accordion {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom-color: rgba($accent-brand-color, 0.1);
  background: rgba($background-color, 0.3);
}
.ac-container label.accordion:hover {
  background: rgba($background-color, 0.02);
}
.ac-container input.accordion:checked + label span {
  background: $accent-brand-color;
}
.ac-container, .summary-container .summary .show-cart-button span.total-cart {
  font-family: $heading-font;
  border-radius: 6px;
}
.ac-container article {
  box-shadow: 0px 3px 0px 0px $accent-brand-color inset;
  background-color: rgba($background-color, 0.8);
}
.ac-container div:first-child label.accordion {
  border-radius: $box-radius $box-radius 0 0;
}
.ac-container div:last-child label.accordion {
  border-radius: 0 0 $box-radius $box-radius;
}
.ac-container input.accordion:checked + label.accordion, 
.ac-container input.accordion:checked + label.accordion:hover
 {
  background-color: $accent-brand-color;
  text-shadow: none;
  color: lighten($background-color, 10%);
}
.ac-container input.accordion:checked ~ article {
  background: rgba($foreground-color, 0.02);
  box-shadow: none;
}
.ac-container div:last-child input.accordion:checked + label.accordion {
    border-radius: 0;
    border-bottom: 1px solid rgba($accent-brand-color, 0.1);
}
.ac-container label.accordion p {
  margin: 6px 0 5px 0;
}
.ac-container label.accordion p.tag-discount {
  color: lighten($background-color, 10%);
  background-color: $accent-brand-color;
  border-radius: 0;
}
.ac-container input.accordion:checked + label.accordion p.tag-discount {
  color: $accent-brand-color;
  background-color: lighten($background-color, 10%);
}
div.customOption p.name { 
  font-weight: 400; 
}

.thankyou .form-box {
  overflow: hidden;
}
.thankyou .form-box .create-account {
  padding: 10px 20px 20px 20px;
  color: lighten($background-color, 70%);
  background: rgba($foreground-color, 0.05);
  border-radius: 0;
  border: none;
}
.thankyou .form-box p {
  padding: 25px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid $background-color;
}
.thankyou .form-box .create-account p {
  padding: 0;
  margin: 0;
  color: $foreground-color;
  border-bottom: none;
  font-weight: 100;
}
.create-account .label-email {
  font-weight: 400;
  color: $foreground-color;
  letter-spacing: 1px;
}
.thankyou .form-box .ticket-container {
  margin: 0 0 10px 0;
}
ul.list-unstyled {
  width: 145px;
  float: right;
}
.safe-box {
  overflow: hidden;
}
.safe-box img {
  max-width: 36px;
}
.safe-box p {
  width: 105px;
  text-align: left;
  float: right;
  padding: 2px 10px 0 4px;
  margin: 0;
  font-family: "Open sans", sans-serif;
  font-size: 11px;
}
.coupon-show-link {
  color: $accent-brand-color;
}
.submit-coupon-btn i.fa-stack-2x {
  color: $accent-brand-color;
}
.submit-coupon-btn:active i.fa-stack-2x {
  color: darken($accent-brand-color, 10%);
}
.coupon-success {
  background: $accent-brand-color;
  font-size: 14px;
}
.coupon-success .arrow-up {
  border-bottom-color: $accent-brand-color;
}

@media (min-width: 768px) {
  .thankyou .form-box .ticket-txt p {
    text-align: left;
  }
}
@media (min-width: 992px) {
  .thankyou .success-msg {
      width: 66%;
  }
}

{# order status page #}

.orderstatus {
  background: $background-color;
  color: $foreground-color;
  .custom-container, 
  .ticket-center-container {
    background: $box-background;
    border-radius: $box-radius;
    border: 1px solid $box-border-color;
    box-shadow: $box-shadow;
  }
}
.orderstatus-footer {
  background: darken($background-color, 3%);
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}
.state-wrap {
  border: 1px solid $box-border-color;
  border-radius: $box-radius;
  background: $box-background;
  box-shadow: $box-shadow;
  h2 {
    font-family: $foreground-color;
    text-shadow: 0 2px 1px $background-color;
  }
}
.state-address {
  border-color: darken($background-color, 3%);
}
.state {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.state-header {
  border-color: darken($background-color, 3%);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.tracking-item {
  &-title {
    color: $foreground-color;
  }
  &-date {
    color: desaturate($foreground-color, 20%);
  }
  &-done {
    .tracking-item {
      &-title {
        color: $accent-brand-color;
      }
    }
  }
}
.state-icon {
  svg {
    fill: $foreground-color;
  }
}
.tracking-event-content {
  color: $foreground-color;
}
.tracking-event-time {
  color: $foreground-color;
  opacity: .6;
}
.tracking-progress-icon {
  svg {
    fill: darken($background-color, 7%);
    color: darken($background-color, 7%);
  }
  &:after {
    border-color: darken($background-color, 7%);
  }
  &-success {
    svg {
      fill: $accent-brand-color;
    }
    &:after {
      border-color: $accent-brand-color;
    }
  }
}
.bookmark-icon {
  fill: $accent-brand-color;
  color: $accent-brand-color;
}
.summary-container-new {
  .summary {
    .slidingDiv {
      background: $box-background;
      box-shadow: $box-shadow;
      @media (min-width: 768px) {
        border-radius: $box-radius;
      }
    }
  }
}
.support {
  border-color: darken($background-color, 4%);
  @media (max-width: 768px) {
    background: $box-background;
  }
}
.support-left {
  @media (max-width: 768px) {
    border-color: darken($background-color, 4%);
  }
}

.footer-center {
  background: $box-background;
}

.announcement {
  color: darken($accent-brand-color, 10%);

  &-bg {
    background: $accent-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($accent-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $accent-brand-color;
  }
}

{% else %}


{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}

$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: $background-color;
}
a {
  color: $accent-brand-color;
  text-decoration: none;
  &:hover, &:focus {
    color: darken($accent-brand-color, 20%);
    
    svg {
      fill: darken($accent-brand-color, 20%);
    }
  }
  
  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $accent-brand-color;
}

.security-seal {
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  @media (max-width: $sm) {
    color: #000000;

    .d-inline-block:first-child {
      position: absolute;
      top: 1px;
      left: 50%;
      margin-left: -13px;
    }
    p {
      display: inline-block;
      &.text-semi-bold {
        margin-right: 50px !important;
      }
    }
    &-badge {
      margin: 0;
    }
  }
}

{# /* // Headbar */ #}

.headbar {
  background: {% if settings.head_background == 'light' %}$background-color{% elseif settings.head_background == 'dark' %}$foreground-color{% else %}$accent-brand-color{% endif %};
  {% if settings.head_background == 'light' %}
    border-bottom: 1px solid rgba($accent-brand-color, .2);
  {% endif %}
  box-shadow: none;

  .container {
    max-width: 100%;
    width: 100%;

    .row {
      -ms-flex-align: center;
      align-items: center;
      @media (max-width: $sm) {
        .col {
          text-align: center !important;
          flex-basis: auto;
          &.text-left {
            order: 2;
          }
          &.text-right {
            margin: -12px 0 15px 0;
            background: #aac67b;
          }
        }
      }
    }
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 80px;
}

.headbar-logo-text {
  float: none;
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  font-weight: 700;

  @media (max-width: $sm) {
    display: inline-block;
    margin: 8px 0;
  }

  &:hover {
    color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    opacity: .8;
  }

  &:focus {
    color: $background-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  &:hover,
  &:focus {
    color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    opacity: .8;

    .headbar-continue-icon {
      fill: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    }
  }
  &-icon {
    margin-left: 5px;
    fill: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  }
}

{# /* // Form */ #}

.form-control {
  background: $background-color;
  border-color: $box-border-color;
  color: $foreground-color;
  font-family: $body-font;
  border-radius: $box-radius;

  &:focus {
    border-color: $accent-brand-color;
    outline: none;    
  }
}
.form-options-content {
  font-size: 12px;
  line-height: 20px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group input[type="radio"] + .form-options-content {
  .unchecked {
    fill: darken($background-color, 10%);
  }
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $accent-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content {
  .checked {
    fill: $foreground-color;
  }
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content {
  .unchecked {
    width: 13px;
    fill: $foreground-color;
  }
}

{# /* // Input */ #}

.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
}

{# /* // Buttons */ #}

.btn-primary {
  color: $background-color;
  background: $accent-brand-color;
  border-radius: 40px;

  &:hover,
  &:focus,
  &:active {
    color: $background-color;
    background: $accent-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  color: $accent-brand-color;
  text-transform: uppercase;
  font-weight: bold;
  letter-spacing: 1px;
  border-color: $accent-brand-color;
  border-radius: 40px;
  background: $background-color;

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: $background-color;
    color: lighten($accent-brand-color, 15%);
    border-color: lighten($accent-brand-color, 15%);

    .btn-icon-right {
      fill: lighten($accent-brand-color, 15%);
    }
  }
  .btn-icon-right {
    fill: $accent-brand-color;
  }
}
.btn-transparent {
  color: $accent-brand-color;
  font-weight: 700;

  &:hover {
    color: $accent-brand-color;
    
    .btn-icon-right {
      fill: $accent-brand-color;
    }
  }
  
  .btn-icon-right {
    fill: $accent-brand-color;
  }
}

.btn-link {
  color: $accent-brand-color;
  text-decoration: none;

  &:hover {
    color: darken($accent-brand-color, 10%);

    svg {
      fill: darken($accent-brand-color, 10%);
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 12px;
  text-align: left;
}

{# /* // Breadcrumb */ #}

.breadcrumb {

  li {

    .breadcrumb-step {
      margin: 0;
      font-size: 12px;
      color: rgba($foreground-color, .6);
      background: none;
      text-transform: none;

      &.active {
        color: $foreground-color;
        background: none;

        &:before,
        &:after {
          position: relative;
          margin: 0 10px;
          border: 0;
          content: ">";
          opacity: .6;
        }
      }

      &.visited {
        color: rgba($foreground-color, .6);
        background: none;
      }
    }
    &:first-child .breadcrumb-step,
    &:last-child .breadcrumb-step {
      padding: 0;
    }
  }
}

{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  border-color: rgba($foreground-color, .15); 
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);
  
  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary {
  
  .panel {
    @media (max-width: $sm) {
      border: 0;
    }
  }
  .overlay + .summary-container {
    border: 0;
  }
}
.summary-details {
  background: lighten($background-color, 15%);
}
.summary-container {
  background: $background-color;
  border-bottom: 1px solid rgba($foreground-color, .1);
  box-shadow: none;
}
.summary-total {
  font-size: 16px;
  font-weight: 700;
  color: $accent-brand-color;
  background: $background-color;
}
.summary-img-thumb {
  border-radius: 0;
}
.summary-arrow-rounded {
  background: none;
  border: 1px solid $accent-brand-color;
  .summary-arrow-icon {
    fill: $accent-brand-color;
  }
}

.summary-title {
  color: darken($accent-brand-color, 10%);
}

{# /* // Radio */ #}

.radio-group {
  border-radius: $box-radius;

  &.radio-group-accordion {
    border-color: rgba($foreground-color, .15);
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    overflow: hidden;

    .radio {
      border-color: rgba($foreground-color, .15);
      &.active {
        color: $background-color;
        background: $accent-brand-color;
        padding-bottom: 25px;
        margin-bottom: -10px;
        .description {
          color: $background-color;
        }
        & + .radio-content {
          border: 2px solid $accent-brand-color;
          border-top-right-radius: 10px;
          border-top-left-radius: 10px;
        }
        .payment-item-discount {
          color: $background-color;
        }
      }
      .label {
        font-weight: 700;
      }
      .description {
        width: calc(100% - 35px);
        margin-left: 35px;
        font-weight: 400;
      }
      &-content:last-child {
        border-radius: 0 0 $box-radius $box-radius;
      }
    }
  }
}
.radio {

  input {

    &:checked + .selector:before {
      background: $background-color;
      border-color: $background-color;
    }
    &:checked + .selector:after {
      position: absolute;
      top: 4px;
      left: 4px;
      width: 12px;
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.primary_color |trim('#') }}"><path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"/></svg>');
    }
    &:disabled:checked + .selector:before {
      background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
    }
  }
  .selector {
    position: relative;

    &:before {
      width: 20px;
      height: 20px;
      margin: 1px 15px 0 0;
      border-color: rgba($foreground-color, 0.5);
    }
  }
}
.radio-content {
  background: $background-color;
  border: 0;
  box-shadow: none;
}

.shipping-option {
  position: relative;
  margin-bottom: -1px;
  padding-left: 55px;
  background: $background-color;
  border-radius: 0;
  border-color: rgba($foreground-color, .15);

  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:only-child {
    border-radius: $box-radius;
  }
  &.active {
    margin-bottom: 0;
    border: 2px solid $accent-brand-color;
    border-left-width: 0;

    .selector {
      background: $accent-brand-color;
    }
  }

  .selector {
    position: absolute;
    top: 0;
    left: 0;
    width: 45px;
    height: 100%;
    margin: 0;
    text-align: center;
    &:before {
      margin: 15px 0 0 0;
    }
  }

  input:checked + .selector:after {
    top: 17px;
    left: 16px;
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: $box-shadow;
  border: 0;
  &.panel-with-header {
    padding-top: 0;
    p {
      margin-top: 0;
    }
  }
  &.summary-details {
    border: 1px solid rgba($foreground-color, .1);
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    @media (max-width: $sm) {
      border: 0;
    }
  }
  &.text-center {
    text-align: left !important;
  }
  .panel-subheader:before {
    display: inline-block;
    width: 18px;
    margin: 0 14px 0 1px;
    vertical-align: middle;
    {% if settings.icons_solid %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29 32.49" fill="%23{{ settings.text_color |trim('#') }}"><path d="M26.5,32.49H2.5A2.5,2.5,0,0,1,0,30C0,23.8,6.5,18.76,14.5,18.76S29,23.8,29,30A2.5,2.5,0,0,1,26.5,32.49Zm-20.67-5H23.17c-1.5-2.17-4.87-3.73-8.67-3.73S7.33,25.32,5.83,27.49ZM14.5,5a4,4,0,1,1-4,4,4,4,0,0,1,4-4m0-5a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z"/></svg>');
    {% else %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" fill="%23{{ settings.text_color |trim('#') }}"><path d="M15,17.41A8.33,8.33,0,1,0,6.68,9.08,8.33,8.33,0,0,0,15,17.41Zm0-14A5.55,5.55,0,1,1,9.45,9,5.56,5.56,0,0,1,15,3.44Zm0,14.62C7.1,18.06.66,22.5.66,28a1.36,1.36,0,0,0,1.39,1.39A1.36,1.36,0,0,0,3.44,28c0-3.86,5.29-7.12,11.56-7.12S26.56,24.09,26.56,28a1.39,1.39,0,0,0,2.78,0C29.34,22.5,22.9,18.06,15,18.06Z"/></svg>');
    {% endif %}
  }
  .panel-submodule:last-child .panel-subheader:before,
  .shipping-options .panel-subheader:before {
    {% if settings.icons_solid %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"/></svg>');
    {% else %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M192 96c-52.935 0-96 43.065-96 96s43.065 96 96 96 96-43.065 96-96-43.065-96-96-96zm0 160c-35.29 0-64-28.71-64-64s28.71-64 64-64 64 28.71 64 64-28.71 64-64 64zm0-256C85.961 0 0 85.961 0 192c0 77.413 26.97 99.031 172.268 309.67 9.534 13.772 29.929 13.774 39.465 0C357.03 291.031 384 269.413 384 192 384 85.961 298.039 0 192 0zm0 473.931C52.705 272.488 32 256.494 32 192c0-42.738 16.643-82.917 46.863-113.137S149.262 32 192 32s82.917 16.643 113.137 46.863S352 149.262 352 192c0 64.49-20.692 80.47-160 281.931z"/></svg>');
    {% endif %}
  }

  .new-shipping-flow {
    .panel-subheader-ship:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M226.8 94.6H0V63.8h242.2c8.5 0 15.4 6.9 15.4 15.4v41.6h70.1c4.7 0 9.1 2.1 12 5.8l57 71.2c2.2 2.7 3.4 6.1 3.4 9.6v85.5c0 8.5-6.9 15.4-15.4 15.4h-30.1c-6.2 16.6-22.3 28.5-41.1 28.5-24.2 0-43.9-19.6-43.9-43.9 0-24.2 19.6-43.9 43.9-43.9 18.8 0 34.9 11.8 41.1 28.5h14.7v-64.7l-49-61.2h-62.7v141.3c0 8.5-6.9 15.4-15.4 15.4h-85.5v-30.8h70.1V94.6zm-70.1 56.9H28.5v-30.8h128.2v30.8zm-28.5 57H0v-30.8h128.2v30.8zm-42.7 71.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1zm-43.9 13.2c0-24.2 19.6-43.9 43.9-43.9s43.9 19.6 43.9 43.9c0 24.2-19.6 43.9-43.9 43.9s-43.9-19.7-43.9-43.9zm271.8-13.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1z"/></svg>');
    }
    .panel-subheader-pickup:before {
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M198.3 0c-82.5 0-150 67.5-150 150 0 60 20 77.5 135 242.5 3.8 5 9.4 7.5 15 7.5s11.3-2.5 15-7.5c115-165 135-182.5 135-242.5 0-82.5-67.5-150-150-150zm0 348.5c-11.3-16.1-21.5-30.6-30.8-43.7C93.9 200.4 85.8 187.7 85.8 150c0-62 50.5-112.5 112.5-112.5S310.8 88 310.8 150c0 37.7-8.1 50.4-81.7 154.8-9.3 13.1-19.5 27.6-30.8 43.7z"/></svg>');
    }
  }

  .shipping-address-container {
    .panel-subheader:before {
      display: none;
    }
  }
}
.panel-header {
  margin: 0;
  font-size: 34px;
  font-weight: bold;
  color: $foreground-color;
  text-align: left;
  border: 0;
  text-shadow: none;
  @media (max-width: $sm) {
    font-size: 22px;
  }
}
.panel-header-tooltip {
  padding: 0 5px;
}
.panel-header-sticky {
  background-color: $background-color;
}
.panel-header-button {
  position: absolute;
  top: 9px;
  right: 0;
  z-index: 2;
  width: auto;
}
.panel-subheader {
  @media (max-width: $sm) {
    font-size: 12px;
  }
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table-footer {
  font-size: 22px;
  font-weight: 700;
  color: $accent-brand-color;
  border: 0;
  .text-semi-bold {
    font-weight: 700;
  }
}

.table-subtotal {
  padding-top: 10px;
  border-color: rgba($foreground-color, .15);
}

.table {
  .table-discount-coupon, .table-discount-promotion {
    color: $accent-brand-color;
    border: 0;
  }
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .radio-group {
    border-radius: $box-radius;
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    overflow: hidden;
  }

  .btn {
    margin: 0;
    background: $background-color;
    border: 1px solid rgba($foreground-color, .1);
    border-radius: 0 0 $box-radius $box-radius;
    border-top: 0;
  }
}

.shipping-options-ship, 
.shipping-options-pickup {
  border-radius: $box-radius;
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  overflow: hidden;
}

.new-shipping-flow {
  .shipping-options {

    .radio-group {
      box-shadow: none;
      overflow: inherit;
    }

    .btn {
      margin-top: -10px;
      padding-top: 20px;
      border: 0;
    }
  }
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: desaturate(lighten($foreground-color, 10%), 80%)
}

.shipping-method-item-price {
  float: right;
  font-size: 16px;
  color: $accent-brand-color;
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 14px;
  color: rgba($foreground-color, .6);
}

{# /* // Discount Coupon */ #}

.box-discount-coupon {

  button {
    @if lightness($foreground-color) < 90% {
      color: lighten($foreground-color, 80%);
    } @else {
      color: $foreground-color;
    }
    background: $accent-brand-color;

    &:hover {
      background: lighten($accent-brand-color, 15%) radial-gradient(circle,transparent 1%, lighten($accent-brand-color, 15%) 1%) center/15000%;
    }
  }
}
.box-discount-coupon-applied {
  color: $accent-brand-color;
  background: none;
  border: 1px solid $accent-brand-color !important;
  border-radius: 40px;

  .coupon-icon {
    fill: $accent-brand-color;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border: 1px solid rgba($foreground-color, .1);
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
}

.orderstatus-footer {
  @media (max-width: $sm) {
    background: $background-color;
  }
}

{# /* // Support */ #}

.support {

  .btn-secondary {
    border-radius: 40px;
    letter-spacing: 0;
  }  
}

{# /* // Destination */ #}

.destination {
  border-color: rgba($foreground-color, 0.1);
}

.destination-icon {
  svg {
    fill: $accent-brand-color;
  }
}

{# /* // User Detail */ #}

.user-detail-icon {
  svg {
    fill: $accent-brand-color;
  }
}

{# /* // History */ #}

.history-item {

  &-done {
    .history-item {
      &-title {
        color: $foreground-color;
      }
    }
  }
  &-failure {
    .history-item {
      &-title {
        color: $base-red;
      }
    }
  }
}
.history-item-progress-icon {

  svg {
    @if lightness($background-color) > 50% {
      fill: darken($background-color, 10%);  
    } @else {
      fill: $background-color;
    }
  }
  &:after {
    @if lightness($background-color) > 50% {
      fill: darken($background-color, 10%);
      border-color: darken($background-color, 10%);
    } @else {
      fill: $background-color;
      border-color: $background-color;
    }
  }
  &-failure {
    svg {
      fill: $base-red;
    }
  }
  &-success {
    svg {
      fill: $accent-brand-color;
    }
    &:after {
      border-color: $accent-brand-color;
    }
  }
}

{# /* // History Canceled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon {
  svg {
    fill: darken($background-color, 45%);
  }
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

.status {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  padding: 25px 0;
  @media (min-width: $md) {
    padding: 40px 0;
  }
}
.status-icon {
  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form {
  input, 
  .input-group-addon {
    border-color: $accent-brand-color;
  }
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.alert-danger-bagged {
  margin-top: -7px;
  padding-top: 10px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-item-discount {
  color: $accent-brand-color;
}

.payment-option {
  border-radius: $box-radius;
  color: $foreground-color;
  background-color: $background-color;
  border-color: rgba($foreground-color, .15);
  box-shadow: 0 1px 3px -1px rgba($foreground-color, 0.05);
}

.radio-content.payment-option-content {
  background: darken($background-color, 2%);
  border: 1px solid rgba($foreground-color, .15);
  border-top: 0;
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}


{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker {

  .unchecked {
    fill: $foreground-color;
  }
  li {
    border-color: $box-border-color;
    background: lighten($background-color, 10%);

    &:hover {
      color: $accent-brand-color;
    }

    &.active {
      background: $background-color;
      color: $accent-brand-color;

      .checked {
        fill: $accent-brand-color;
      }
    }
  }
}
.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $accent-brand-color;
}
.loading-spinner {
  color: $accent-brand-color;
}
.loading-skeleton-radio {
  margin: 0 0 -1px 0;
  border-color: rgba($foreground-color, .15);
  border-radius: 0;
  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:not(:first-child) {
    border-top: 0;
  }
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $accent-brand-color;
  border-left-color: darken($accent-brand-color, 5%);
  
  &:after {
    border-color: $accent-brand-color;
    border-left-color: darken($accent-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $accent-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04); 
  padding: 25px 0;
  @media (min-width: $md) {
    padding: 40px 0;
  }
}
.signup-icon {
  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Modal */ #}

.modal {
  &-dialog {
    background: $background-color;
  }
}

@media (max-width: $xs) {
  .modal-xs {
    background: $background-color;
  }
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .15);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($accent-brand-color, 10%);

  &-bg {
    background: $accent-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($accent-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $accent-brand-color;
  }
}

{# /* // Alert */ #}

.alert-info {
  background-color: rgba($accent-brand-color, .15);
  border-color: rgba($accent-brand-color, .2);
  color: desaturate(darken($accent-brand-color, 10%), 30%);

  .alert-icon {
    fill: desaturate(darken($accent-brand-color, 10%), 20%);
  }
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Tabs */ #}

.tabs-wrapper {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  background: darken($background-color, 5%);
  border-bottom-color: darken($background-color, 10%);
}

.tab-item {
  &.active {
    color: $accent-brand-color;
    font-weight: bold;
  }
}

.tab-indicator {
  background-color: $accent-brand-color;
}

{%  endif %}

{%  endif %}
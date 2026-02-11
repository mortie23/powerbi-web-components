-- Create a schema for your design system components
create schema if not exists design_system
;

-- Create the reference table
create table
  design_system.reference_web_component (
    component_id serial primary key
  , component_name varchar(100) not null
  , component_html text not null
  , last_updated timestamp default current_timestamp
  )
;

-- Example Inserts based on the Gold Design System (AU)
-- Note: These use inline CSS to ensure the 'HTML Content' visual in PBI renders them correctly.
insert into
  design_system.reference_web_component (component_name, component_html)
values
  (
    'Gold Header'
  , '<html>

<style>
    body {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        background: #f5f5f5;
    }

    .au-header {
        background: linear-gradient(to right, #313131, #585858);
        color: #fff;
        padding: 1.5rem 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .au-header__heading {
        max-width: 1200px;
        margin: 0 auto;
        font-size: 2rem;
        font-weight: 700;
        line-height: 1.25;
    }

    .header__badge {
        display: inline-block;
        font-size: 0.875rem;
        border: 1px solid rgba(255, 255, 255, 0.5);
        border-radius: 2rem;
        padding: 2px 10px;
        margin-left: 8px;
        vertical-align: middle;
        text-transform: lowercase;
        letter-spacing: 0.05em;
    }

    @media (max-width: 768px) {
        .au-header__heading {
            font-size: 1.5rem;
        }
    }
</style>

<header class="au-header" role="banner">
    <h1 class="au-header__heading">
        {{TITLE}} <span class="header__badge">beta</span>
    </h1>
</header>


</html>'
  )
, (
    'Gold Card'
  , '<html>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html {
        height: 100%;
        min-height: 100%;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        background: transparent;
        height: 100vh;
        min-height: 100vh;
        width: 100%;
    }

    .card-wrapper {
        width: 100%;
        height: 100vh;
        min-height: 100vh;
        padding: 0.5rem;
        box-sizing: border-box;
    }

    .au-card {
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
        background: #fff;
        border: 1px solid #dcdcdc;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        text-decoration: none;
        color: #313131;
        transition: 0.2s;
        overflow: hidden;
        position: relative;
    }

    .au-card:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        border-color: #b0b0b0;
    }

    .au-card__body {
        background: #f0f0f0;
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 2.5rem;
        font-weight: 700;
        color: #313131;
        padding: 1rem;
    }

    .au-card__content {
        background: #fff;
        padding: 1rem;
        display: flex;
        justify-content: center;
        align-items: center;
        border-top: 1px solid #eee;
        flex-shrink: 0;
    }

    .au-card__title {
        color: #00698f;
        font-weight: 600;
        font-size: 1.125rem;
        margin: 0;
        text-align: center;
    }

    .au-card:hover .au-card__title {
        color: #005575;
    }
</style>

<div class="card-wrapper">
    <div class="au-card">
        <div class="au-card__body"></div>
        <div class="au-card__content">
            <h3 class="au-card__title">{{CARD}}</h3>
        </div>
    </div>
</div>

</html>'
  )
, (
    'Gold Main Nav'
  , '<html>

<style>
    body {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        background: #f5f5f5;
    }

    ul {
        margin: 0;
        padding: 0;
        list-style: none;
        display: flex;
        flex-wrap: wrap;
    }

    .au-main-nav {
        background: #313131;
        border-top: 4px solid #dca900;
    }

    .au-main-nav__container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .au-link {
        display: block;
        padding: 1rem 1.5rem;
        color: #fff;
        text-decoration: none;
        line-height: 1.5;
        transition: 0.2s;
        border-bottom: 4px solid transparent;
    }

    .au-link:hover,
    .au-link:focus {
        background: #1b1b1b;
        border-bottom-color: #666;
        outline: none;
    }

    .au-link:focus {
        box-shadow: inset 0 0 0 3px #9263de;
    }

    .au-link.is-active {
        font-weight: 700;
        border-bottom-color: #dca900;
        background: #1b1b1b;
    }

    @media (max-width: 768px) {
        ul {
            flex-direction: column;
        }

        .au-link {
            border-bottom: 1px solid #444;
        }

        .au-link.is-active {
            border-bottom: 1px solid #444;
            border-left: 4px solid #dca900;
        }
    }
</style>

<nav class="au-main-nav" aria-label="main">
    <div class="au-main-nav__container">
        <ul>
            <li><a href="#" class="au-link [[is_active_link_1]]">{{LINK_1}}</a></li>
            <li><a href="#" class="au-link [[is_active_quarterbacks]]">Quarterbacks</a></li>
            <li><a href="#" class="au-link [[is_active_link_3]]">{{LINK_3}}</a></li>
        </ul>
    </div>
</nav>

</html>'
  )
;
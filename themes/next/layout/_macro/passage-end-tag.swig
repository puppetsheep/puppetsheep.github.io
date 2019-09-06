<div>
    {% if page.passage_end %}
    <style>
    .passage_end::after{
        content: "- The End -";
        text-align:center;
        color: #252525;
        display: block;
        font-size:26px;
        font-weight:bold;
        font-family: Vladimir Script;
    }
    </style>
        <div class="passage_end"></div>
    {% endif %}
</div>
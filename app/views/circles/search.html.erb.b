<div class="filter">
  <%= form_for_filterrific @filterrific do |f| %>
    <div class="filter-row"> 
      <div class="name-search">
        Name search
        <%# give the search field the 'filterrific-periodically-observed' class for live updates %>
        <%= f.text_field(
          :name_query,
          class: 'filterrific-periodically-observed form-control'
        ) %>
      </div>
      <div class="size-search">
        Group size
        <%= f.number_field(
          :circle_size,
          class: 'filterrific-periodically-observed form-control',
        ) %>
      </div>
      <div class="size-search">
        Subject search
      <%= f.select :subject_query,
        @filterrific.select_options[:subject_query], { include_blank: 'Any'},
        class: "filterrific-periodically-observed form-control"%>
      </div>
      <br>
      <div class="reset-filter">
        <%= link_to(
          'Reset filters',
          reset_filterrific_url,
        ) %>
      </div>
    </div>
    <%# add an automated spinner to your form when the list is refreshed %>
  <% end %>
</div>

<div id="filterrific_results">
  <%= render(partial: 'circles/search_circles_list', locals: { circles: @circles }) %>
</div>

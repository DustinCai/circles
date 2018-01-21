<h1><%= @circle.name %></h1>
<br \>

<h2>Events</h2>
<br \>
<% @events.each do |event| %>
  <h3><%= Event.get_event_type event.event_type %>: <%= event.title %></h3>
  <p><%= event.time.to_date %></p>
  <p><%= event.description %></p>
  <br \>
<% end %>

<h3>Add Event</h3>
<%= form_for [@circle, @new_event] do |f| %>
  <p><%= f.label :title %>
  <%= f.text_field :title, class: "form-control" %></p>

  <p><%= f.label :description %>
  <%= f.text_field :description, class: "form-control" %></p>

  <p>Date
  <%= f.date_select :time %></p>

  <p><%= f.label :event_type %>
  <%= f.select :event_type, options_for_select(Event.options_for_type), {}, class: "form-control" %></p>

  <p><%= f.submit  %></p>

<% end %>

<br \>

<h4><%= link_to "Back to Dashboard", root_path %></h4>

<h4><%= link_to "Leave Circle", leave_circle_user_path(@circle),  method: :post %>

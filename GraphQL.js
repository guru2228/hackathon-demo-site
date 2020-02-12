import React from 'react';
import { Panel } from 'react-bootstrap';

const QUERY_GET_DROPDOWN_VALUES = `
query getDropdownValues {
    food_preferences {
        food_pref_id
        food_preferences
      }
      ideas {
        idea
        idea_id
      }
      locations {
        location
        location_id
      }
      t_shirt_sizes {
        t_shirt_size_id
        size
      }
}`;

const MUTATION_USER_REGISTRATION = `
mutation registerUser(
    $firstname: text!, 
    $lastname: text!, 
    $idea_id: int!, 
    $location_id: int!,
    $t_shirt_size_id: int!, 
    $user_email_id: text!, 
    $team_name: text!, 
    $product_desc: text 
    $food_pref_id: int!
    ) {
    insert_users(objects: [
        {
        firstname: $firstname, 
        lastname: $lastname, 
        idea_id: $idea_id, 
        location_id: $location_id,
        t_shirt_size_id: $t_shirt_size_id, 
        user_email_id: $user_email_id, 
        team_name: $team_name, 
        product_desc: $product_desc, 
        food_pref_id: $food_pref_id
    }]) 
    {
    returning {
        user_email_id
    }
    }
}`;

const USER_COUNTS_BY_TYPES = `
subscription user_counts_by_types {
    user_counts_by_types {
      food_preferences
      idea
      location
      size
      users
    }
  }`;



const GraphQL = () => (
  <div className="container">
    <div className="col-md-12">
    <Panel>
      <Panel.Heading>
        <Panel.Title componentClass="h3">GraphQL Queries/Mutations/Subscriptions in this page</Panel.Title>
      </Panel.Heading>
      <Panel.Body>
        <div className="row">
          <div className="col-md-4">
            Get the drop down options:
            <pre>{QUERY_GET_DROPDOWN_VALUES}</pre>
          </div>
          <div className="col-md-4">
            Register User:
            <pre>{MUTATION_USER_REGISTRATION}</pre>
          </div>
          <div className="col-md-4">
            Get real-time number of users by location, idea, etc.,:
            <pre>{USER_COUNTS_BY_TYPES}</pre>
          </div>
        </div>
      </Panel.Body>
    </Panel>
  </div>
  </div>
)

export {
  GraphQL,
  QUERY_GET_DROPDOWN_VALUES,
  MUTATION_USER_REGISTRATION,
  USER_COUNTS_BY_TYPES,
};
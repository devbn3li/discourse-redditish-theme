import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";

export default class SidebarSearch extends Component {
  @service router;

  @action
  submitSearch(event) {
    if (event.key === "Enter") {
      event.preventDefault();
      const query = event.target.value;
      if (query) {
        this.router.transitionTo("full-page-search", { queryParams: { q: query } });
      }
    }
  }

  <template>
    <div class="sidebar-search-wrapper">
      <input 
        type="text" 
        placeholder="Search..." 
        class="sidebar-search-input"
        {{on "keydown" this.submitSearch}}
      />
    </div>
  </template>
}

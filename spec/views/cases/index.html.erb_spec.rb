# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cases/index.html.erb', type: :view do
  xit 'displays all the cases' do
    case1 = FactoryBot.build(:case, title: 'John Doe')
    case2 = FactoryBot.build(:case, title: 'Jimmy Doe', state: State.find_by(ansi_code: 'NY'))
    assign(:cases, Kaminari.paginate_array([case1, case2]).page(1))

    assign(:recently_updated_cases, Case.sorted_by_update(2))
    assign(:state_objects, SortCollectionOrdinally.call(collection: State.all))
    render

    expect(rendered).to match(/John Doe/m)
    expect(rendered).to match(/Jimmy Doe/m)
  end
end

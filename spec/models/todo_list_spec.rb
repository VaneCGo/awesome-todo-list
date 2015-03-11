require 'rails_helper'

RSpec.describe TodoList, type: :model do
  it { should have_many(:todo_items) }

  describe '#has_completed_items?' do
  	let!(:todo_list) { TodoList.create(title: 'Groceries', description: 'Grocery list') }

  	it 'returns true with completed todo list items' do
  		todo_list.todo_items.create(content: 'My item one', completed_at: 1.minute.ago)
  		expect(todo_list.has_completed_items?).to be_truthy
  	end

  	it 'returns false with no completed todo list items' do
  		todo_list.todo_items.create(content: 'My item one')
  		expect(todo_list.has_completed_items?).to be_falsey
  	end
  end

   describe '#has_incompleted_items?' do
  	let!(:todo_list) { TodoList.create(title: 'Groceries', description: 'Grocery list') }

  	it 'returns true with incompleted todo list items' do
  		todo_list.todo_items.create(content: 'My item one')
  		expect(todo_list.has_incompleted_items?).to be_truthy
  	end

  	it 'returns false with no incompleted todo list items' do
  		todo_list.todo_items.create(content: 'My item one', completed_at: 1.minute.ago)
  		expect(todo_list.has_incompleted_items?).to be_falsey
  	end
  end

end

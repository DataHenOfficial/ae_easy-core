require 'test_helper'

describe 'finisher behavior' do
  before do
    # Finisher behavior object
    @object = Object.new
    class << @object
      include DhEasy::Core::Plugin::FinisherBehavior
    end

    # Finisher context
    exposed_methods = Datahen::Scraper::RubyFinisherExecutor.exposed_methods
    exposed_methods = ([] + exposed_methods) << :job_id
    @context, @message_queue = DhEasy::Core::Mock.context_vars exposed_methods
  end

  describe 'integration test' do
    it 'should mock context' do
      default_methods = DhEasy::Core.instance_methods_from @object

      @object.mock_context @context
      mixed_methods = DhEasy::Core.instance_methods_from @object

      mock_methods = mixed_methods - default_methods
      expected_methods = DhEasy::Core.instance_methods_from @context
      assert_equal mock_methods.sort, expected_methods.sort
    end
  end

  describe 'unit test' do
  end
end

shared_context "requests" do
  let(:response_json) { JSON.parse response.body }
end

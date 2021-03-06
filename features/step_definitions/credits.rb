Given(/^I have a bank account with a credit$/) do
  step 'I have sufficient funds in my marketplace'
  step 'I have tokenized a bank account'
  @client.post("/bank_accounts/#{@bank_account_id}/credits", {
                 amount: 2000
               })
  @credit_id = @client['credits']['id']
  @client.add_hydrate :credit_id, @credit_id
end


Given(/^I have more than two credits$/) do
  2.times { step 'I have a bank account with a credit' }
end

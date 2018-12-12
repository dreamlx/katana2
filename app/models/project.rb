class Project < ApplicationRecord
	has_many :charge_hours

	before_save :update_estimated_fee

	def update_estimated_fee
		self.estimated_fee = (self.contract_amount.to_i + self.opportunity_amount.to_i) * (100 - self.risk_rate) / 100
	end
end

# Scenarios for proceed
# A {B} --> B
class S4_B
	def m_refinement
		[:original_B_B]
	end
end

class S4_A
	def call_B
		S4_B.new.m_refinement
	end

	partial

	class ::S4_B
		def m_refinement
			[:refinement_B_A] + proceed
		end
	end
end

# C {B,A} --> A {B} --> B
class S4_C
	def call_A_B_chain
		S4_A.new.call_B
	end

	partial

	class ::S4_B
		def m_refinement
			[:refinement_B_C] + proceed
		end
	end

	# Ensure that C remains active
	class ::S4_A
		pass
	end
end

# Simple super proceed
class S4_D
	def m_original
		[:original_D_D]
	end
end

class S4_E < S4_D
	def m_original
		[:original_E_E] + proceed
	end
end

# Mixed inheritance/layer proceed with single layer
class S4_E1
	def m_refinement
		[:original_E1_E1]
	end
end

class S4_E2 < S4_E1
	def m_refinement
		[:original_E2_E2] + proceed
	end
end

class S4_F
	def call_E2
		S4_E2.new.m_refinement
	end
	
	partial

	class ::S4_E1
		def m_refinement
			[:refinement_E1_F] + proceed
		end
	end

	class ::S4_E2
		def m_refinement
			[:refinement_E2_F] + proceed
		end
	end
end

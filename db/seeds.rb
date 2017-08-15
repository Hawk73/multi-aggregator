include FactoryGirl::Syntax::Methods

user = create(:user, email: 'test@test.com', password: 'password')

create_list(:provider, 2, user: user)

create_list(:request, 2, user: user)

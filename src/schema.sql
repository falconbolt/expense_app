CREATE TABLE expense (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES "user"(id),
    history_id UUID UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    title TEXT,
    total_money INT4,
    category TEXT  -- Add the category field
);


-- Create the 'history' table
CREATE TABLE history (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES "user"(id),
    expense_id UUID REFERENCES expense(history_id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    source TEXT,
    type TEXT DEFAULT 'income',
    amount INT4
);
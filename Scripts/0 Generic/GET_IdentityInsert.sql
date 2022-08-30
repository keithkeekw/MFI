SET IDENTITY_INSERT sometableWithIdentity ON

INSERT INTO sometableWithIdentity 
    (IdentityColumn, col2, col3)
VALUES 
    (AnIdentityValue, col2value, col3value)

SET IDENTITY_INSERT sometableWithIdentity OFF
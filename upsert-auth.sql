CREATE OR ALTER PROCEDURE TutorialAppSchema.Auth_Upsert

    @Email  NVARCHAR(50),
    @PasswordHash  VARBINARY(MAX),
    @PasswordSalt  VARBINARY(MAX)

AS
BEGIN

    IF NOT EXISTS (SELECT *
    FROM TutorialAppSchema.Auth
    WHERE Email = @Email)
   BEGIN
        INSERT INTO TutorialAppSchema.Auth
            (
            Email,PasswordHash,PasswordSalt
            )
        VALUES
            (
                @Email, @PasswordHash, @PasswordSalt
   )
    END
ELSE
    BEGIN
        UPDATE  TutorialAppSchema.Auth SET
        PasswordHash =  @PasswordHash,
        PasswordSalt = @PasswordSalt
        WHERE Email = @Email
    END


END
GO

CREATE OR ALTER PROCEDURE TutorialAppSchema.spLogin_Confirmation
    @Email NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM TutorialAppSchema.Auth
    WHERE Email = @Email
END

        
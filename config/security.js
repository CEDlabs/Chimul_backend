// Centralized secret access for JWT signing/verification.
// Fails fast at startup if the secret is missing or too weak, so the app
// never signs tokens with a known/weak default secret.
const MIN_SECRET_LENGTH = 32;

const getJwtSecret = () => {
    const secret = process.env.JWT_SECRET;
    if (!secret || String(secret).trim().length < MIN_SECRET_LENGTH) {
        throw new Error(
            `JWT_SECRET must be set and at least ${MIN_SECRET_LENGTH} characters long. ` +
            "Generate a strong random value, e.g. crypto.randomBytes(48).toString('hex'), " +
            "and store it in the backend .env file (never commit real secrets)."
        );
    }
    return secret;
};

module.exports = { getJwtSecret, MIN_SECRET_LENGTH };

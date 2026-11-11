// TP13 partie 2 : fonction Lambda minimale (runtime Node.js).
export const handler = async (event) => {
  const name = event?.name ?? "inconnu";
  return {
    statusCode: 200,
    body: JSON.stringify({ message: `Bonjour ${name}, depuis une Lambda locale Floci` }),
  };
};

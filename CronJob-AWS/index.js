//index.js
exports.handler = async () => {
  const timestamp = new Date().toISOString();

  const message = "Cron Job Executed at -- " + timestamp;

  console.log(message);
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: message,
    }),
  };
};

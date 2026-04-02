// Purus stdlib: datetime — date/time utility functions
//
// test: node -e "const d = require('./stdlib/datetime'); console.log(d.mod.now())"

exports.mod = {
  // --- current time ---
  now() {
    return Date.now();
  },
  today() {
    const d = new Date();
    return new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
  },
  timestamp() {
    return Math.floor(Date.now() / 1000);
  },

  // --- create ---
  create(year, month, day, hour, minute, second, ms) {
    return new Date(
      year,
      (month || 1) - 1,
      day || 1,
      hour || 0,
      minute || 0,
      second || 0,
      ms || 0,
    ).getTime();
  },
  fromiso(str) {
    return new Date(str).getTime();
  },

  // --- extract components ---
  year(t) {
    return new Date(t).getFullYear();
  },
  month(t) {
    return new Date(t).getMonth() + 1;
  },
  day(t) {
    return new Date(t).getDate();
  },
  weekday(t) {
    return new Date(t).getDay();
  },
  hour(t) {
    return new Date(t).getHours();
  },
  minute(t) {
    return new Date(t).getMinutes();
  },
  second(t) {
    return new Date(t).getSeconds();
  },
  ms(t) {
    return new Date(t).getMilliseconds();
  },

  // --- format ---
  toiso(t) {
    return new Date(t).toISOString();
  },
  tolocale(t, locale, options) {
    return new Date(t).toLocaleString(locale, options);
  },
  todate(t) {
    return new Date(t).toLocaleDateString();
  },
  totime(t) {
    return new Date(t).toLocaleTimeString();
  },

  // --- arithmetic ---
  addms(t, n) {
    return t + n;
  },
  addseconds(t, n) {
    return t + n * 1000;
  },
  addminutes(t, n) {
    return t + n * 60000;
  },
  addhours(t, n) {
    return t + n * 3600000;
  },
  adddays(t, n) {
    return t + n * 86400000;
  },

  // --- comparison ---
  diff(a, b) {
    return a - b;
  },
  diffdays(a, b) {
    return (a - b) / 86400000;
  },
  diffhours(a, b) {
    return (a - b) / 3600000;
  },
  diffminutes(a, b) {
    return (a - b) / 60000;
  },
  diffseconds(a, b) {
    return (a - b) / 1000;
  },
};

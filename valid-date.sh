#!/bin/bash

if [ "$#" -ne 3 ];
then
  echo "입력값 오류"
  exit 1
fi

MONTH=$1
DATE=$w
YEAR=$3

MONTH=$( echo "$MONTH" | awk '{print toupper(substr($0,1,1) tolower(substr($0,2))}')

case "$MONTH" 
in
  "1" | "JAN" | "JANUARY")
  MONTH="Jan" ;;
  "2" | "FEB" | "FEBRUARY")
  MONTH="Feb" ;;
  "3" | "MAR" | "MARCH")
  MONTH="Mar" ;;
  "4" | "APR" | "APRIL")
  MONTH="Apr" ;;
  "5" | "MAY")
  MONTH="May" ;;
  "6" | "JUN" | "JUNE")
  MONTH="Jun" ;;
  "7" | "JUL" | "JULY")
  MONTH="Jul" ;;
  "8" | "AUG" | "AUGUST")
  MONTH="Aug" ;;
  "9" | "SEP" | "SEPTEMBER")
  MONTH="Sep" ;;
  "10" | "OCT" | "OCTOBER")
  MONTH="Oct" ;;
  "11" | "NOV" | "NOVEMBER")
  MONTH="Nov" ;;
  "12" | "DEC" | "DECEMBER")
  MONTH="Dec" ;;
*)
  echo "잘못된 월 입력: $MONTH"
  exit 1 ;;
esac

is_leap_year() {
local year=$1
  if (( year % 4 != 0 )); then
  echo 0
  elif(( year % 400 == 0 )); then
  echo 1
  elif(( year % 100 == 0 )); then
  echo 0
  else
  echo 1
fi
}

LEAP_YEAR=$(is_leap_year $YEAR)

case "$MONTH"
in
"Jan" | "Mar" | "May" | "Jul" | "Aug" | "Oct" | "Dec")
MAX_DAYS=31 ;;
"Apr" | "Jun" | "Sep" | "Nov")
MAX_DAYS=30 ;;
"Feb")
  if [ "$LEAP_YEAR" -eq 1 ]; then
    MAX_DAYS=29
  else
    MAX_DAYS=28
fi
;;
*)
echo "알 수 없는 오류 발생"
exit 1
;;
esac

if ! [[ "$DATE" =~ ^[0-9]+$ ]] || [ "$DATE" -lt 1 ] || [ "$DATE" -gt "$MAX_DAYS" ]; then
  echo "$MONTH $DATE $YEAR 는 유효하지 않습니다"
  exit 1
fi

echo "$MONTH $DATE $YEAR
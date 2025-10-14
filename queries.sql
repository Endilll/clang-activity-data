--- Number of PRs created, per month
--- PRsCreated.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsCreated
FROM pull_requests
GROUP BY strftime("%Y-%m", created_at)

--- Number of PRs merged, per month
--- PRsMerged.csv
SELECT
    strftime("%Y-%m", merged_at) AS YearMonth,
    count(*) AS PRsMerged
FROM pull_requests
WHERE state == "MERGED"
GROUP BY strftime("%Y-%m", merged_at)

--- Number of PRs closed per month (excluding merged)
--- PRsClosed.csv
SELECT
    strftime("%Y-%m", closed_at) AS YearMonth,
    count(*) AS PRsClosed
FROM pull_requests
WHERE state == "CLOSED"
GROUP BY strftime("%Y-%m", closed_at)

--- Number of PRs opened by members, per month
--- PRsCreatedByMembers.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsCreatedByMembers
FROM pull_requests
WHERE author_association == "MEMBER"
GROUP BY strftime("%Y-%m", created_at)

--- Number of PRs opened by contributors, per month
--- PRsCreatedByContributors.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsCreatedByContributors
FROM pull_requests
WHERE author_association == "CONTRIBUTOR"
GROUP BY strftime("%Y-%m", created_at)

--- Number of PRs opened by first-time contributors, per month
--- PRsCreatedByFirstTimeContributors.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsCreatedByFirstTimeContributors
FROM pull_requests
WHERE author_association == "FIRST_TIME_CONTRIBUTOR"
GROUP BY strftime("%Y-%m", created_at)

--- Number of API comments made on PRs opened in each month
--- APIComments.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    sum(api_total_comments_count) AS APICommentsCount
FROM pull_requests
GROUP BY strftime("%Y-%m", created_at)
ORDER BY pr_month

--- Average number of API comments per PR made on PRs opened in each month
--- APICommentsAverage.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    avg(api_total_comments_count) AS APICommentsAveragePerPR
FROM pull_requests
GROUP BY strftime("%Y-%m", created_at)
ORDER BY pr_month

--- Number of non-cross-repository PRs opened in each month
--- NonCrossRepoPRs.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS NonCrossRepoPRs
FROM pull_requests
WHERE is_cross_repository == 0
GROUP BY strftime("%Y-%m", created_at)
ORDER BY pr_month

--- Number of still open PRs, per month
--- StillOpenPRs.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS StillOpenPRs
FROM pull_requests
WHERE state == "OPEN"
GROUP BY strftime("%Y-%m", created_at)
ORDER BY pr_month

--- Number of still open PRs by members, per month
--- StillOpenPRsByMembers.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS StillOpenPRsByMembers
FROM pull_requests
WHERE state == "OPEN" AND author_association == "MEMBER"
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth

--- Number of still open PRs by contributors, per month
--- StillOpenPRsByContributors.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS StillOpenPRsByContributors
FROM pull_requests
WHERE state == "OPEN" AND author_association == "CONTRIBUTOR"
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth

--- Number of still open PRs by first-time contributors, per month
--- StillOpenPRsByFirstTimeContributors.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS StillOpenPRsByFirstTimeContributors
FROM pull_requests
WHERE state == "OPEN" AND author_association == "FIRST_TIME_CONTRIBUTOR"
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth

--- Number of PRs that were merged or closed within one day, per month
--- PRsClosedInOneDay.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInOneDay
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 1
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within two days, per month
--- PRsClosedInTwoDays.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInTwoDays
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 2
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within three days, per month
--- PRsClosedInThreeDays.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInThreeDays
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 3
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within four days, per month
--- PRsClosedInFourDays.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInFourDays
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 4
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within five days, per month
--- PRsClosedInFiveDays.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInFiveDays
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 5
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within six days, per month
--- PRsClosedInSixDays.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInSixDays
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 6
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within one week, per month
--- PRsClosedInOneWeek.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInOneWeek
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 7
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within two weeks, per month
--- PRsClosedInTwoWeeks.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInTwoWeeks
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 14
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within three weeks, per month
--- PRsClosedInThreeWeeks.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInThreeWeeks
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 21
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs that were merged or closed within four weeks, per month
--- PRsClosedInFourWeeks.csv
SELECT
    strftime("%Y-%m", created_at) AS YearMonth,
    count(*) AS PRsClosedInFourWeeks
FROM pull_requests
WHERE
    (state == "MERGED" OR state == "CLOSED")
    AND (unixepoch(closed_at) - unixepoch(created_at)) / 60 / 60 / 24 <= 28
GROUP BY strftime("%Y-%m", created_at)
ORDER BY YearMonth;

--- Number of PRs opened on Monday, per 4 weeks
--- PRsOpenedOnMonday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS week_group,
    sum(prs_per_week.monday_prs) AS monday_prs
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS monday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "1" -- 1 for monday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY week_group;

--- Number of PRs opened on Tuesday, per 4 weeks
--- PRsOpenedOnTuesday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.tuesday_prs) AS PRsOpenedOnTuesday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS tuesday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "2" -- 2 for tuesday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs opened on Wednesday, per 4 weeks
--- PRsOpenedOnWednesday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.wednesday_prs) AS PRsOpenedOnWednesday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS wednesday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "3" -- 3 for wednesday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs opened on Thursday, per 4 weeks
--- PRsOpenedOnThursday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.thursday_prs) AS PRsOpenedOnThursday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS thursday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "4" -- 4 for thursday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs opened on Friday, per 4 weeks
--- PRsOpenedOnFriday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.friday_prs) AS PRsOpenedOnFriday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS friday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "5" -- 5 for friday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs opened on Saturday, per 4 weeks
--- PRsOpenedOnSaturday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.saturday_prs) AS PRsOpenedOnSaturday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS saturday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "6" -- 6 for saturday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs opened on Sunday, per 4 weeks
--- PRsOpenedOnSunday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.sunday_prs) AS PRsOpenedOnSunday
FROM (
    SELECT
        strftime("%Y", created_at) * 100 + strftime("%W", created_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", created_at) * 100 + strftime("%W", created_at)
        ) AS week,
        count(*) AS sunday_prs
    FROM pull_requests
    WHERE
        strftime("%u", created_at) == "7" -- 7 for sunday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Monday, per 4 weeks
--- PRsClosedOnMonday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.monday_prs) AS PRsClosedOnMonday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS monday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "1" -- 1 for monday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Tuesday, per 4 weeks
--- PRsClosedOnTuesday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.tuesday_prs) AS PRsClosedOnTuesday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS tuesday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "2" -- 2 for tuesday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Wednesday, per 4 weeks
--- PRsClosedOnWednesday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.wednesday_prs) AS PRsClosedOnWednesday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS wednesday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "3" -- 3 for wednesday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Thursday, per 4 weeks
--- PRsClosedOnThursday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.thursday_prs) AS PRsClosedOnThursday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS thursday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "4" -- 4 for thursday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Friday, per 4 weeks
--- PRsClosedOnFriday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.friday_prs) AS PRsClosedOnFriday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS friday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "5" -- 5 for friday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Saturday, per 4 weeks
--- PRsClosedOnSaturday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.saturday_prs) AS PRsClosedOnSaturday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS saturday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "6" -- 6 for saturday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;

--- Number of PRs closed on Sunday, per 4 weeks
--- PRsClosedOnSunday.csv
SELECT
    (prs_per_week.week - 1) / 4 AS FourWeekGroup,
    sum(prs_per_week.sunday_prs) AS PRsClosedOnSunday
FROM (
    SELECT
        strftime("%Y", closed_at) * 100 + strftime("%W", closed_at) AS year_week,
        row_number() OVER (
            ORDER BY strftime("%Y", closed_at) * 100 + strftime("%W", closed_at)
        ) AS week,
        count(*) AS sunday_prs
    FROM pull_requests
    WHERE
        (state == "MERGED" OR state == "CLOSED")
        AND strftime("%u", closed_at) == "7" -- 7 for sunday
    GROUP BY year_week
    ORDER BY year_week
) AS prs_per_week
GROUP BY FourWeekGroup;
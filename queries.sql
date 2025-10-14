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
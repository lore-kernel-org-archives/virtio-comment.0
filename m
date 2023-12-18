Return-Path: <virtio-comment-return-8810-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5032C35274
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8B34F22377
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40B4798667E
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2887E98647D; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49CB19864D3
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Dec 2023 06:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702881800.200000
X-TM-MAIL-UUID: 93c00802-efe2-4537-9332-93b4e7bc2ed8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcFof2/7UopAHLwg2vusfQji73H7KAO6wI5CTqMJemvw5YeF8joAU4B+7EEM+5ZCgTIQzYp3FLGFU84GK9GwrCE1HtQa90Lr8rhfesCmpUNyKIsXNxYpKBYQZQhttmLRF716TClmLnGx64Tm407wHPS+DC2eNYTzzD7dqWGiNWi6iiMYCAQyUcaSsVrxPhExXwjwlkYn9ngyIJzlMQztfTr7tg211A+g5bqM4vdwIbY9GcO6Mmevga6sF3VewyXg7Bh3jMNyjqXMcGxHIw5M4Dj3nmlc9TTICrtV1CFdaOj3DFdSzD06+X+ngxC4a6lO43/Yb9Yf6bzs8Thnwa7gJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xp1lPZmVyj4OOWLlAnqmq+zMSy8w/Xnzdo5We1Hg+48=;
 b=loa5HHT5ADoUeb9ygCw5tuNE6v+5vyctNw/yzMyCFYcNUDI5BxiTgAX07cYxOOj7/qyEQLPgPQGv1g+IS2Rt8AqSVB72G63IwLqjqR1oPV+uNxmdaYYJ/h9I5hGkivvapEBWi9fn4u7agL2uDNLRY3846t1l9XsRAtApXQobogb9V+5hqg6IW3U9wIIvWU3cwg09AJ3JByYL2dHTn/0UZaXkR1WotUDsP0w5IuLzXSvk3qJNKJrS/l0+54LAMaQBY50MTWAieju38CxvzlxcGIef2Gx9uoBWR480QhL1FEpZFUP9tA/sSoNqlZb7eUj7noxNFWEQOg7BJg/JxZ1drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Dec 2023 07:42:52 +0100
Message-Id: <20231218064253.9734-4-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231218064253.9734-1-peter.hilber@opensynergy.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT049:EE_|FR3P281MB3264:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8527f56e-babf-45f3-2ac6-08dbff949e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7R7DuY+rPD6mmsxF6q3/g+OwzqvsMeYffDBMntuBM6eFc7Zqf0wUCPjkehOuskLwSBYfg5RQFwAbSnetQYu+ez1UYp1mJ/UtaUH1xwCDs1fN7rAj2fyYEEaDtMYvw2eeuF1VyUgZr4rhCDNGvFN7qwol48elvJZDMD5JqbIw6mA24qifkmsowRfx5zUvuDeCsb+IdJuY7YVpUogcVjQTTbGS9bgO3FmLjoAvbwfVxoTLKYy4emzQU+Lq83d8n8ofjHP8prVmLUCMVoT0UzJaFwKACv6Vxkyu6RzGdZ71HAdvkKpacQYUvGH1lMie39PFDucUKAQ3swiUpkG/J69G2d+sPAHDQFEZRS0ftwuK4UY1Bz5g8WOyqpsvsyLKl2KqQ3CC4SotyFLaVOE62zU1XIyB4oEZzBZRMS3phUInVW7//2mJNOsbjAjaEp22bPH8afgq0p7X+rTXRJL2A5UT52WVh34T1odCQCPSudQG6L+z+hxSEdRqqkG1iDGToQ9rq1CTbBdUVYCvj4asyvPI3CmtTv87SEyC8Mel1irMf3vRige9DbUO5qKuZf7PtSopTiwMt3imBae4NTciwSWJ49KJIN+E5+FGmMuyoT643jApd7Q30Uvf7Su2YUTNoZcd4t98srRQ5/2Xb14Wx3zPyEuvRZDfZ+aV360nt+DW91St76OfHk2tZHF6K7Z9Sab35fgxYhQoYCNb8pkvvIsnfRdoaMmjRIvcxj35A3AZy8ungPM+GD1zYtYYeL+HKD2SLjgvE1+5U6HCSPyfT34yffF3hrySsiQ5kTpo59268xQ=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39830400003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(83380400001)(47076005)(2616005)(1076003)(336012)(26005)(36860700001)(316002)(4326008)(8676002)(8936002)(44832011)(5660300002)(41300700001)(30864003)(478600001)(2906002)(42186006)(54906003)(70206006)(6916009)(70586007)(36756003)(81166007)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:43:18.2479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8527f56e-babf-45f3-2ac6-08dbff949e8e
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR05FT049.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB3264
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28064.005
X-TMASE-Result: 10--25.158100-4.000000
X-TMASE-MatchedRID: zm5BragSbhXJ+P2VFrJmrBbadjTjVCQ24DiXvcLDKwuIZUCmJEsCuUDN
	lSh+G0vIiCuBf98exq7esJx0oFjO4NqrIn92h9L3eJchdZcr1K3vzXgPRwNu0B7CPn3+tzaEPxR
	iBB02P1cYXZOLopHn4GejsuWuS2nw87Im02sian669rtClqkCjZ7EkV3V/yv7SSsIL6vhyQXvrB
	oTG/N3uTwqkeXL+1n3bCs35VfOf0G9ijDan8SZAlJTtM6CHKVOgdXztqOEBnD7eydJGbfGJTPZS
	GFmOU0lWpS5sR1Imtmbfc6n6VIFW7O1F/ODk5naCqJ0RbJ3bb0V98ttbcv1kZkXvpdx22LBpEiQ
	L/airBj3u+jHvMoIZj6+ASBlvR41N7b5iLtubbPgR8l2Qhmx6ooCNCa/gL3bXdYblmPSOiEsTjl
	I8fu5P4qU16bv8DO+ClKnws/wLs/yCAfUB5UAhOkV69R8Rnn7GDKU2NaTCxhTP6V0A4MJ3p82eC
	ygKkDPxFrvI+GQvsUC6507A/MOyAWzll73eBM35EX3mCzYKG5QKm83vawLhPsFqaKfjkncv21r2
	VgXA9OC+pQP45BUQusQNAL2u95wD5teccobfJV8dniJUBtbDHwuCMDi78rnAuA4ZQEtO3paOxpg
	jiWHdQKmARN5PTKc
X-TMASE-XGENCLOUD: 37fe3381-331a-41c2-8610-9efe92cac0e9-0-0-200-0
X-TM-Deliver-Signature: C463B1E05E2293CF1DB36BF18DE9394C
X-TM-Addin-Auth: rvsLttHqZlIDikWsxMEcGK59iA79Z5p7eRsy6aezRJeqRP4ydd/TRjeP9xp
	qAPTLE3eyOUEIE0JKiy1N9kjLn78vTNzGHQvBo4OppNnh+87oe61dfR5b+bn/LcS9bbSYtX+rPH
	v6RJRQiYWlh51a487lHZRLxZ2JQ1BOCPn13EKa2uo+wv3nJMvra2Xr1YI7CXTctPQb1sfAT1hQH
	5niZZ3P7/4vjdU5OWJx6mc+YgCZSkk08E9T/tWH0wzJHg6Bky+wKy3U0tyqelQji84sNsp9ZuWt
	pGZqwV9nnn1/rXQ=.at7hJ3nRyYBV2o4Jy/eT7Tt2Id3SOTNZSZRNks85i7MFPcy5P46/PHIRSu
	QYTmuuGuEmmziiVmjWa12L3JgFkARlsKCWX6ll5MRXJFChtjn17gF+x24YM6SJ9eaTpVrNrUjrp
	qNU/oNuoqmV9BLzccjSyBoGPUT1JQYtXDkRys7XNlfugmMODHyaoJZwiCdh/h6uJXJ38kRH3R+Q
	UjHiddNrYwYvqSyEpiDlr/UZk5xIeRTHDdtrJDR1montK1OloudVxYJNGgJ6uCdYegf+aLHUM9o
	C9dgAE+LNutJmBH/l6wfXs4FTPaRFZ1ZgDR0jDqedLeRUOolOf7HltUat7w==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

Add the VIRTIO_RTC_F_ALARM feature (without normative statements).

The intended use case is: A driver needs to react when an alarm time has
been reached, but the driver may be in a sleep state or powered off at
alarm time. The alarm feature can resume and notify the driver in this
case. Alarms may be retained across device resets (including reset on
boot).

Peculiarities
-------------

Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
autonomously at any time: An alarm may change back from "expired" to
"not expired" before the driver has started processing an alarm
notification.

To address the above, and the device resets, define "alarm expiration"
in such a way that the driver always has a chance to react to an alarm,
and make the device always responsible for notifying the driver about an
alarm expiration.

The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.

Open Questions
--------------

- A Linux driver could use the virtio-rtc real-time alarm, through the
  Linux RTC device class, for both CLOCK_REALTIME_ALARM and (monotonic)
  CLOCK_BOOTTIME_ALARM alarms. But then, after a clock step, a
  CLOCK_BOOTTIME_ALARM alarm may be late (or early). Perhaps this can be
  handled by the driver also setting a virtio-rtc monotonic alarm, so
  may not need to be addressed by the spec.

- A request returning the minimum and maximum allowed alarm time might
  still be added.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 device-types/rtc/description.tex | 256 ++++++++++++++++++++++++++++++-
 1 file changed, 254 insertions(+), 2 deletions(-)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 7707472f1663..fcd2f14186e6 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
 time. The device can provide different clocks, e.g.\ for the UTC or TAI
 time standards, or for physical time elapsed since some past epoch. The
 driver can read the clocks with simple or more accurate methods.
+Optionally, the driver can set an alarm.
 
 \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
 
@@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
 
 \begin{description}
 \item[0] requestq
+\item[1] alarmq
 \end{description}
 
 The driver enqueues requests to the requestq.
 
+Through the alarmq, the device notifies the driver about alarm
+expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
+negotiated.
+
 \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 
-No device-specific feature bits are defined yet.
+\begin{description}
+\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
+\end{description}
+
+VIRTIO_RTC_F_ALARM determines whether the device supports setting an
+alarm for some of the clocks.
 
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
@@ -244,7 +255,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 struct virtio_rtc_resp_clock_cap {
 	struct virtio_rtc_resp_head head;
 	le16 type;
-	u8 reserved[6];
+	u8 flags;
+	u8 reserved[5];
 };
 \end{lstlisting}
 
@@ -274,6 +286,18 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 Implementation-specific clock type definitions are not recommended and
 use a clock type id greater than or equal to 0xF000.
 
+The \field{flags} field provides the following information:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_FLAG_ALARM_CAP (1 << 0)
+\end{lstlisting}
+
+\begin{itemize}
+\item If VIRTIO_RTC_F_ALARM was negotiated, flag
+	\field{VIRTIO_RTC_FLAG_ALARM_CAP} indicates that the clock
+	supports an alarm.
+\end{itemize}
+
 \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
 cross-timestamping for a particular pair of clock and hardware counter.
 
@@ -533,3 +557,231 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
 this specification, the device MUST use the nanosecond as unit for
 field \field{clock_reading}.
+
+\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
+
+Through the optional alarm feature, the driver can set an alarm time. On
+alarm expiration, the device notifies the driver. On alarm expiration,
+the device may also wake up the driver, while the driver is in a sleep
+state, or while the driver is powered off. How this is done is beyond
+the scope of the specification. The driver can set one alarm time per
+clock, if the clock supports this.
+
+The device may retain alarm times across device resets.\footnote{Drivers
+	may reset the device on boot or on resume from sleep state. It
+	can make sense for the device to retain the alarm time then,
+	similar to other alarm clocks.}
+
+The alarm feature, and the associated alarmq for notifications from the
+device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
+if the driver previously set an alarm time, even if the device no longer
+both
+
+\begin{itemize}
+\item is live and
+\item has negotiated VIRTIO_RTC_F_ALARM,
+\end{itemize}
+
+the device may still execute implementation-specific actions on alarm
+expiration.
+
+An alarm expires
+
+\begin{itemize}
+\item when the associated clock progresses (also: steps) from a time
+	prior to the alarm time to the alarm time, or to a time after
+	the alarm time, or
+
+\item when the driver sets an alarm time which is not in the future, or
+
+\item when the device is reset, if the alarm time is retained and not in
+	the future.\footnote{The device is always responsible for
+	detecting alarm expiration events. This avoids that the driver
+        needs to reason about when it shall poll for alarm expiration.}
+\end{itemize}
+
+When an alarm expires, the driver can disable it. Otherwise, the alarm
+expires each time when one of the above expiration events occurs, even
+if it occurred before.\footnote{This avoids that the driver may
+	miss an alarm when the clock steps backwards after alarm
+	expiration, but before the driver has resumed operation. This
+	also facilitates distinct drivers using the same device,
+	e.g.\ a	driver in the bootloader, and a driver in the OS.}
+
+On alarm expiration, the device executes the alarm actions. The alarm
+actions are:
+
+\begin{itemize}
+\item The device notifies the driver through the alarmq. If the device
+	is not live, or no buffers are available in the alarmq, the
+	device will notify once the device is live and buffers are
+	available.
+
+\item Optionally, the device executes other, implementation-specific,
+	actions. The device may execute those immediately, regardless of
+	the device state.
+\end{itemize}
+
+An alarm expiration becomes obsolete
+
+\begin{itemize}
+\item once the clock jumps backwards, before the alarm time, or
+
+\item once the driver sets an alarm time, or
+
+\item once another alarm expiration event happens.
+\end{itemize}
+
+If an alarm expiration becomes obsolete, it is unspecified which alarm
+actions the device executes for this alarm expiration, and the device
+stops executing these alarm actions after a grace period.
+
+The driver-visible settings of an alarm consist of two elements:
+
+\begin{itemize}
+\item \field{driver_alarm_time}, a valid time for the corresponding
+	clock, and
+
+\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
+	true, \field{driver_alarm_time} is the actual alarm time.
+	While \field{alarm_enabled} is false, the device will act as if
+	the alarm time was in the future, so that the alarm will not
+	expire.
+\end{itemize}
+
+Initially, \field{driver_alarm_time} is an allowed alarm time, and
+\field{alarm_enabled} is false.
+
+\paragraph{Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM is negotiated,
+
+\begin{itemize}
+\item the driver can determine if a clock supports an alarm through the
+	VIRTIO_RTC_FLAG_ALARM_CAP flag in the VIRTIO_RTC_REQ_CLOCK_CAP
+	response,
+
+\item the driver can enqueue the alarm control requests into the
+	requestq: VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+	and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+\end{itemize}
+
+The unit of all \field{alarm_time} fields is 1 nanosecond for all
+clock types which are part of the device specification so
+far.
+
+\begin{description}
+\item[VIRTIO_RTC_REQ_READ_ALARM] reads the current alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_ALARM 0x1003 /* message type */
+
+struct virtio_rtc_req_read_alarm {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read_alarm {
+	struct virtio_rtc_resp_head head;
+	le64 alarm_time;
+#define VIRTIO_RTC_FLAG_ALARM_ENABLED (1 << 0)
+	u8 flags;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock.
+Field \field{alarm_time} returns \field{driver_alarm_time}. In field
+\field{flags}, flag \field{VIRTIO_RTC_FLAG_ALARM_ENABLED} indicates
+whether \field{alarm_enabled} is true.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM] sets the alarm.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM 0x1004 /* message type */
+
+struct virtio_rtc_req_set_alarm {
+	struct virtio_rtc_req_head head;
+	le64 alarm_time;
+	le16 clock_id;
+	/* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+	u8 flags;
+	u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm {
+	struct virtio_rtc_resp_head head;
+	/* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock.
+Field \field{alarm_time} sets \field{driver_alarm_time}. If flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is set in field \field{flags}, the
+device sets \field{alarm_enabled} to true; otherwise, the device sets
+\field{alarm_enabled} to false.
+
+\item[VIRTIO_RTC_REQ_SET_ALARM_ENABLED] sets \field{alarm_enabled}.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_SET_ALARM_ENABLED 0x1005 /* message type */
+
+struct virtio_rtc_req_set_alarm_enabled {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	/* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
+	u8 flags;
+	u8 reserved[5];
+};
+
+struct virtio_rtc_resp_set_alarm_enabled {
+	struct virtio_rtc_resp_head head;
+	/* no response params */
+};
+\end{lstlisting}
+
+\field{clock_id} identifies the alarm through its associated clock. If
+flag \field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is set in field
+\field{flags}, the device sets \field{alarm_enabled} to true; otherwise,
+the device sets \field{alarm_enabled} to false.
+
+When processing this request, the device retains
+\field{driver_alarm_time}.
+\end{description}
+
+\paragraph{Alarm Notifications}
+
+If the alarmq is present, the driver should make buffers available in
+the alarmq, which the device uses for alarm notification messages. All
+alarmq fields are device-writable. The alarmq uses a common notification
+header.
+
+\begin{lstlisting}
+/* common notification header */
+struct virtio_rtc_notif_head {
+	le16 msg_type;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{msg_type} field identifies the message type.
+
+\begin{description}
+\item[VIRTIO_RTC_NOTIF_ALARM] notifies the driver about an alarm
+	expiration.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_NOTIF_ALARM 0x2000 /* message type */
+
+struct virtio_rtc_notif_alarm {
+	struct virtio_rtc_notif_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+\end{description}
+
+\field{clock_id} identifies the expired alarm through its associated
+clock.
-- 
2.40.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


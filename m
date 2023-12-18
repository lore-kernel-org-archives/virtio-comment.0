Return-Path: <virtio-comment-return-8811-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81CDC35274
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D92933E330
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 917E298647D
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68E349867D8; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49CD3986512
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Dec 2023 06:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702881800.211000
X-TM-MAIL-UUID: 357baeb4-c585-431f-ab3e-99507f7d1d5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQ1gZW2CVMyyJkXuCj9mdBSzWWxbVzefsaVloM1KO9yMWsoK7gpVHU3yBpXIEZCBPsg9lSFRpUJwCRvH9Fx3SdjaDTyu6sIj3+XQn7vox9ZbBrjhBtkO0uNDToDR3fv6GQZ/zzcnHPRYn7kHW2Te80g7yuRIDdQIudFA1Dk6HiGDiAAVuz5xVY2R6jCu9dufmX7r7K9G3NLmt0p2OD8DiW9Ol0TmK/Ko5eBo2LPX6zdSFTQjy4MUoU31ne+VvQIP4qtBXWeEZaLAZVg3jHbB4l7jfeHN2egI7SQj40ipzQaqHmKkfz5UXE4t0IMjSWwY+RCvv6qAMAqlaPY67rX+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIDqa7vNZ9evSvKI4NnSEoMGfW0VuyVYuHYyIdiPkU8=;
 b=ZK4dSSFzf5xdSQzpE/xwcFW8+QbqFYA1RJV/5SRZE11mgu9SG8Ie41h9xH+SquQvXsnEWLSTnE5j1A+Wr17In4tFD98x3/9mpIeCSDtenvKjnR4CaaCbv13z3ZQsipnK0hgnMxjilkKeqU52lgnnEHehK+pFKuP0C+SmtOJopcaovYIMqQ0nnq7cKqMlkArfOsh27P2ohY5CmU9eT4CJAvlq/f4Uaf2+EK8/81yq44sVXTHAWJTk95FoXfEjXwOD+uvFtHRPZpHe3aoMS8ldPYWg2fnZx1JIx10GxhIPQ6ubbrEjgNLwsEyj3ZC/VrF7XbKqYfp58/TbARgPIQxCOg==
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
Date: Mon, 18 Dec 2023 07:42:53 +0100
Message-Id: <20231218064253.9734-5-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231218064253.9734-1-peter.hilber@opensynergy.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT043:EE_|FR2P281MB1494:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07699800-7f4f-46ed-27f2-08dbff949e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qP3QNxVUv+Crp223lVj7jisdqcDmNunk8M49N+Uek+QuovPHljmasKTNEocTfeFkb2CNblRgMOpUAS7mCN9TS9ebIVVQPR23zFiNsjM810u686XYWbQTcEFLNX7ha85bNq43UYpaWRkZcliaICe5FHbR8mXhHkG7a/eU+3h5EJ1pCXMjmhspLaRKRdFpfk+uMgYq28QNvWiPxcqr4WMt5C9hPI694vZdJwjxYsCwUjGXcAETr3qb1CQy1pjSviBJy3iB5yg6nhKQuKV+JVsWURMmx35j2bmuh7Wtc1AJ+7Aa70+YQTArMNBEC0CGcyZaPa89LttOTlRMqSQVJxrExi19+WzWtPYniDHcf4QEFIofbII1Bi8+OVkzpuciysN6icOE0Cs00zdvwZb+EWH6WHiEquWrMHO6fKe9PInqgWHNiBtVv22Hv/6GH1CYg78vqo3EYfN4GqVckmWT5XrCrPhmLU6BXeBOco3ao6OmD2MsgILgLNW07Shx9ksSaQ5AkIii1lvdmodQ/FDlx/Tod5FmYg66hFZnxNJwY+IEsb0LIj7ZqSZkMr1xBR0fZ5/1Fp0R2ykqydV1ddG7ry8KcjVSbLYXTkqoaU7F036TQ3DNMw5T2fYSfQ1Rk7tbEAcL0w2zKz4dEBVOvZpnRse5ono+FXYTsJIrm0J1h+YLrOo/cuQpFvojgEd535ixAq38OrqMfy6T70/QpCcKfcUISqEBwaUXrSvxVCzQsUBWqoWRKr/VqpygqIbjkxQdSeuM2sVk+jfnQxhOjf8xjoNvz+25vGwRHg6kbEDWxSrhYqc=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(39830400003)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(46966006)(336012)(83380400001)(26005)(1076003)(2616005)(36860700001)(5660300002)(30864003)(47076005)(44832011)(4326008)(41300700001)(2906002)(478600001)(316002)(42186006)(54906003)(8936002)(8676002)(6916009)(70206006)(70586007)(36756003)(86362001)(81166007)(40480700001)(66899024)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:43:18.2438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07699800-7f4f-46ed-27f2-08dbff949e8b
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR05FT043.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1494
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28064.005
X-TMASE-Result: 10--7.882400-4.000000
X-TMASE-MatchedRID: ct/97+KAdbfJ+P2VFrJmrBbadjTjVCQ24DiXvcLDKwscZzGOQm4bA/tw
	xgEZhOUQDmwVuvw6qAzlE3nSJ4xeM4kc+IJJwSKg+D1d5hAWlOKgn19QHAlOzMx9UFi0LBBxv21
	r2VgXA9PeUtu7e4i/MHGNuqmNYtrLqjgbRUp1/V/cMvZsE7nbYs56jpj5lHHY9zxz+98nLbosSH
	PSI0C3QPR96TpHWrxScFUk+r7ZVw5dgAe1qwuvNJ4p07KVSE/ZCs3xNMYmxzSXYoGYte3R6jBqq
	9BMe1Qa6orLJemuiFl5j5Cei3tGNzgBsGxYcLxPXUXX8QtsvILWRI6+saz/4SasEHYbGASRT0BR
	ZNI+YwbANog326X8vgFaXg5vJyaC8J0BxWW1D95qBJKosT8FWDnxJqun3snzbkV4e2xSge5E8D7
	91gk+VwCx9vvAtvZLug+KI9JuPxm0VtKbUXUE277rweoAIK8o
X-TMASE-XGENCLOUD: f3343121-c203-406e-a8d5-e616e9fa2926-0-0-200-0
X-TM-Deliver-Signature: 0EAE85E31C347CE38807ADED5CA7432A
X-TM-Addin-Auth: CPmAbtgeT2DXmwQA6WtGrQhb+eqf6KYKQrJIOVu9A/0ccrqGmPvtTy3GRpe
	PZkQ3oyS2KIJo5ZRL4GxBJC3kwW1VETNOZLVOVSZI3TfTzcUbLLfNbu2rUzVfFn2Fw8h91JflgH
	o9bXUVF+Q+k/zeYLB+yFKPo0ij2mQLtDxf4kJ46WifDs5IFReZgmv+G3HGt9wdxPGQ4pyLaMSlK
	BEvFUJSeSIE/bxcbkCAJC1vPgvb7FSh/A1GGhVS0sA+wwLpQiFK+V2gTg8GqB1V4j4r08o1cTe8
	aIBVupbqwLlB/18=.RQnB06MOE5vM26kq718YX8WFeCsC9K2qispGk53r2T1HIHAwRaSku2rntP
	MlZYLtoYt7MoCDDuqZNpUtBT8S7BoVvcUqpt7bpRFoYzZV5AB0OVUP80DN8k5jGqisQYhL1Z/GL
	3anlga7Pk2joz8yfIt6apZU4RdHbC8hohW+SCuCDoPvlUGQhTXCMFFjyOvcXYnQ6NrrHW/FQURZ
	wGdNaex/GCmciiejDhgzChggLI5JBEZHxJh78Yi/vspeatzH20AO3txU3syrrQjqBZACF/uk468
	G0aiKScYrj7RVAg0Rb94esTd4k8qdMl3ilJEiajEn80hWsV4M7t/HZCpF9A==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v3 4/4] virtio-rtc: Add normative statements for alarm feature

Add the normative statements for the alarm feature added previously.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 device-types/rtc/description.tex        | 150 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   4 +
 device-types/rtc/driver-conformance.tex |   2 +
 3 files changed, 156 insertions(+)

diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index fcd2f14186e6..e9d730167404 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
 VIRTIO_RTC_F_ALARM determines whether the device supports setting an
 alarm for some of the clocks.
 
+\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
+
+The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
+setting an alarm for any of its clocks.
+
 \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
 
 There is no configuration data for the device.
@@ -558,6 +563,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 this specification, the device MUST use the nanosecond as unit for
 field \field{clock_reading}.
 
+If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
+notification N for clock C with alarm time A, the device MUST, for all
+read requests of C which the driver marks as available after the device
+marked N as used, return a \field{clock_reading} which does not precede
+A, unless C stepped backwards before A.
+
 \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
 
 Through the optional alarm feature, the driver can set an alarm time. On
@@ -652,6 +663,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 Initially, \field{driver_alarm_time} is an allowed alarm time, and
 \field{alarm_enabled} is false.
 
+\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
+
+The device MAY retain both \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{driver_alarm_time} to an allowed alarm time.
+
+If the device did not retain \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, the device MUST
+initialize \field{alarm_enabled} to false.
+
+While \field{alarm_enabled} for a clock is true, the device MUST set the
+alarm time to \field{driver_alarm_time}.
+
+While \field{alarm_enabled} for a clock is false, the device MUST act as
+if the alarm time was in the future.
+
+If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
+messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
+more clocks.
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
+alarm messages.
+
+The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
+virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
+messages, and clear the flag otherwise.
+
+The device MUST consider it an alarm expiration event when the
+associated clock progresses (also: steps) from a time prior to the alarm
+time to the alarm time, or to a time after the alarm time.
+
+The device MUST consider it an alarm expiration event when the
+driver sets an alarm time which the associated clock has already reached
+or passed.
+
+If the device retained \field{driver_alarm_time} and
+\field{alarm_enabled} of a clock across a device reset, and the clock
+has already reached or passed the alarm time, the device MUST consider
+this device reset an alarm expiration event.
+
+If an alarm expiration event E happens, the device MUST start serving
+the alarm expiration event E.
+
+If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
+serving any previous alarm expiration event for C, within a grace
+period.
+
+If a clock C steps to a time previous to C's alarm time, the device MUST
+stop serving any previous alarm expiration event for C, within a grace
+period.
+
+If an alarm expiration event happens for clock C, the device MUST stop
+serving any previous alarm expiration event for C, within a grace
+period.
+
+If the device is currently serving an alarm expiration event E, the
+device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
+soon as an alarmq buffer is available for this purpose.
+
+While the device is serving an alarm expiration event, the device MAY
+execute implementation-specific alarm actions.
+
+The device MAY ignore the device status when executing
+implementation-specific alarm actions.
+
+The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
+executing implementation-specific alarm actions.
+
 \paragraph{Alarm Control Requests}
 
 If VIRTIO_RTC_F_ALARM is negotiated,
@@ -750,6 +834,59 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 \field{driver_alarm_time}.
 \end{description}
 
+\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
+specification, the driver MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+
+If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+If the clock does not support alarm messages, the device MUST set status
+VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
+VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set field
+\field{alarm_time} to \field{driver_alarm_time}.
+
+For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} in field \field{flags} if
+\field{alarm_enabled} is true, and clear the flag otherwise.
+
+For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{alarm_time} field.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{driver_alarm_time} to the time
+represented by field \field{alarm_time}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to true if flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
+the device MUST set \field{alarm_enabled} to false if flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to true if flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is set in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
+\field{alarm_enabled} to false if flag
+\field{VIRTIO_RTC_FLAG_ALARM_ENABLED} is cleared in field \field{flags}.
+
+If the device sets status VIRTIO_RTC_S_OK for
+VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain
+\field{driver_alarm_time}.
+
 \paragraph{Alarm Notifications}
 
 If the alarmq is present, the driver should make buffers available in
@@ -785,3 +922,16 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
 
 \field{clock_id} identifies the expired alarm through its associated
 clock.
+
+\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+If VIRTIO_RTC_F_ALARM was negotiated, the driver SHOULD populate the
+alarmq with buffers.
+
+The driver MUST allocate enough space for any alarmq message in the
+device-writable part of an alarmq buffer.
+
+\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
+
+The device MUST NOT send a VIRTIO_RTC_NOTIF_ALARM notification for a
+clock which does not support alarm messages.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
index 4303cd450542..705691a7319f 100644
--- a/device-types/rtc/device-conformance.tex
+++ b/device-types/rtc/device-conformance.tex
@@ -3,7 +3,11 @@
 An RTC device MUST conform to the following normative statements:
 
 \begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
index 689c18d158d0..a87c4cde99c2 100644
--- a/device-types/rtc/driver-conformance.tex
+++ b/device-types/rtc/driver-conformance.tex
@@ -6,4 +6,6 @@
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
 \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
 \end{itemize}
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


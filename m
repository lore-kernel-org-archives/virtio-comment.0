Return-Path: <virtio-comment-return-7457-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ACCCD37B0
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:36:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF27F2A8DD
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:36:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4BBC986533
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:36:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AAE15986423; Mon, 18 Sep 2023 17:36:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98110986427
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 17:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHfKKYMB3YtfWnqI+cT8YxvcNXJgiP1n9UYbHxpF5IgvviyqgPHf65meO2yWehET0l1nULAAIPorbhKiu2D1P27lzJCrT9H/ODkKUYjQ9+xcbl2G/qDTT8Ld2sRJvt+DA+PFQLTQTUhqTCG1Ya1KrnbYREVSaorEib5TpKe+q7Dq3qXEBJ79UAMMY9GAJU0TTBQ+ojypnCjjEMfFBZa30fbJVxocr8RsyrvPj36hQHP/ifdnbAZMIPd25ACQ1HNGatbUJLap0pXmDDMlZj8KDUYqLxaL9UUQWmrWHRvGZtTqA24CDRA01CC+4tXo9P1DClfETAMbKoBpY/zPMcJ7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWfbXQZeGkGgNU8lCpMqSDDJ7+HoAPFNcWXWgIBPdUg=;
 b=A0N5DUvVeAK6aDbQZOZHOQ0Mb1reCiFoIM9FEfoR5qSs+hyGpWSeIL9hM8tPH2zJV0grjivg/jL4bG+Lkotl5ky0JtQRi6NrPx0n7cqFkK7DLCKnbYjxeUap6bYpYUjAe//PooK/WpprkG4ndLKC2qrRarzeVqtSI4FkC3D/LORdDmLeubVrXQ9vflB/m7MgKzP0hNxTwNhnPek62U8gVM6VouFgnZRO0sZAkh6Kv/lqeDvkVLgeWJGbBmxX+E6QDNzcsDpkFIlZ9V9fJvWJJ040VesMhqa6mn+shZg9xHcHRa2nQiqhwKXSNBOzpzSopBwL3PAr8s/GngkBOaVxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Sep 2023 20:35:18 +0300
Message-ID: <20230918173518.15900-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918173518.15900-1-parav@nvidia.com>
References: <20230918173518.15900-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9e2c27-a5e4-4726-2347-08dbb86db773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sAf1P6C28eypqJN4H4S/zn8aManEhC9lYLpF9uKKKp/KEaZ6m+/xW/YkOW24B1lBuOyH+EpKt56n7XjKF7lTOPGkW2zG/CM0f6TTuoyxsHOfTq/yI9zVzsrojKCQwAZxYm007QbgoOB6PbJxmBMxw5Zh/1znt6Aqe+uEXnVJgBNRK11HIp47SaBlAY+kJbuwwza4rj6uuvL6DHFtaXTU+39w5uMDUEcQrTgm25zYgxGp5UniLmvpJI7PmFY7CR2WjNXl/nQKpGwDXSwlKbeEH2YpibshcDpalpZjCvoTFERnNJAWt3gdvUTOEsBsFOCtjxRUxFoi6vtJ4L5EmGFHlzkctOfxq200ZOsq5RDr0cGVV4dVMUK9/EZVCuGkbbjfqCjRHbsg7jTTxgYzir/sZ/choA/u8reiTkUJj8KgRThfOh7AmhOoy4osKs/b8OM6+Prj3cHG1KpJRXAFAmlWQc1XeRE7Bel4vluxD5WSn9ViOMTNqsL6p/qfSD1ZBR/VBQGPu7ddEVy8+8uPU/4k+nQi+Bdxu/zPPElqowewIRVi9Y5Bef5E/hOd7ZJEZiV7NKuUmpEEHcf2Du0xXEKCIcu5fZ6To7lSSDEyoe53/LZ/KPs8cqToia6ljOIW9cfSGQ1c/JccdX3oa38TYypcXC1FUmPK2/DQLjF0xIKwWuwySG3paErvxOo82xqa3+ej6WeQHx6XsbOPQs/t0Q5L/3RcTybGvbz0/C9MW1NIuiIC0XfqU5nzmXnpy2m2wFEhtLXATkZYWgPlpaQCVODWYzpvuZJHYGf287oKaIAed2I=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(54906003)(70206006)(4326008)(70586007)(41300700001)(110136005)(316002)(16526019)(426003)(336012)(26005)(2906002)(2616005)(107886003)(8676002)(8936002)(83380400001)(1076003)(478600001)(5660300002)(47076005)(36860700001)(7636003)(86362001)(966005)(82740400003)(356005)(36756003)(6666004)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 17:35:56.9904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9e2c27-a5e4-4726-2347-08dbb86db773
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
Subject: [virtio-comment] [PATCH v2 2/2] content: Support enabling virtqueue after DRIVER_OK stage

Currently, a virtqueue must be enabled before driver has set the
DRIVER_OK status bit.

spec citation to section "Driver Requirements: Device Initialization"

"Perform device-specific setup, including discovery of virtqueues
for the device, optional per-bus setup, reading and possibly writing
the device’s virtio configuration space, and population of virtqueues."

This implies that a virtqueue must be enabled before reaching the
DRIVER_OK stage. There was no explicit mention about ability to
enable the virtqueue after DRIVER_OK stage.

In following usecases, creating a virtqueue after DRIVER_OK phase is
desired.

1. Dynamically create aq when administrative commands to be used.
2. Dynamically create the net device tx/rxq when device is
   opened when deploying for a container.
   In a container, number of virtqueues to be used may be <= max queues.
3. Dynamically create flow filter queues of netdevice when
   ARFS or ethtool filters are enabled as listed in [1].
4. Dynamically create rtc functionality related read virtqueue only
   when net device when timestamping to be used.
5. When XDP program is set, one can create additional XDP specific
   queues without affecting existing queues.

Hence, This patch introduces an existing queue enable and disable
(aka reset) facility and a new feature bit to explicitly indicate such
support by the device.

With this feature, drivers can skip optional queues creation during
driver init time. For example, a Linux net device driver
can create/destroy the transmit and receive queues when net device's
ndo_open() and ndo_stop() callbacks are invoked respectively.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
- fixed comments from Michael
- reduced device and driver normatives (simplified)
- replace 'a virtqueue' to 'the virtqueues'
- reworded to remove 'interested'
- avoided repeated 'device initialization text', replaced with
  DRIVER_OK status bit language
- avoided confusing text around 'MAY' in the requirements
- replaced 'the queue' to 'specific virtqueues'
- replaced queue to virtqueue
- simplified commit log to talk about msix
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section
---
 conformance.tex |  2 ++
 content.tex     | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 863f9c5..75de58c 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -77,6 +77,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -164,6 +165,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
diff --git a/content.tex b/content.tex
index 0a62dce..1a296a9 100644
--- a/content.tex
+++ b/content.tex
@@ -102,7 +102,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \item[24 to 41] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -440,6 +440,38 @@ \subsubsection{Virtqueue Re-enable}\label{sec:Basic Facilities of a Virtio Devic
 as during initial virtqueue discovery, but optionally with different
 parameters.
 
+\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the virtqueues
+during the device initialization sequence, i.e. after the device sets the
+FEATURES_OK status bit and before the driver setting the DRIVER_OK status bit.
+
+When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid enabling the
+virtqueues before setting the DRIVER_OK status bit; the driver can enable the
+specific virtqueues after the driver has set the DRIVER_OK status bit.
+The virtqueue enable mechanism is transport specific.
+
+\devicenormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is negotiated, the device MUST allow enabling the
+virtqueue which was not enabled during the device initialization phase
+i.e. after the device has set the FEATURES_OK status bit and before the
+driver has set the DRIVER_OK status bit.
+
+\drivernormative{\paragraph}{Enable Virtqueues}{Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues / Enable Virtqueues}
+
+When VIRTIO_F_RING_DYNAMIC is negotiated,
+\begin{itemize}
+\item the driver MAY enable some or all the virtqueues after the driver has set the
+      DRIVER_OK status bit.
+
+\item the driver MAY enable some of the virtqueues or all the virtqueues or none of
+      the virtqueues before the driver has set the DRIVER_OK status bit.
+\end{itemize}
+
+When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable the
+required number of virtqueues before setting the DRIVER_OK status bit.
+
 \input{split-ring.tex}
 
 \input{packed-ring.tex}
@@ -537,7 +569,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} Perform device-specific setup, including discovery of virtqueues for the
    device, optional per-bus setup, reading and possibly writing the
-   device's virtio configuration space, and population of virtqueues.
+   device's virtio configuration space.
+
+\item\label{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} Configure and enable the virtqueues.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
    ``live''.
@@ -551,6 +585,10 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 The driver MUST NOT send any buffer available notifications to
 the device before setting DRIVER_OK.
 
+The driver MAY skip step
+\ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup}
+when driver has negotiated VIRTIO_F_RING_DYNAMIC feature.
+
 \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
 Legacy devices did not support the FEATURES_OK status bit, and thus did
 not have a graceful way for the device to indicate unsupported feature
@@ -569,7 +607,7 @@ \subsection{Legacy Interface: Device Initialization}\label{sec:General Initializ
 Initialization / Re-read FEATURES-OK} were omitted, and steps
 \ref{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits},
-\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
+\ref{itm:General Initialization And Device Operation / Device Initialization / Device-specific Setup}, \ref{itm:General Initialization And Device Operation / Device Initialization / Virtqueue Setup} and \ref{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK}
 were conflated.
 
 Therefore, when using the legacy interface:
@@ -872,6 +910,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_RING_DYNAMIC(42)] This feature indicates
+  that the driver can enable the virtqueues individually after the driver has
+  set the status bit of DRIVER_OK.
+  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Dynamic Virtqueues}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.34.1


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


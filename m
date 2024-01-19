Return-Path: <virtio-comment-return-8970-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B20C47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 308DD71F4B
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F7399867DB
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:25:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 149429867C5; Fri, 19 Jan 2024 19:25:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 073269867C7
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN0jF5VJ4jqepXK82b00pKfbBh3B6LukGiPclGeJdKUzrZ4D3ZCIjpPIUwAZ2PIWHS9K1nrUmTvRQ2Xlyt5KY/NDbCTyBE1iWheTQByISdUJFGqaNI1b3nebT4y0a2mfhpkFPUP8Adp+C3ikApy8X9ueT3oXMm+yogpf4M3uTJ9QB9Px7Mzw+XU0smghvozF0C35Uhod3pFg0TCAgZRrW/lYEEIK8D0sPQPCphyDgjXkDqH2IvSEPVQ0MFcAuyXCdGvIN2qEhXEMoqqx30xKHGssQXnSyhNRR1gCBHmeFgo2fksUvb+wm3+cxs8jyaOHv/KBA9ze1bOZOX6VisnuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UojhLTV2ylC9va6RTlmbt2+7vz6+cSDwSvSFbZi4S6I=;
 b=b5L7QTPzjrTMUO017FLU+OfOguyPx89PzkdUT5KoAzhVcg/ZWo7Q0G3J1XazeTtj3KapOEsOLi4vX1cHe5U4CspuG/RnSvnn6+L71WvjG7h8FHPsRRnEbA8IJa6I9/FRT5zxMpE4tXxD7op0SnUk8kTEr7Tm6k+hTnnTd/+bmE/XJR9OYK4GRGcRd/gbvACHrCYSXvpy+T0BmydZFJ4ajD2s9mEEBoiarg022MrT+/DVOTXhu8hHe+1EReTFRz4MOmPTSGC1b0l/n4JEUbtt5qcn8wIYk1BsaES1J0MF25dO5/2E7waTVzvb4CiIvlCVE2IJ21fqHmVXIaekSJLNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 19 Jan 2024 21:24:42 +0200
Message-ID: <20240119192452.3571467-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119192452.3571467-1-parav@nvidia.com>
References: <20240119192452.3571467-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|PH0PR12MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: cde276a3-4c4d-4322-3731-08dc19246f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Ir8AapmZ6PLVJUivg1dyK+MBp+6hctGx+Fcp7j3YCKxTepg23TWo5Xe+VFBKcM7vuTXpTwVE8zvhzt9jXDpvOk1FqsPKAFi/D3xaVO66DiWegYGMIeeCykFHTk+F/DTwS4rtz8sMZHdLb0Y8J5xDM9PcShjJeQEWYJ/iz6AXTC4YJEAVV7p1CiS46OpvGK8J1WUj10IC2eKAB4Zm4QlY76VPNtd2mwGnqoT9GFji7OBawO/49NCMkcTcs3B5cYXe7QVJJ9Am7jct1qv/T51rOMx4qUxXKqPFctZb5cvgzOFja3iikjzYXqdhGi5QefYBAhsq5Iu85IGCDn+9q7cFZt1F3e9100YsbuTyGeImNwsLmEnbCw7Uc0Q7NCHtBNNbx1EMMe3PRM8AjtuHtBcwQQc3bkBfnhzeb7uw87VgPx5HxzZNfPugLt6fUovZQe0129LFqOWJh102BMbWLYHRuolEjUrqRlyImuYd8i1pj28yLUQa7lcu6wnb2aiFjXo/2diiMrCClKjV+iOIGDuKp0aK4ZnTzb5q4eR0ZePIdIFtr9//0JudA/x9L7anaKCsFkxN2s7BKGKetTwhHirnkz87sEFmp2HA5nRSZnxyg62lHob/72UcmNRYAjFXQSXyp2SGnwqX4Qee0Yr9J8MB77h/fY5o0oKqR2ZdKRCzaAo5qxPqxtkHxJXMkqDSKpOxYMRcwTEw1KVihXsQvq4D8g9+jBF8/ghOD27LyvHgZ+wWyyzqJwgpiRAixJyHZ99t81wqPnMin2TGW3d4W+yg69OFovabIrBKKjX6izh+GY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(36756003)(36860700001)(2906002)(41300700001)(426003)(336012)(966005)(6666004)(478600001)(47076005)(16526019)(2616005)(107886003)(4326008)(8676002)(83380400001)(8936002)(1076003)(5660300002)(54906003)(26005)(86362001)(316002)(110136005)(356005)(40460700003)(82740400003)(40480700001)(7636003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:25:45.8517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde276a3-4c4d-4322-3731-08dc19246f89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8823
Subject: [virtio-comment] [PATCH v7 03/13] capabilities: Add theory of operation for capabilities

Device capabilities indicate supported functionalities and
resources of the device to the driver.

Driver capabilities indicate functionalities and resources which
driver will be using. Driver capabilities are subset of the device
capabilities.

Add theory of operation describing it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 capabilities.tex | 40 ++++++++++++++++++++++++++++++++++++++++
 content.tex      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 capabilities.tex

diff --git a/capabilities.tex b/capabilities.tex
new file mode 100644
index 0000000..c375089
--- /dev/null
+++ b/capabilities.tex
@@ -0,0 +1,40 @@
+\section{Device and Driver Capabilities}\label{sec:Basic Facilities of a Virtio Device / Device and Driver Capabilities}
+
+Device capabilities indicate supported functionalities and
+resources of the device. Each device capability is identified by its
+unique identifier.The driver uses the administration command to read
+the device capabilities. The device indicates supported capabilities to the
+driver as a bitmap of identifiers. The driver uses the administration command
+to read the supported capabilities bitmap.
+
+The driver writes the capabilities in the device before performing any operation
+related to the capabilities. The driver uses the administration command to write
+the driver capabilities thereby either enable or disable a certain
+device functionality. The driver can write the capabilities at any time
+as long as there is no pending operation in progress at the device level related
+to the capability.
+
+For a defined device capability identifier, the device capability fields do not
+grow. A new capability should be added with a new identifier when a adding a
+device functionality or when extending the existing device functionality.
+This ensures backward and forward compatibility between the driver and the
+device as well as logical separation of related capabilities.
+
+The device capabilities are divided into two ranges by the identifiers
+as listed:
+
+\begin{tabularx}{\textwidth}{ |l|X| }
+\hline
+Identifier & Description  \\
+\hline \hline
+0x0000-0x07ff & Generic capabilities for all device types \\
+\hline
+0x0800-0x0fff & Device type specific capabilities \\
+\hline
+0x1000 - 0xFFFF & Reserved for future \\
+\hline
+\end{tabularx}
+
+Whichever device supports the device specific capabilities, such
+capabilities are described in the respective \field{Device and Driver Capabilities}
+section of the device.
diff --git a/content.tex b/content.tex
index 98b9c31..4938fc0 100644
--- a/content.tex
+++ b/content.tex
@@ -502,6 +502,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 types. It is RECOMMENDED that devices generate version 4
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
+\input{capabilities.tex}
 \input{admin.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
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


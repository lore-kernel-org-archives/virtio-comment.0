Return-Path: <virtio-comment-return-9078-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B5C4828F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6BC5B22366
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 593D39868F4
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4D2F19868D8; Wed,  7 Feb 2024 07:24:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3FCAF9868DE
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVSB8hOEvrjchoyCenK5Wo1v8cRIfzIO3IXtjJVl0t1fhWQha+QpQMhRrs4RPK8LMvQvQ6pKDz9/UPFUUK6hKui2rqTF2RtWZUaPaOMWJ60GqXOhqGuej7wmjUzf5/Tvwbrc/juq/PhfSHuF+NN+/Brc34n6CgnDYhBcyxcULLE7f4L1Qct3Dr775cY0klB+HVFUMXKp9UfKKUbkHEHp39ANMdqCzVkXmLIc+i59LXhQM6WHSb37shsKJBvEGll7U5RO5yB0Hdj7cYV8G4hYX1mlfU2KyGoyH9lw64Y09hCtXaVhiSCqQVXUCs9qGZUcan6PWwv2kdfE5V+EbedkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UojhLTV2ylC9va6RTlmbt2+7vz6+cSDwSvSFbZi4S6I=;
 b=JFKJleh7enM90Cgo8m4pzZHODwIBjKsUh9XoQnfa6qQsMfKk3tlK4wnvVJlnvgepqa/3BL81iz5h1wj+BsFmclibBATqSAbSsw9g39FRXtO/P1AQ8ci2Qa+TeS1gGz7fM5MPNpiALSXiD3QJkZ3b/lATZjWXpmGe0gF366NzLhq//03gDW8UL0M2OnsLCbLD1t9tv1Gh1qVbKbY498N3N+ulphl1fK27FB2jGfYPWMTntKW9CuUvqumYvJvvH7W8+u+cHAXYwYtaoMDV8JPfOnmrVrtIHcmVNEilLL9LDIfjsGXteyp1iXuullK8Vu2ygVtRI7RN++THL3qu/3zlRQ==
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
Date: Wed, 7 Feb 2024 09:23:26 +0200
Message-ID: <20240207072336.477606-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd20228-36c6-49aa-504f-08dc27adc7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sVdURpH/mReMkyWuNMUi5dHc1uBn8IuUBmzRcia4TUmvLEnFR5fPBRk4C8sn6vXcmr1BxorYDlGrP3nzeMobMVW0kZIxZCbg+/mN6RiyZB2Tg42h3ue5nTbzq5cKqyvsD/ys71aajCAc/eseEtB4XY5mk3VDTthANOUVPSvGQwy6An/iVm37InJ4FgkOPaHQF2egejMaY+RbLaeCFcu4DkHKvKf865FA4tPVkSApYewu6ceWkRhhA19HRvB4CpPF3OIHm8mdV2wC+MKaZT94d1XzFPW+rlKe/U1vFAbxKjuSzYf59Li+QwZfwI4VzpPRVNFZJObrXXdalgUHtIEUQ093adE+noY6OmWN0h6NfLrUGSqaHRrDBxhhUnMT/s4RLPf61JnoDb06Gsg6Grizh4icqNwXtYlDDZzbkhf1XZfC82Quw9Bi+1GMzLdad+zhDcRIyQoFXIUdNwcOHYBrA0ajRYaMZFjoogQ+PeWCfYzpcOGHFhKXbEgEBb2hS80zDR04WrvRGYJGtCoaNlrLnI45gAFW5EFcckC8o+kWSS8M/0YnZJHggQ7CrxQQSmmChmmaPrXZNHe/QFyJ83fLmgk+imbVlU1xf5Ar8Xir20yWjXcLDw0CyqdyQKpWf4Vvri7cfhfLFreyZxACtFz9NjowRGcBiKJWGtOnkTgIXR06j8D0wXUs84/eRtzRaNZIf4QI6rcHzsVMbiqgT2+yHk0ZgWv0MwcZwwma+jyuF9blItkcCCGryaNGEbSjvTS0s09s8bEBgjdntuEvEaFgtPxfcwkJNi77fcpHBXV4qqA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799012)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(41300700001)(26005)(107886003)(16526019)(336012)(6666004)(1076003)(82740400003)(47076005)(4326008)(8676002)(478600001)(5660300002)(966005)(54906003)(110136005)(316002)(7636003)(356005)(2616005)(83380400001)(86362001)(426003)(36860700001)(70206006)(70586007)(2906002)(36756003)(8936002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:11.0268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd20228-36c6-49aa-504f-08dc27adc7a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
Subject: [virtio-comment] [PATCH v9 03/13] capabilities: Add theory of operation for capabilities

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

